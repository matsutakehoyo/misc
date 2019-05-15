#!/bin/bash
if [ -d "$1" ] 
then
    # echo "Directory $1 exists." 
    echo Convert pdf to svg using inkscape in 
    echo "$1"
else
    echo "Error: Directory $1 does not exists."
    exit
fi
# list pdf files in the dir
echo
ls "$1" | grep '.pdf$' 
# this gets the path 
# find "$1" -type f -name "*.pdf" 
echo
find "$1" -type f -name "*.pdf" -print0 | while IFS= read -r -d '' file; do
    echo converting....
    echo "$file"
    # with awk
    new_name=$(echo "$file" | awk '{gsub("pdf", "svg")}1')
    # with sed
    # new_name=$(echo "$file" | sed -e "s/pdf/svg/g")
    # this might be bash specific
    # new_name=${file//"pdf"/"svg"}
    echo $new_name
    inkscape --without-gui -f "$file" --export-text-to-path --export-plain-svg="$new_name"
    echo done
    echo
done

say Done 
