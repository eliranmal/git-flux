#!/usr/bin/env bash


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"

	# tie git-hooks
	ln -s ${source_dir}/hooks/* ${source_dir}/../.git/hooks
}

main
