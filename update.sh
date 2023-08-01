#!/bin/bash

# set color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# print header
echo -e "${YELLOW}Docker MOTD${NC}"

# check for update using git pull
echo -e "${YELLOW}Checking for updates...${NC}"
git pull
# if there was an update, say updated
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Updated! ✔${NC}"
    # exit the script, and restart it
    echo -e "${YELLOW}Restarting...${NC}"
    exec "$0"
elif [ $? -eq 1 ]; then
    echo -e "${GREEN}Up to date. ✔${NC}"
else
    echo -e "${RED}Error checking for updates. ✘${NC}"
fi


# delete previous deployment
echo -e "${YELLOW}Deleting previous deployment...${NC}"
rm -rf deployment

# create new deployment directory
echo -e "${YELLOW}Creating new deployment directory...${NC}"
mkdir deployment

# run compose
echo -e "${YELLOW}Running docker compose...${NC}"
docker compose up

# check if compose exited successfully
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Deployment successful! ✔${NC}"
else
    echo -e "${RED}Deployment failed. ✘${NC}"
fi

# debug lines
echo -e "\n${YELLOW}Debugging...${NC}"
echo -e "${YELLOW}Current directory: $(pwd)${NC}\n"
echo -e "${YELLOW}Deployment directory contents:${NC}\n"
ls deployment/
