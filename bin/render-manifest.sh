#!/usr/bin/env bash


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	
	ensure_template_file
	ensure_output_file

	case "$1" in
		help|-h)
			usage
		;;
	esac

	log "template file: [$TEMPLATE_FILE]"
	log "output file: [$OUTPUT_FILE]"
	
	log "render manifest file from template."
	render_manifest_template
}

usage() {
	echo "
usage: [environment] render-manifest.sh
environment:
   TEMPLATE_FILE=$TEMPLATE_FILE
   OUTPUT_FILE=$OUTPUT_FILE
"
	exit 0
}

ensure_template_file() {
	TEMPLATE_FILE="${TEMPLATE_FILE:-${source_dir}/manifest.template}"
}

ensure_output_file() {
	local git_root="$(git rev-parse --show-toplevel)"
	OUTPUT_FILE="${OUTPUT_FILE:-${git_root}/MANIFEST}"
}

render_manifest_template() {
	log "declare manifest placeholders as variables."
	local version="$(cat ${source_dir}/../VERSION)"
	log "inject values into placeholders and write to output file."
	render_template ${TEMPLATE_FILE} > ${OUTPUT_FILE}
}

render_template() {
	eval "echo \"$(cat $1)\""
}

log() {
	echo " [render-manifest] $1"
}


main
