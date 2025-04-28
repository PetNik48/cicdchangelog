#!/bin/bash
git log --pretty=format:'- %s (%an)' origin/main..HEAD > CHANGELOG.md
