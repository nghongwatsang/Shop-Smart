import pytest
from src.application.services.route_service import RouteService

class TestRouteService:
    def test_get_route_info_success(self, mock_osrm_response):
        """Test successful route calculation."""
        start = (40.748817, -73.985428)  # NYC
        end = (40.730610, -73.935242)    # Brooklyn
        
        result = RouteService.get_route_info(start, end)
        
        assert result['status'] == 'success'
        assert 'distance_miles' in result
        assert 'duration_minutes' in result
        assert isinstance(result['distance_miles'], float)
        assert isinstance(result['duration_minutes'], float)
        assert result['distance_miles'] > 0
        assert result['duration_minutes'] > 0
    
    def test_get_route_info_invalid_coordinates(self):
        """Test with invalid coordinates."""
        # Invalid latitude (should be between -90 and 90)
        start = (100.0, -73.985428)
        end = (40.730610, -73.935242)
        
        result = RouteService.get_route_info(start, end)
        
        assert result['status'] == 'error'
        assert 'message' in result
    
    def test_get_route_info_network_error(self, monkeypatch):
        """Test handling of network errors."""
        def mock_get(*args, **kwargs):
            raise requests.exceptions.RequestException("Network error")
            
        import requests
        monkeypatch.setattr(requests, 'get', mock_get)
        
        start = (40.748817, -73.985428)
        end = (40.730610, -73.935242)
        
        result = RouteService.get_route_info(start, end)
        
        assert result['status'] == 'error'
        assert 'Network error' in result['message']
    
    def test_get_route_info_invalid_response(self, monkeypatch):
        """Test handling of invalid API response."""
        def mock_get(*args, **kwargs):
            class MockResponse:
                def json(self):
                    return {"invalid": "response"}
                
                def raise_for_status(self):
                    pass
            
            return MockResponse()
            
        import requests
        monkeypatch.setattr(requests, 'get', mock_get)
        
        start = (40.748817, -73.985428)
        end = (40.730610, -73.935242)
        
        result = RouteService.get_route_info(start, end)
        
        assert result['status'] == 'error'
