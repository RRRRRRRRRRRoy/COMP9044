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

    echo 'Penguins are cool.' | mutt -s 'penguins!' -e 'set copy=no' -a penguins.png -- nobody@nowhere.com
done