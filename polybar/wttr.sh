#! /bin/bash

curl wttr.in/Ottawa?format=3 2>/dev/null | awk '/°(C|F)/ {printf $(NF-1) $NF " ("a")"} /,/ {a=$0}'
