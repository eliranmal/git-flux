#!/usr/bin/env bash


# this script auto-generates the git-flux usage documentation markdown files.
# they all can be found under the '$output_dir' directory.

main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	local root_dir="$source_dir"'/..'
	local output_dir="$root_dir"'/usage'
	local output_format="markdown"
	local file_prefix="git-flux-"

	# generate the main file usage (git-flux)
	(
		export FORMAT="$output_format" OUTPUT_PATH="$output_dir"'/main.md'
		git flux -h | ${root_dir}/styli.sh/renderer
	)

	# generate all other files usage (git-flux-*)
	for path in ${root_dir}/${file_prefix}*; do
		local cmd="${path##*/$file_prefix}"
		(
			export FORMAT="$output_format" OUTPUT_PATH="$output_dir"'/'"$cmd"'.md'
			git flux "$cmd" -h | ${root_dir}/styli.sh/renderer
		)
	done
}

main
