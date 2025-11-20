# Getting Started with Implementation

## File Structure Created ✅

```
backend/scrapers/
├── core/                    # Core infrastructure (TODO: implement)
├── utils/                   # Shared utilities (TODO: implement)
├── output/                  # JSON output directories
│   ├── raw/                # Scraper outputs go here
│   └── processed/          # Processed data goes here
├── run_scrapers.py         # Orchestration script (TODO: implement)
└── REFACTORING_PLAN.md     # Detailed implementation plan
```

## What's Next?

### Step 1: Implement Core Models (Start Here)

File: `core/models.py`

**Goal:** Create the Product dataclass that all scrapers will use.

**Tasks:**

1. Define Product dataclass with these fields:
   - brand, name, price (Decimal), category
   - size, unit (optional), source, url (optional)
2. Add validation in `__post_init__`
3. Add `to_dict()` method
4. Write tests

**Reference:** Look at existing Product class in `base.py` line 11

---

### Step 2: Implement Parsing Utilities

File: `utils/parsers.py`

**Goal:** Extract reusable parsing logic from existing scrapers.

**Tasks:**

1. Implement `parse_price()` - look at existing price parsing in scrapers
2. Implement `parse_size()` - look at size extraction logic
3. Add tests with various formats

**Reference:** Look at `parse_brand_and_name()` in `base.py` line 148

---

### Step 3: Implement HTTP Client

File: `core/http_client.py`

**Goal:** Create reusable HTTP client with retry logic.

**Tasks:**

1. Implement HTTPClient class
2. Add retry with exponential backoff
3. Add rate limiting
4. Test with Aldi scraper

**Reference:** Look at session setup in `base.py` line 62

---

### Step 4: Refactor Aldi Scraper (First Migration)

File: `aldi/aldi_scraper.py`

**Goal:** Update Aldi scraper to use new core/utils.

**Tasks:**

1. Import from `core.models` instead of `base`
2. Use `HTTPClient` for requests
3. Use `utils.parsers` for parsing
4. Add `save_to_json()` method to write to `output/raw/aldi_products.json`
5. Test thoroughly

---

## Commands to Run

```bash
# Test the structure was created
ls -la backend/scrapers/core/
ls -la backend/scrapers/utils/
ls -la backend/scrapers/output/raw/

# When ready to implement:
cd backend/scrapers

# Step 1: Implement and test Product model
python -c "from core.models import Product; print('✓ Models imported')"

# Step 2: Implement and test parsers
python -c "from utils.parsers import parse_price; print(parse_price('$1.99'))"

# Step 3: Test HTTP client
python -c "from core.http_client import HTTPClient; client = HTTPClient(); print('✓ Client works')"

# Step 4: Test refactored Aldi scraper
python aldi/aldi_scraper.py

# Step 5: Check output
cat output/raw/aldi_products.json | head -20
```

## Testing Strategy

For each component you implement:

1. **Unit tests** - Test individual functions
2. **Integration tests** - Test with mock HTML
3. **Live test** - Test with actual website (limited)

Example test structure:

```
backend/tests/
├── test_models.py
├── test_parsers.py
├── test_http_client.py
└── fixtures/
    └── aldi_sample.html
```

## Pro Tips

1. **Start Small:** Implement Product model first, test it thoroughly
2. **Copy & Adapt:** Look at existing code in base.py for patterns
3. **Test Early:** Test each component before moving to next
4. **Keep It Working:** Don't break existing scrapers during refactor
5. **Git Commits:** Commit after each working component

## Questions to Answer As You Go

- [ ] Does Product validation catch bad data?
- [ ] Do parsers handle edge cases?
- [ ] Does HTTPClient retry on failures?
- [ ] Do refactored scrapers produce same output?
- [ ] Are JSON files in the correct format?

## When You're Ready

Just say which file you want to implement first, and we'll do it together step by step!

Recommended order:

1. `core/models.py` - Foundation for everything
2. `utils/parsers.py` - Needed by scrapers
3. `core/http_client.py` - Needed by Aldi
4. Refactor `aldi/aldi_scraper.py` - First migration
5. Continue with others...
