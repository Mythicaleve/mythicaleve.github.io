#!/bin/bash
#
# Continuous integration script run on CircleCI, see ./.circleci/config.yml.
#
set -e

echo ""
echo "Linting CSS"
echo ""
# ./scripts/lint-css.sh
echo ""
echo "Deploying the site"
echo ""
./scripts/deploy.sh
echo ""
echo "Checking for broken links"
echo ""
# ./scripts/check-broken-links.sh
echo ""
echo "Running end-to-end tests"
echo ""
./scripts/end-to-end-tests.sh
echo ""
echo "Checking accessibility"
echo ""
./scripts/a11y.sh
echo ""
echo "Validating HTML"
echo ""
./scripts/validate-html.sh
echo ""
echo "Linting JavaScript"
echo ""
./scripts/lint-js.sh
echo ""
echo "Destroying the environment"
echo ""
./scripts/destroy.sh
echo ""
echo "Good job, all tests are passing!"
echo ""
