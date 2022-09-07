#!/bin/bash
#
# Display a user link.
#
set -e

source ./config/versioned
echo ""
echo "Visit http://0.0.0.0:$DOCKERPORT to see the site locally."
echo ""
echo "Use ./scripts/destroy.sh to completely stop the local Docker development environment."
echo ""
