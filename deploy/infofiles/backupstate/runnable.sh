#!/bin/bash
content=$(cat "$(dirname "$0")/content.txt")

echo $content
# add some space

is_folder_empty=$(ls -A /opt/backups)

if [ -z "$is_folder_empty" ]; then
    echo -e "\e[32m\xE2\x9C\x94 Backup folder transferred (Folder empty) (Good)\e[0m"
else
    echo -e "\e[31m\xE2\x9C\x98 Backup folder not transferred yet (Folder not empty) (Bad or too early)\e[0m"
    echo "  Folders still present:"
    ls -1 /opt/backups | sed 's/^/  - /'

fi


