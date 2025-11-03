# Shop Smart Backend

A Flask application following clean architecture principles.

## Project Structure

```
backend/
├── src/
│   ├── __init__.py         # Application factory
│   ├── domain/             # Enterprise business rules
│   │   ├── entities/       # Business objects
│   │   └── repositories/   # Interface definitions
│   ├── application/        # Application business rules
│   │   └── services/      # Use cases and application services
│   └── interfaces/         # Interface adapters
│       └── api/
│           └── v1/         # API version 1
├── .env.example           # Example environment variables
├── requirements.txt       # Python dependencies
└── run.py                # Application entry point
```

## Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd backend
   ```

2. **Set up a virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

5. **Initialize the database**
   ```bash
   flask db init
   flask db migrate -m "Initial migration"
   flask db upgrade
   ```

6. **Run the application**
   ```bash
   python run.py
   ```
   Or for development with auto-reload:
   ```bash
   FLASK_APP=run.py FLASK_ENV=development flask run
   ```

## API Endpoints

- `GET /api/v1/health` - Health check
- `GET /api/v1/example` - Example endpoint

## Development

### Running Tests
```bash
# Install test dependencies
pip install -r requirements-test.txt

# Run tests
pytest
```

### Database Migrations
```bash
# Create a new migration
flask db migrate -m "Description of changes"

# Apply migrations
flask db upgrade
```
