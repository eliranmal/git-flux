#!/usr/bin/env bash


main() {
	local output_dir="$( source_dir ../usage )"
	[[ $1 = "-h" ]] && show_help "$output_dir"
	clean_dir "$output_dir"
	generate_dox "$output_dir"
}

show_help() {
	local output_dir="$1"
	printf "\n%s\n\n" "this script auto-generates the git-flux usage documentation markdown files.
they all can be found under the '$output_dir' directory."
	exit 0
}

source_dir() {
	local relative_path="${1:-'.'}"
	printf "%s" "$( cd "$(dirname "${BASH_SOURCE}")" ; cd "$relative_path" ; pwd -P )"
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


main "$@"
