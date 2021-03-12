#!/bin/sh

# exercise 02 for lab04

for image in "$@"
do
    echo "$image displayed to screen if possible"

    echo "Address to e-mail this image to?"
    read email_address

    echo "Message to accompany image?"
    read message

    echo "$image sent to $email_address"

    $get_mutt_s = sed 's/$image/[a-zA-Z0-9]*/g'
    echo '$message' | mutt -s '$get_mutt_s' -e 'set copy=no' -a "$img" -- "$address"
done