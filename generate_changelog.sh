#!/bin/bash
git log --pretty=format:'- %s (%an)' origin/master..HEAD > CHANGELOG.md
