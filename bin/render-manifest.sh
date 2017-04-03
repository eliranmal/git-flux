#!/usr/bin/env bash


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	
	ensure_template_file
	ensure_output_file
	
	render_manifest_template
}

ensure_template_file() {
	TEMPLATE_FILE="${TEMPLATE_FILE:-${source_dir}/manifest.template}"
}

ensure_output_file() {
	local git_root="$(git rev-parse --show-toplevel)"
	OUTPUT_FILE="${OUTPUT_FILE:-${git_root}/MANIFEST}"
}

render_manifest_template() {
	# declare manifest placeholders as variables
	local version="$(cat ${source_dir}/../VERSION)"
	# inject values into placeholders and write to output file
	render_template ${TEMPLATE_FILE} > ${OUTPUT_FILE}
}

render_template() {
	eval "echo \"$(cat $1)\""
}


main
