#!/bin/bash

source "../../tempen/tempen.sh"

# Force the Token to be given.

if [ -z "$1" ]; then
    echo "Spotify Token Not Given." >&2
    printf "The usage of this script is:\nbuild.sh [SPOTIFY_TOKEN]\n" >&2
    exit 3
fi

# Fetch Favorites if possible.
MED_FAVORITES=$(curl -X "GET" \
    "https://api.spotify.com/v1/me/top/artists?time_range=medium_term&limit=4" \
    -H "Accept: application/json" -H "Content-Type: application/json" \
    -H "Authorization: Bearer $1")

SHORT_FAVORITES=$(curl -X "GET" \
    "https://api.spotify.com/v1/me/top/artists?time_range=short_term&limit=4" \
    -H "Accept: application/json" -H "Content-Type: application/json" \
    -H "Authorization: Bearer $1")

# Handle the case of an error.
has_error=$(echo "$MED_FAVORITES" | jq 'select(.error)')

if [ -n "$has_error" ]; then
    echo "An Error was Thrown:" >&2

    err_msg=$(echo "$has_error" | jq '.error.message')
    err_code=$(echo "$has_error" | jq '.error.status')

    echo "$err_code $err_msg" >&2

    exit 4
fi

# Creates a /tmp directory
make_temp() {
    tmp=$(mktemp -d)
    path="$tmp/spotifyfavs"
    mkdir "$path"

    echo "$tmp"
}

# Goes through all the fetched data and populates the template.
process_data() {
    data=$1
    file=$2

    function _write {
        for row in $(echo $data | jq -r '.items[] | @base64'); do
            _jq() {
                echo "$row" | base64 --decode | jq -r $data
            }

            te_tr "$file" "T_NAME" "$(_jq ".name")"
            te_tr "$file" "T_GENRE" "$(_jq ".genres[0]")"
            te_tr "$file" "T_IMAGE" "$(_jq ".images[0].url")"
            te_tr "$file" "T_IMG_W" "$(_jq ".images[0].width")"
            te_tr "$file" "T_IMG_H" "$(_jq ".images[0].height")"
        done
    }

    te_block_iterate "$file" "SPT_ARTIST" _write
}

# Populates a single field in the template
main() {
    tmp=$(make_temp)
    workdir="$tmp/spotifyfavs"

    cp "template.html" "$workdir/template.html"
    process_data "$SHORT_FAVORITES" "$workdir/template.html"
    cp "$workdir/template.html" "./spotifyfavs.html"

    rm -r "$tmp"
}

# Main Code
main
