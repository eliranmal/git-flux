#!/usr/bin/env bash


main() {
	local output_dir="$( source_dir )/../usage"

	clean_dir "$output_dir"
	generate_dox "$output_dir"
}

source_dir() {
	printf "%s" "$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
}

clean_dir() {
	if [[ -d $1 ]]; then
		rm -rf $1
	fi
	mkdir -p $1
}

generate_dox() {
	local output_dir="$1"
	local output_format="markdown"
	local file_prefix="git-flux-"
	# generate the main file dox (git-flux)
	env DOX_RENDER=true \
		FORMAT="$output_format" \
		OUTPUT_DIR="$output_dir" \
		OUTPUT_FILE=main \
		git flux -h

	# generate all other files dox (git-flux-*)
	for path in $( source_dir )/../${file_prefix}*
	do
		local cmd="${path##*/$file_prefix}"
		env DOX_RENDER=true \
			FORMAT="$output_format" \
			OUTPUT_DIR="$output_dir" \
			OUTPUT_FILE="$cmd" \
			git flux "$cmd" -h
	done
}


main
