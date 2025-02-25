#!/bin/sh
writefile="$1"
writestr="$2"

if [ $# -ne 2 ]; then 
    echo "files directory or search string is not specified"
    exit 1
fi 

mkdir -p "$(dirname "$writefile")"

echo "$writestr" > "$writefile" 

exit 0
