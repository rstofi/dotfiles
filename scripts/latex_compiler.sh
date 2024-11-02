#!/bin/bash

# Function to display help message
show_help() {
  echo "Usage: $(basename "$0") filename.tex [options]"
  echo ""
  echo "Options:"
  echo "  -c           Cleanup auxiliary files after compilation."
  echo "  -h, --help   Show this help message and exit."
}

# Check if the input file is provided or if -h/--help option is used
if [ -z "$1" ] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  show_help
  exit 0
fi

# Input file
TEX_FILE=$1
CLEANUP=false

# Check for optional cleanup flag
if [[ "$2" == "-c" ]]; then
  CLEANUP=true
fi

# Check if the file exists
if [ ! -f "$TEX_FILE" ]; then
  echo "Error: File '$TEX_FILE' not found!"
  exit 1
fi

# Get the directory and filename without extension
TEX_DIR=$(dirname "$TEX_FILE")
TEX_NAME=$(basename "$TEX_FILE" .tex)

# Change to the directory of the .tex file
cd "$TEX_DIR" || exit 1

# Run pdflatex twice for cross-references and bibliography
echo "Compiling $TEX_FILE..."
pdflatex "$TEX_NAME.tex"
pdflatex "$TEX_NAME.tex"

# Check if the PDF was created successfully
if [ -f "$TEX_NAME.pdf" ]; then
  echo "PDF generated successfully at $(realpath "$TEX_NAME.pdf")"
else
  echo "Error: Failed to generate PDF."
  exit 1
fi

# Cleanup auxiliary files if -c option was provided
if $CLEANUP; then
  echo "Cleaning up auxiliary files..."
  rm -f "$TEX_NAME.aux" "$TEX_NAME.log" "$TEX_NAME.out" "$TEX_NAME.toc" "$TEX_NAME.bbl" "$TEX_NAME.blg"
  echo "Cleanup complete."
fi
