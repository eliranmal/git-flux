#!/usr/bin/env bash

# 
# works with a file called VERSION in the above directory, the contents of which 
# should be a semantic version string.
# 
# this script will display the current version, suggest a "minor" version update, 
# and ask for input to use the suggestion, or a newly entered value.
#
# once the new version number is determined, a git tag will be created and pushed.
#

# todo - instead (or in addition) of updating the VERSION file, grep the project files
# todo - and look for @@VERSION@@, or VERSION= or something, to replace variable values inside project files
# todo - this is all preparation for git-flux-version, we want it to be able to get the right version 
# todo - after installation + on command (git flux version)

main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	local version_file=${source_dir}/../VERSION

	local commit_message_template; local suggested_version
	if [[ -f $version_file ]]; then
        local current_version="$(get_current_version ${version_file})"
		log "current version : $current_version"
		
		suggested_version="$(get_suggested_version "$current_version")"
		commit_message_template="version bump to %s"
	else # todo - possibly add check for remote tags, to initialize VERSION file with the latest available release
		# todo - is this redundant? probably
		if ! confirm_init_version; then
			exit 0
		fi
		suggested_version="0.1.0"
		commit_message_template="add VERSION file, initial version is %s"
	fi

	local new_version="$(prompt_new_version "$suggested_version")"
	local commit_message="$(printf "$commit_message_template" "$new_version")"

	log "new version will be set to '$new_version'"
	write_new_version "$version_file" "$new_version"
	submit_new_version "$version_file" "$commit_message" "$new_version"
}

confirm_init_version() {
	log "could not find a VERSION file"
	read -p "$(log "do you want to create a version file and start from scratch? (y/n) ")" answer
	[[ $answer = y ]]
}

prompt_new_version() {
	local suggested_version="$1"
	read -r -p "$(log "enter the new version [$suggested_version]: ")" input_version
	echo "${input_version:-$suggested_version}"
}

get_current_version() {
	local version_file=${1}
	echo "$(cat ${version_file})"
}

get_suggested_version() {
	local current_version="$1"
	local v_segments=($(echo "$current_version" | tr '.' ' '))
	local v_major=${v_segments[0]}; local v_minor=${v_segments[1]}; local v_patch=${v_segments[2]}

	v_minor=$((v_minor + 1))
	v_patch=0
	
	echo "$v_major.$v_minor.$v_patch"
}

write_new_version() {
	local version_file="$1"; local new_version="$2"
	echo "$new_version" > ${version_file}
}

submit_new_version() {
	local version_file="$1"; local commit_message="$2"; local new_version="$3"
	git add ${version_file}
	git commit -m "$commit_message"
	git tag -a -m "tagging version $new_version" "v$new_version"
	git push origin --tags
}

log() {
	echo " > $1"
}


main
