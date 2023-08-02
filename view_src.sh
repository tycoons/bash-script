#!/bin/bash

# Definition of function to download web page and display source code in terminal
function view_webpage_source() {
    # check if url is done
    if [ -z "$1" ]; then
        echo "Use: $0 <URL> [-c | --comments]"
        return 1
    fi

    # URL web page
    local url=$1
    local comments_option=$2
    # curl for download file
    local contenu=$(curl -s "$url")

    # Vcheck curl is ok
    if [ $? -eq 0 ]; then
       if [ "$comments_option" == "-c" ] || [ "$comments_option" == "--comments" ]; then 
       echo "$contenu" | grep -E "<!--.*-->"
       else
        # show code with cat
        echo "$contenu" | cat
        fi
    else
        echo "Failed to fetch web page content"
        return 1
    fi
}

# ACall function
view_webpage_source "https://www.example.com"
