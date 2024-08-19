#!/bin/bash

# Ensure a brand, name, and link are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$4" ]; then
    echo "Usage: $0 <brand> <name> <link>"
    echo "Please provide brand, model name, and download link."
    exit 1
fi

# Check for help flag
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: $0 <brand> <name> <link>"
    echo "This script creates a TWRP recovery post template."
    exit 0
fi

brand="$1"
name="$2 $3"
link="$4"

# Output the name for verification
echo "Device: $name"

# Create the template file
cp xda tmp.txt

# Replace placeholders with the provided values
sed -i -e "s/brandname/$brand/g" tmp.txt
sed -i -e "s/devicename/$name/g" tmp.txt
sed -i -e "s|downloadlink|$link|g" tmp.txt

# Rename the file to match the TWRP format
output_file="[RECOVERY][TWRPBuilder] TWRP For $brand $name"
mv tmp.txt "$output_file"

echo "Template created: $output_file"
