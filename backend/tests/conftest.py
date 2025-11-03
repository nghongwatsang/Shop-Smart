import os
import sys
import tempfile
import pytest
from src import create_app, db as _db
from src.application.services.route_service import RouteService

# Add the src directory to the Python path
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

@pytest.fixture(scope='session')
def app():
    """Create and configure a new app instance for testing."""
    # Create a temporary file to isolate the database for each test
    db_fd, db_path = tempfile.mkstemp()
    
    app = create_app()
    app.config.update({
        'TESTING': True,
        'SQLALCHEMY_DATABASE_URI': f'sqlite:///{db_path}',
        'WTF_CSRF_ENABLED': False,
    })

    # Create the database and load test data
    with app.app_context():
        _db.create_all()

    yield app

    # Clean up the temporary database
    os.unlink(db_path)


@pytest.fixture(scope='function')
def client(app):
    """A test client for the app."""
    return app.test_client()


@pytest.fixture(scope='function')
def runner(app):
    """A test runner for the app's Click commands."""
    return app.test_cli_runner()


@pytest.fixture
def mock_osrm_response(monkeypatch):
    """Mock the OSRM API response."""
    def mock_get(*args, **kwargs):
        class MockResponse:
            def __init__(self, json_data, status_code):
                self.json_data = json_data
                self.status_code = status_code
            
            def json(self):
                return self.json_data
            
            def raise_for_status(self):
                if self.status_code >= 400:
                    raise requests.exceptions.HTTPError("Mocked error")
        
        # Sample successful response
        if '127.0.0.1' in args[0]:  # For testing error cases
            return MockResponse({"error": "Invalid coordinates"}, 400)
            
        return MockResponse({
            "routes": [{
                "distance": 8046.7,  # meters (~5 miles)
                "duration": 1234.5,  # seconds (~20.6 minutes)
            }],
            "waypoints": [
                {"location": [-73.985428, 40.748817]},
                {"location": [-73.935242, 40.730610]}
            ],
            "code": "Ok"
        }, 200)

    import requests
    monkeypatch.setattr(requests, 'get', mock_get)
    return mock_get
