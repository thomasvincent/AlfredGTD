#!/bin/bash
# Main test runner for AlfredGTD

# Set up colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the directory of the test script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Print test header
echo -e "${YELLOW}Running all tests for AlfredGTD...${NC}\n"

# Set up Docker container for testing if running in CI
if [ "$CI" = "true" ]; then
    echo "Setting up Docker container for testing..."
    # Docker setup commands would go here
    # For example: docker build -t alfredgtd-test -f Dockerfile.test .
    # docker run -v "$(pwd):/app" alfredgtd-test ./tests/run_tests.sh
fi

# Counter for passed and failed tests
PASSED=0
FAILED=0
TOTAL_TESTS=0

# Run test_add_task.sh
echo -e "${YELLOW}Running task tests...${NC}"
$DIR/test_add_task.sh
if [ $? -eq 0 ]; then
    PASSED=$((PASSED+1))
else
    FAILED=$((FAILED+1))
fi
TOTAL_TESTS=$((TOTAL_TESTS+1))
echo ""

# Run test_add_note.sh
echo -e "${YELLOW}Running note tests...${NC}"
$DIR/test_add_note.sh
if [ $? -eq 0 ]; then
    PASSED=$((PASSED+1))
else
    FAILED=$((FAILED+1))
fi
TOTAL_TESTS=$((TOTAL_TESTS+1))
echo ""

# Run test_add_project.sh
echo -e "${YELLOW}Running project tests...${NC}"
$DIR/test_add_project.sh
if [ $? -eq 0 ]; then
    PASSED=$((PASSED+1))
else
    FAILED=$((FAILED+1))
fi
TOTAL_TESTS=$((TOTAL_TESTS+1))
echo ""

# Run test_process_inbox.sh
echo -e "${YELLOW}Running inbox processing tests...${NC}"
$DIR/test_process_inbox.sh
if [ $? -eq 0 ]; then
    PASSED=$((PASSED+1))
else
    FAILED=$((FAILED+1))
fi
TOTAL_TESTS=$((TOTAL_TESTS+1))
echo ""

# Print summary
echo -e "${YELLOW}Test Summary:${NC}"
echo -e "${GREEN}$PASSED test suites passed${NC}"
echo -e "${RED}$FAILED test suites failed${NC}"
echo -e "${YELLOW}$TOTAL_TESTS total test suites${NC}"

# Return exit code based on test results
if [ $FAILED -eq 0 ]; then
    echo -e "\n${GREEN}All test suites PASSED!${NC}"
    exit 0
else
    echo -e "\n${RED}Some test suites FAILED!${NC}"
    exit 1
fi