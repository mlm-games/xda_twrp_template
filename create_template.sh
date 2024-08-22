#!/bin/bash

# Ensure a brand, name, and link are provided
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <brand> <name> <link>"
    echo "Please provide brand, model name, and download link."
    exit 1
fi

# Check for help flag
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: $0 <brand> <name> <link>"
    echo "This script creates a TWRP recovery post template."
    echo "Edit the template being copied below to your device manufacturer's"
    exit 0
fi

brand="$1"
name="$2"
link="$3"

# Output the name for verification
echo "Device: $name"

# Create the template file
cp xda_template_fastboot_unlock tmp.txt

# Replace placeholders with the provided values
sed -i -e "s/{{brand}}/$brand/g" tmp.txt
sed -i -e "s/{{device}}/$name/g" tmp.txt
sed -i -e "s|{{link}}|$link|g" tmp.txt

# Rename the file to match the TWRP format
output_file="[RECOVERY]TWRP For $brand $name"
mv tmp.txt "$output_file"

echo "Template created: $output_file"
