#!/usr/bin/env bash


remove_usage_line() {
	grep -v '^usage:.*$'
}

squeeze_blanks() {
	cat -s
}

cleanup() {
	remove_usage_line | squeeze_blanks
}


main() {

	local working_dir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
	local usage_dir="$working_dir/../usage"

	if [[ -d ${usage_dir} ]]; then
		rm -rf ${usage_dir}
	fi
	mkdir -p ${usage_dir}
	
	local commands="
		init
		feature
		team
		integration
		rc
		hf
	"
	
	printf "%s" "$(env FORMAT=markdown git flux -h | cleanup)" >> ${usage_dir}/main.md
	for cmd in ${commands}; do
		printf "%s" "$(env FORMAT=markdown git flux ${cmd} -h | cleanup)" >> ${usage_dir}/${cmd}.md
	done
}


main
