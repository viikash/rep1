# If your JSON file is an array and not a JSON object, than use this Harshad Wrap scripts.
# Specially you face this challenges during devsecops.
# Author:Researcher: Harshad Shah 
# Official Web: https://hackerassociate.com 





import json
import sys
import os

def wrap_gitleaks_report(input_path, output_path=None):
    with open(input_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    # If already an object, do nothing
    if isinstance(data, dict):
        print("File is already a JSON object. No changes made.")
        return
    # Wrap array in an object
    wrapped = {"results": data}
    if not output_path:
        base, ext = os.path.splitext(input_path)
        output_path = f"{base}_wrapped{ext}"
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(wrapped, f, indent=2)
    print(f"Wrapped file saved as: {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python wrap_gitleaks.py <input_file> [output_file]")
    else:
        wrap_gitleaks_report(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None)