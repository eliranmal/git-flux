#!/usr/bin/env bash


#
# sets up the development environment
#
# usage:
#   ./dev-env.sh [nohooks]
#

main() {
	if [[ $1 != nohooks ]]; then
		log "linking git hooks to the repository"
		hookup || { exit 1; }
	fi
	log "ensuring git submodules are available"
	ensure_submodules || { exit 1; }
}

# symlinks everything in the /bin/hooks directory to /.git/hooks
hookup() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	ln -sfv ${source_dir}/hooks/* ${source_dir}/../.git/hooks
}

ensure_submodules() {
	git submodule init
	git submodule update
}

log() {
	echo " [dev-env] $1"
}


main "$@"
