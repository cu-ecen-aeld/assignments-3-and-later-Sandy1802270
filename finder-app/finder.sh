#!/bin/sh
filesdir="$1"
searchstr="$2"

if [ $# -ne 2 ]; then
    echo "files directory or search string is not specified"
    exit 1
elif [ ! -d "$filesdir" ]; then
    echo "files directory entered does not represent a directory on the filesystem"
    exit 1
else 
    numberoffiles=$(find "$filesdir" -type f| wc -l)
    numberofmatchinglines=$(grep -r "$searchstr" "$filesdir" | wc -l)
    echo "The number of files are $numberoffiles and the number of matching lines are $numberofmatchinglines"
fi