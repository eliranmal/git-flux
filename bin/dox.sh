#!/usr/bin/env bash


format_usage_line() {
	sed -e 'N' -e 's,usage:\(.*\)\(\n\)$,\2    \1\2\2,'
}

attach_message() {
	printf "%s\n\n\n\n%s\n\n%s" "$(cat -)" "---" "<sub><i>auto-generated with <b>dox</b></i></sub>"
}

squeeze_blanks() {
	cat -s
}

strip_down() {
	squeeze_blanks
}

dress_up() {
    format_usage_line | attach_message
}


main() {
	
#	local output_format="$FORMAT" # todo - pass in format?
	local output_format="markdown"
	local working_dir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
	local output_dir="$working_dir/../usage"
	local file_prefix="git-flux-"

	if [[ -d ${output_dir} ]]; then
		rm -rf ${output_dir}
	fi
	mkdir -p ${output_dir}

	echo "$(env FORMAT=${output_format} git flux -h | strip_down | dress_up)" >> ${output_dir}/main.md
	for path in ${working_dir}/../${file_prefix}*
	do
		local cmd="${path##*/$file_prefix}"
		echo "$(env FORMAT=${output_format} git flux ${cmd} -h | strip_down | dress_up)" >> ${output_dir}/${cmd}.md
	done
}


main
