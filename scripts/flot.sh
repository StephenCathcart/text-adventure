find . -name "*_flot.lua" -print | while read filename; do lua $filename ; done