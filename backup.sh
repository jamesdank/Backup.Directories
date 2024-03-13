#!/bin/bash

# Destination for the backup files
destination="path/to/backup/dir"

date="$(date +%Y-%m-%d_%H%M%S)"

mkdir -p "$destination/backup-$date"

# Backup Directories
declare -A directories=(
    ["home"]="home/"
    ["etc"]="etc/"
    ["var"]="var/"
    );

echo -e "Please wait Creating Backups\n"
sleep 2

for key in ${!directories[@]}
do
    tar -czf "$destination/backup-$date/${key}.tar.gz" -C / "${directories[${key}]}"

    echo ${key} Backup Created.
done
