#!/bin/bash

# This file is run by update-motd.d/1-execute
# Read the contents of defaultmotd.txt into a variable
default_motd=$(cat /etc/motdmanage/defaultmotd.txt)

# Echo both variables back to the console
echo "$default_motd"
# add some space
echo ""
#!/bin/bash

# I have the following file path within my infofiles folder in /etc/motdmanage/infofiles:
# folder
#    content.txt
#    runnable.sh

# you should loop through each folder, running the runnable.sh file

# get the list of folders in /etc/motdmanage/infofiles
# loop through each folder
for folder in /etc/motdmanage/infofiles/*; do
    # run the runnable.sh file
    # pass the folder path as an argument
    # the runnable.sh file should read the content.txt file and print it to the console
    # add an extra line for spacing
    bash $folder/runnable.sh
    echo ""
done
