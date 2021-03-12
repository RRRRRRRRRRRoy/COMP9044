#!/bin/sh

# exercise 02 for lab04

for image in "$@"
do
    echo "$image displayed to screen if possible"

    echo -n "Address to e-mail this image to? "
    read email_address

    echo -n "Message to accompany image? "
    read message

    echo "$image sent to $email_address"

    get_name=$(echo $image|sed 's/[a-zA-Z0-9]*.png/[a-zA-Z0-9]*/g')
    
    
    echo "$message" | mutt -s "$get_name" -e 'set copy=no' -a "$image" -- "$address"
done