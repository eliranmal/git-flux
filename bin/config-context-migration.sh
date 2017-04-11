#!/usr/bin/env bash


#
# ...
#
# usage:
#   ./config-context-migration.sh
#

main() {
#	local source_dir
	local git_root
	local git_config_section="gitflux"
	
	# shellcheck disable=SC2164,SC2128
#	source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	git_root="$(git rev-parse --show-toplevel)"
	log "git root: $git_root"

#	log "ensuring git submodules are available"
	local branches=( $(git branch --no-color | sed 's/^[* ] //') )
	for b in "${branches[@]}"; do
		log "branch: $b"
		if [[ $(git_config_get_global "$(git_config_escape_subsection "branch:$b").base") ]]; then
			log "match!"
		fi
	done
}


git_config_get_global() {
	local namespace="$1"
	git config --global --get "$git_config_section.$namespace"
}

git_config_set_global() {
	local namespace="$1"; local value="$2"
	git config --global "$git_config_section.$namespace" "$value"
}

git_config_unset_global() {
	local namespace="$1"
	git config --global --unset "$git_config_section.$namespace"
}

git_config_remove_section_global() {
	local namespace="$1"
	git config --global --remove-section "$git_config_section.$namespace"
}

git_config_escape_subsection() {
	# '\' and '"' must be escaped in git config subsection names
	sed 's,\([\\\"]\),\\\1,g' <<< "$1"
}

log() {
	echo " [config-context-migration] $1"
}


main "$@"
