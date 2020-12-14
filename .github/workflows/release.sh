name: Release

on:
  workflow_dispatch:

jobs:
  regular-release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@v1
        with:
          python-version: 3.7
      - run: |
          pip install twine wheel
          ./scripts/release.sh
        env:
          TWINE_USERNAME: ${{ secrets.PYPI_USER }}
          TWINE_PASSWORD: ${{ secrets.PYPI_TOKEN }}
