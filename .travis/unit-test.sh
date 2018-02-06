#!/bin/bash

set -e
errors=0

# Run unit tests
Rscript -e "devtools::test('bionitio')" || {
    echo 'Rscript -e "devtools::test('bionitio')" failed'
    let errors+=1
}


[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : unit tests"
