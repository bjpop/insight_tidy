#!/bin/bash

set -e
errors=0

# Run unit tests
python insight_tidy/insight_tidy_test.py || {
    echo "'python python/insight_tidy/insight_tidy_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E insight_tidy/*.py || {
    echo 'pylint -E insight_tidy/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
