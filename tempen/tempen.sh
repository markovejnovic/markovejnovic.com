#!/bin/bash

function _te_sanitize_string {
    echo $(sed 's:/:\\/:g' <<< "$1")
}

function te_tr {
    template=$1
    field=$2
    value=$(_te_sanitize_string "$3")

    sed -i "s/\%$field/$value/" "$template"
}

function _te_read_block {
    template=$1
    block_name=$2

    cat "$template" | grep -Pzo \
        "(?s)(?<={% $block_name %}).*(?={% ${block_name}_END %})"
}

function te_block_iterate {
    template=$1
    block_name=$2
    applicative=$3

    block_content=$(_te_read_block "$template" "$block_name")
}

function te_block_iterate_end {

}
