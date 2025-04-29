#!/bin/bash
# Generate Changelog
echo "# Changelog" > CHANGELOG.md
echo "" >> CHANGELOG.md
git log origin/main --pretty=format:'- %s (%an, %ad)' --date=short >> CHANGELOG.md
