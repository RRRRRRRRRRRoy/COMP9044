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

    
    echo '$message' | mutt -e 'set copy=no' -a "$img" -- "$address"
done