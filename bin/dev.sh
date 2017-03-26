#!/usr/bin/env bash


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"

	log "tie git-hooks"
	ln -sv ${source_dir}/hooks/* ${source_dir}/../.git/hooks
}

log() {
	echo " > $1"
}

main
