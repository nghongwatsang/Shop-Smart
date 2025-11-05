import requests
from typing import Tuple, Dict, Optional

class RouteService:
    """Service for handling route calculations using OSRM"""
    
    OSRM_BASE_URL = "http://router.project-osrm.org/route/v1/driving"
    
    @classmethod
    def get_route_info(
        cls, 
        start: Tuple[float, float], 
        end: Tuple[float, float]
    ) -> Dict[str, float]:
        """
        Get route information between two points using OSRM
        
        Args:
            start: Tuple of (latitude, longitude) for the starting point
            end: Tuple of (latitude, longitude) for the destination point
            
        Returns:
            Dictionary containing distance (in miles) and duration (in minutes)
        """
        try:
            # Format: lon,lat;lon,lat
            coordinates = f"{start[1]},{start[0]};{end[1]},{end[0]}"
            url = f"{cls.OSRM_BASE_URL}/{coordinates}?overview=false"
            
            response = requests.get(url, timeout=10)
            response.raise_for_status()
            
            data = response.json()
            
            if not data.get('routes') or not data['routes']:
                raise ValueError("No route found between the specified points")
                
            route = data["routes"][0]
            
            # Convert meters to miles and seconds to minutes
            distance_miles = route["distance"] * 0.000621371
            duration_minutes = route["duration"] / 60
            
            return {
                'distance_miles': round(distance_miles, 2),
                'duration_minutes': round(duration_minutes, 1),
                'status': 'success'
            }
            
        except requests.exceptions.RequestException as e:
            return {
                'status': 'error',
                'message': f'Error fetching route: {str(e)}'
            }
        except (KeyError, IndexError) as e:
            return {
                'status': 'error',
                'message': 'Invalid response from routing service'
            }
