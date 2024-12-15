import re, os

for filename in os.listdir("."):
    old_path = os.path.join(".", filename)
    
    # Check if it's a file (not a directory)
    if os.path.isfile(filename):
        new_filename = filename.replace('Hoftype  ', '')
        #new_filename = re.sub(r'([a-z])([A-Z])', r'\1_\2', new_filename)
        new_filename = new_filename.replace('Italic', 'It')
        new_filename = new_filename.replace('It', 'italic')
        new_filename = new_filename.replace(' ', '_')
        new_filename = new_filename.lower() 
        if filename != new_filename:
            try:
                os.rename(filename, new_filename)
                print(f"Renamed: '{filename}' -> '{new_filename}'")
            except Exception as e:
                print(f"Failed to rename '{filename}': {e}")
