#!/bin/bash
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${CYAN}=== DevOps Student System Report ===${NC}"
echo ""

echo -e "${GREEN}========== Student Information ==========${NC}"
echo "Name:           Klim"
echo "Surname:        Fomin"
echo "Group:          IT2-2312"
echo "Student ID:     37073"
echo "Course:         DevOps"
echo ""

echo -e "${GREEN}========== System Information ==========${NC}"
echo "Username:       $(whoami)"
echo "Hostname:       $(hostname)"
echo "Current Date:   $(date '+%Y-%m-%d %H:%M:%S')"
echo "Operating System: $(uname -s) $(uname -r)"
echo ""
echo "Disk Usage:"
df -h / | tail -1
echo ""
echo "Memory Usage:"
free -h | grep -E "Mem|Swap"
echo ""

if [ -f "Fomin_Klim_info.txt" ]; then
    echo -e "${YELLOW}✓ Student information file exists.${NC}"
else
    echo -e "${YELLOW}✗ Student information file does not exist.${NC}"
fi

echo ""
echo -e "${CYAN}Report generated successfully!${NC}"
