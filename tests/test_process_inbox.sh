#!/bin/bash
# Test script for process_inbox.scpt

# Set up colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory of the test script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_DIR="$DIR/../workflow/scripts"

# Print test header
echo -e "${YELLOW}Running tests for process_inbox.scpt...${NC}"

# Counter for passed and failed tests
PASSED=0
FAILED=0

# Test 1: Check if the script file exists
echo -n "Test 1: Check if script file exists... "
if [ -f "$SCRIPT_DIR/process_inbox.scpt" ]; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Script file not found"
    FAILED=$((FAILED+1))
fi

# Test 2: Check for Reminders integration
echo -n "Test 2: Check for Reminders integration... "
if grep -q "tell application \"Reminders\"" "$SCRIPT_DIR/process_inbox.scpt"; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Missing Reminders integration"
    FAILED=$((FAILED+1))
fi

# Test 3: Check for dialog functionality
echo -n "Test 3: Check for dialog functionality... "
if grep -q "display dialog" "$SCRIPT_DIR/process_inbox.scpt"; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Missing dialog functionality"
    FAILED=$((FAILED+1))
fi

# Test 4: Check for alternative implementations
echo -n "Test 4: Check for alternative implementations... "
if grep -q "processThingsInbox" "$SCRIPT_DIR/process_inbox.scpt" && \
   grep -q "processOmniFocusInbox" "$SCRIPT_DIR/process_inbox.scpt" && \
   grep -q "processTodoistInbox" "$SCRIPT_DIR/process_inbox.scpt"; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Missing alternative implementations"
    FAILED=$((FAILED+1))
fi

# Test 5: Check for GTD processing steps
echo -n "Test 5: Check for GTD processing steps... "
if grep -q "GTD Inbox Processing" "$SCRIPT_DIR/process_inbox.scpt" && \
   grep -q "What is it" "$SCRIPT_DIR/process_inbox.scpt" && \
   grep -q "Is it actionable" "$SCRIPT_DIR/process_inbox.scpt"; then
    echo -e "${GREEN}PASSED${NC}"
    PASSED=$((PASSED+1))
else
    echo -e "${RED}FAILED${NC} - Missing GTD processing steps"
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