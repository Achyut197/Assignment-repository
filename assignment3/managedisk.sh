#!/bin/bash

# Set default time threshold to 40 hours if no argument is provided
time_threshold=${1:-40hrs}

# Get the current date in the required format for the log file
current_date=$(date "+%d-%m-%Y")

# Log file name
log_file="deleted-files-$current_date.log"

# Directory containing audio files
audio_folder="/data/audios/folder"

# Create the log file with headers
echo "AudioFileName CreationTime DeletionTime" > "$log_file"

# Function to calculate time difference in seconds
get_time_difference() {
    local start_time=$1
    local end_time=$2
    local start_timestamp=$(date -d "$start_time" +"%s")
    local end_timestamp=$(date -d "$end_time" +"%s")
    echo $((end_timestamp - start_timestamp))
}

# Function to delete audio files older than the specified time threshold
delete_old_audio_files() {
    local files_to_delete=($(find "$audio_folder" -name "*.wav" -type f -mmin +$((time_threshold * 60)) -exec stat -c "%n %W" {} \;))

    for file_info in "${files_to_delete[@]}"; do
        IFS=' ' read -r -a file_data <<< "$file_info"
        local file_name=${file_data[0]}
        local creation_time=$(date -d "@${file_data[1]}" "+%d-%m-%YT%H:%M:%S%:z")
        local deletion_time=$(date "+%d-%m-%YT%H:%M:%S%:z")

        rm "$file_name"

        # Log the deletion information
        echo "$file_name $creation_time $deletion_time" >> "$log_file"
        echo "Deleted: $file_name"
    done
}

# Run the deletion function
delete_old_audio_files

echo "Cleanup completed. Log file: $log_file"

