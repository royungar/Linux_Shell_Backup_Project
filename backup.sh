#!/bin/bash

################################################################################
# backup.sh - A shell script to archive recently modified files from a source
#             directory into a compressed .tar.gz backup in a destination folder.
#
# Usage:
#   ./backup.sh source_directory destination_directory
#
# Description:
#   - Accepts two directory arguments: a source and a destination.
#   - Checks for files modified in the last 24 hours inside the source directory.
#   - Archives those files into a timestamped .tar.gz file.
#   - Moves the backup file to the destination directory.
################################################################################

# Validate the number of arguments
if [[ $# != 2 ]]; then
  echo "Usage: backup.sh source_directory destination_directory"
  exit 1
fi

# Validate that both arguments are valid directories
if [[ ! -d $1 || ! -d $2 ]]; then
  echo "Error: One or both provided paths are not valid directories."
  exit 1
fi

# Assign arguments to named variables
source_dir=$1
destination_dir=$2

# Print the received arguments
echo "Source Directory: $source_dir"
echo "Destination Directory: $destination_dir"

# Get current Unix timestamp
current_ts=$(date +%s)

# Generate backup filename with timestamp
backup_filename="backup-$current_ts.tar.gz"

# Save the absolute paths of current working directory and destination
orig_abs_path=$(pwd)
cd "$destination_dir" || exit
dest_abs_path=$(pwd)

# Return to the original directory and then enter the source directory
cd "$orig_abs_path" || exit
cd "$source_dir" || exit

# Determine the timestamp for 24 hours ago
yesterday_ts=$((current_ts - 86400))

# Initialize an array to hold files modified in the last 24 hours
declare -a files_to_backup=()

# Find eligible files for backup
for file in *; do
  if [[ -f "$file" && $(date -r "$file" +%s) -gt $yesterday_ts ]]; then
    files_to_backup+=("$file")
  fi
done

# Create the archive only if there are files to back up
if [[ ${#files_to_backup[@]} -eq 0 ]]; then
  echo "No files modified in the last 24 hours. No backup created."
  exit 0
fi

# Create compressed backup
tar -czvf "$backup_filename" "${files_to_backup[@]}"

# Move the backup to the destination directory
mv "$backup_filename" "$dest_abs_path"

echo "Backup successful: $dest_abs_path/$backup_filename"
