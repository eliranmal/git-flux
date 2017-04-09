#!/usr/bin/env bash


# activates the /bin/setup.sh script with this repo's path, to enable installing from source


main() {
	local source_dir
	local root_dir

	# shellcheck disable=SC2164,SC2128
	source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	root_dir="$source_dir/.."

	env REPO_PATH="$root_dir" "$root_dir"/bin/setup.sh "$@"
}


main "$@"
