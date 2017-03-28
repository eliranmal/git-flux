#!/usr/bin/env bash


#
# sets up the development environment
#
# usage:
#   ./dev-env.sh [nohooks]
#

main() {
	if [[ $1 != nohooks ]]; then
		hookup
	fi
	ensure_submodules
}

# symlinks everything in the /bin/hooks directory to /.git/hooks
hookup() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	ln -sv ${source_dir}/hooks/* ${source_dir}/../.git/hooks
}

ensure_submodules() {
	git submodule init
	git submodule update
}


main
