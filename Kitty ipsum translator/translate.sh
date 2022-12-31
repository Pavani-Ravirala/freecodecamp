#!/bin/bash
# command to convery kitty_ipsum to doggy_ipsum
# ./translate.sh kitty_ipsum_1.txt
cat $1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g'

