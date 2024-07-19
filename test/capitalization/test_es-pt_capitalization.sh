#!/bin/bash

# Read the input sentence from the file and remove newlines
input_sentence=$(tr -d '\n' < es-pt-capitalization-input.txt)

# Step 1: Extract capitalization
extracted_caps=$(echo "$input_sentence" | apertium-extract-caps)

# Read expected extracted caps from file
expected_extracted_caps=$(tr -d '\n' < es-pt-extractcaps-expected.txt)

# Compare extracted caps with expected output
if [ "$extracted_caps" == "$expected_extracted_caps" ]; then
    echo "Extraction test passed."
else
    echo "Extraction test failed."
    echo "Expected: $expected_extracted_caps"
    echo "Got: $extracted_caps"
    exit 1
fi

# Step 2: Define the output after translation to Portuguese 
translated_sentence=$(tr -d '\n' < es-pt-capitalization-translated.txt)

# Step 3: Restore capitalization
restored_caps=$(echo "$translated_sentence" | apertium-restore-caps ../../es-pt.crx.bin)

# Define expected output after restoring capitalization
expected_restored_caps=$(tr -d '\n' < es-pt-restorecaps-expected.txt)

# Check if the restored capitalization matches the expected output
if [ "$restored_caps" == "$expected_restored_caps" ]; then
    echo "Restoration test passed."
else
    echo "Restoration test failed."
    echo "Expected: $expected_restored_caps"
    echo "Got: $restored_caps"
    exit 1
fi

echo "All tests passed."
