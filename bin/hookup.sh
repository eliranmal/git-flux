#!/usr/bin/env bash



# symlinks everything in the /bin/hooks directory to /.git/hooks

main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"

	ln -sv ${source_dir}/hooks/* ${source_dir}/../.git/hooks
}


main
