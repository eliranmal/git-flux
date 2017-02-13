#!/usr/bin/env bash


main() {
	
	local source_dir=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
	
	local output_format="markdown"
	local output_dir="$source_dir/../usage"
	local file_prefix="git-flux-"

	if [[ -d ${output_dir} ]]; then
		rm -rf ${output_dir}
	fi
	mkdir -p ${output_dir}

	# generate the main file dox (git-flux)
	env DOX_RENDER=true \
		FORMAT=${output_format} \
		OUTPUT_DIR=${output_dir} \
		OUTPUT_FILE=main \
		git flux -h
	
	# generate all other files dox (git-flux-*)
	for path in ${source_dir}/../${file_prefix}*
	do
		local cmd="${path##*/$file_prefix}"
		env DOX_RENDER=true \
			FORMAT=${output_format} \
			OUTPUT_DIR=${output_dir} \
			OUTPUT_FILE=${cmd} \
			git flux ${cmd} -h
	done
}


main
