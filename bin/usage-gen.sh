#!/usr/bin/env bash

usage_dir="./usage"
main="${usage_dir}/main.txt"

mkdir -p ${usage_dir}

echo "" > $main

#echo "$(env FORMAT=false git flux -h)" >> $main
#
#echo "
#
#---
#
#" >> $main

raw_tput_bold="$(tput bold)"
#printf 'raw_tput_bold: %s\n' $raw_tput_bold
#echo "$raw_tput_bold"
#printf 'raw_tput_value: %q\n' $raw_tput_bold

#tput_bold="$(printf '%q' "$(printf '%q' $raw_tput_bold | sed -e 's,[$'"'"'],,g')")"
#tput_bold="$(printf '%q' $raw_tput_bold | sed -e 's,[$'"'"'],,g')"
tput_bold="$(printf '%q' $raw_tput_bold | sed -e 's,[$'"'"'],,g' | sed -e 's,\[,\\&,g')"
#tput_bold="$(printf '%q' $raw_tput_bold | sed -e 's,[$'"'"'],,g' | sed -e 's,[\[],\\&,g')"
echo "$tput_bold"

#echo "$(git flux init -h | sed -e 's,'"$(printf '%q' $tput_bold)"',A,g')" >> $main
echo "$(git flux init -h | sed -e 's,'"$tput_bold"',A,g')" >> $main

#echo "$(git flux init -h | grep "$tput_bold")" >> $main

#echo "$(git flux init -h | sed -e 's/[]\/$*.^|[]/\\&/g')" >> $main
#echo "$(git flux init -h)" >> $main

tput sgr0