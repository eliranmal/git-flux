#!/usr/bin/env bash


remove_usage_line() {
	grep -v '^usage:.*$'
}

squeeze_blanks() {
	cat -s
}

strip_down() {
	remove_usage_line | squeeze_blanks
}


main() {
	
#	local output_format="$FORMAT" # todo - pass in format?
	local output_format="markdown"
	local working_dir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
	local usage_dir="$working_dir/../usage"
	local file_prefix="git-flux-"

	if [[ -d ${usage_dir} ]]; then
		rm -rf ${usage_dir}
	fi
	mkdir -p ${usage_dir}

	printf "%s" "$(env FORMAT=${output_format} git flux -h | strip_down)" >> ${usage_dir}/main.md
	for file in ${working_dir}/../${file_prefix}*
	do
		local cmd="${file##*/$file_prefix}"
		printf "%s" "$(env FORMAT=${output_format} git flux ${cmd} -h | strip_down)" >> ${usage_dir}/${cmd}.md
	done
}


main
