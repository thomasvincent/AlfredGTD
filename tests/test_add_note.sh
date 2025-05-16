#!/bin/bash
# Test script for add_note.scpt

# Set up colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory of the test script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_DIR="$DIR/../workflow/scripts"

# Print test header
echo -e "${YELLOW}Running tests for add_note.scpt...${NC}"

# Counter for passed and failed tests
PASSED=0
FAILED=0

# Test 1: Check if the script file exists
echo -n "Test 1: Check if script file exists... "
if [ -f "$SCRIPT_DIR/add_note.scpt" ]; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Script file not found"
    FAILED=$((FAILED+1))
fi

# Test 2: Check for Notes integration
echo -n "Test 2: Check for Notes integration... "
if grep -q "tell application \"Notes\"" "$SCRIPT_DIR/add_note.scpt"; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Missing Notes integration"
    FAILED=$((FAILED+1))
fi

# Test 3: Check for notification functionality
echo -n "Test 3: Check for notification functionality... "
if grep -q "display notification" "$SCRIPT_DIR/add_note.scpt"; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Missing notification functionality"
    FAILED=$((FAILED+1))
fi

# Test 4: Check for alternative implementations
echo -n "Test 4: Check for alternative implementations... "
if grep -q "addNoteToEvernote" "$SCRIPT_DIR/add_note.scpt" && \
   grep -q "addNoteToDevonthink" "$SCRIPT_DIR/add_note.scpt" && \
   grep -q "addNoteToNotion" "$SCRIPT_DIR/add_note.scpt"; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Missing alternative implementations"
    FAILED=$((FAILED+1))
fi

# Print summary
echo -e "\n${YELLOW}Test Summary:${NC}"
echo -e "${GREEN}$PASSED tests passed${NC}"
echo -e "${RED}$FAILED tests failed${NC}"
echo -e "${YELLOW}$((PASSED+FAILED)) total tests${NC}"

# Return exit code based on test results
if [ $FAILED -eq 0 ]; then
    echo -e "\n${GREEN}All tests PASSED!${NC}"
    exit 0
else
    echo -e "\n${RED}Some tests FAILED!${NC}"
    exit 1
fi