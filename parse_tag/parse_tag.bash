#!/bin/bash

function parse_tag {
    filename="$1"

    # split by "-" and save to a array
    IFS='-' read -r -a parts <<< "$filename"

    # find the first part with number(s)
    for i in "${!parts[@]}"; do
        if [[ ${parts[i]} =~ [0-9] ]]; then
            first_num_index=$i
            break
        fi
    done

    # starting with the part containing the number, go to the second-to-last part 
    # and concatenate the parts into the tag name
    TAG=""
    for (( j=first_num_index; j<${#parts[@]}-1; j++ )); do
        if [ -z "$TAG" ]; then
            TAG="${parts[j]}"
        else
            TAG="$TAG-${parts[j]}"
        fi
    done

    echo $TAG
}