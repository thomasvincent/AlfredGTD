#!/bin/bash
# Script to build Alfred workflow file

# Set up colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get script directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKFLOW_DIR="$DIR/workflow"
VERSION=$(grep -o '"version":[[:space:]]*"[^"]*"' "$WORKFLOW_DIR/info.plist" | cut -d'"' -f4)

# Print header
echo -e "${YELLOW}Building AlfredGTD workflow version $VERSION...${NC}"

# Create build directory if it doesn't exist
if [ ! -d "$DIR/build" ]; then
    mkdir -p "$DIR/build"
fi

# Create a zip file with all workflow contents
cd "$WORKFLOW_DIR"
zip -r "$DIR/build/AlfredGTD-v$VERSION.alfredworkflow" . -x "*.DS_Store" -x "*/\.*"

# Check if zip was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build successful!${NC}"
    echo -e "Workflow file created at:${NC} build/AlfredGTD-v$VERSION.alfredworkflow"
else
    echo -e "${RED}Build failed!${NC}"
    exit 1
fi