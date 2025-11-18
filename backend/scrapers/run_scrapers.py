#!/usr/bin/env python3
"""
Orchestration script to run all store scrapers.

This script coordinates running multiple scrapers and manages their output.

TODO: Implement scraper orchestration
"""

import sys
from pathlib import Path
from typing import List, Tuple


# TODO: Implement run_scraper(scraper_class, client, limit)
# - Run a single scraper
# - Handle errors gracefully
# - Return (store_name, output_path, product_count)


# TODO: Implement run_all_sequential(limit=None)
# - Run all scrapers one by one
# - HTTP scrapers first (faster)
# - Then Selenium scrapers
# - Print summary at the end


# TODO: Implement run_all_parallel(limit=None)
# - Run HTTP scrapers in parallel
# - Be careful with rate limits
# - Handle Selenium scrapers separately (don't parallelize)


# TODO: Implement main() with argparse
# - --limit: Limit products per store
# - --parallel: Run in parallel
# - --store: Run single store only
# - --help: Show usage


if __name__ == "__main__":
    print("🚀 Scraper Orchestration")
    print("=" * 50)
    print("TODO: Implement run_scrapers.py")
    print()
    print("Usage (future):")
    print("  python run_scrapers.py --limit 100")
    print("  python run_scrapers.py --store aldi")
    print("  python run_scrapers.py --parallel")
