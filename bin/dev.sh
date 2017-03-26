#!/usr/bin/env bash


# todo - change this file's name to 'hookup.sh' or 'setup-hooks.sh'


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"

	log "tie git-hooks"
	ln -sv ${source_dir}/hooks/* ${source_dir}/../.git/hooks
}

log() {
	echo " > $1"
}

main
