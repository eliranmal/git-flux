#!/usr/bin/env bash


#
# sets up the development environment
#
# usage:
#   ./dev-env.sh [nohooks]
#

main() {
	local source_dir
	local git_root
	
	# shellcheck disable=SC2164,SC2128
	source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	git_root="$(git rev-parse --show-toplevel)"
	if [[ $1 = nohooks ]]; then
		log "removing git hooks from the repository"
		unhookup || { exit 1; }
	else
		log "linking git hooks to the repository"
		hookup || { exit 1; }
	fi
	log "ensuring git submodules are available"
	ensure_submodules || { exit 1; }
}

# symlinks everything in the /bin/hooks directory to /.git/hooks
hookup() {
	ln -sfv "$source_dir"/hooks/* "$git_root"/.git/hooks
}

unhookup() {
	for file in ${source_dir}/hooks/*; do
		rm -fv "$git_root"/.git/hooks/"$(basename "$file")"
	done
}

ensure_submodules() {
	git submodule init
	git submodule update
}

log() {
	echo " [dev-env] $1"
}


main "$@"
