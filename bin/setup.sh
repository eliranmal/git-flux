#!/usr/bin/env bash


shopt -s extglob

main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	local clone_dir="$source_dir"'/git-flux'
	local exec_files="git-flux"
	local script_files="
		gitflux-*
		git-flux-*
	"
	local submodule_path='styli.sh'
	local submodule_files="
		formatter
	"
	ensure_install_prefix
	ensure_repo_url
	call_command "$1"
}

call_command() {	
	case "$1" in
		help|-h)
			usage
			;;
		update)
			do_update
			;;
		uninstall)
			do_uninstall
			;;
		*)
			do_install
			;;
	esac
}

usage() {
	echo "
usage: [environment] setup.sh [install|uninstall|update]
environment:
   REPO_URL=$REPO_URL
   REPO_PATH=$REPO_PATH
   INSTALL_PREFIX=$INSTALL_PREFIX
"
}

do_install() {
	validate_install_prefix
	
	local source_repo_path
	if is_git_repo "$REPO_PATH"; then # user passed a local repo path, and it's a valid git repo
		log "using repo in '$REPO_PATH'"
		source_repo_path="$REPO_PATH"
	else # installer is in charge of figuring out the repo path
		if is_git_repo "$clone_dir"; then # we already have a cloned repo from a previous installation
			log "using existing repo in '$clone_dir'"
		else # first-time installation, go fish
			log "cloning repo from github into '$clone_dir'"
			# using --recursive to auto-init the submodule
			git clone --recursive "$REPO_URL" "$clone_dir" || exit 1
		fi
		source_repo_path="$clone_dir"
	fi
	
	log "installing git-flux to '$INSTALL_PREFIX'"
	install -v -d -m 0755 "$INSTALL_PREFIX"
	for exec_file in $exec_files; do
		install -v -m 0755 "$source_repo_path/$exec_file" "$INSTALL_PREFIX"
	done
	for script_file in "${script_files[@]}"; do
		install -v -m 0644 "$source_repo_path/$script_file" "$INSTALL_PREFIX"
	done
	
	install -v -d -m 0755 "$INSTALL_PREFIX/$submodule_path"
	for submodule_file in $submodule_files; do
		# $submodule_files may contain/full/paths, so we're being careful
		local submodule_file_dir="$( dirname "$INSTALL_PREFIX/$submodule_path/$submodule_file" )"
		install -v -d -m 0755 "$submodule_file_dir"
		install -v -m 0644 "$source_repo_path/$submodule_path/$submodule_file" "$submodule_file_dir"
	done
}

do_uninstall() {
	validate_install_prefix
	log "uninstalling git-flux from '$INSTALL_PREFIX'"
	for script_file in "${script_files[@]}" $exec_files; do
		rm -vf "$INSTALL_PREFIX/$script_file"
	done
	rm -vfr "$INSTALL_PREFIX/$submodule_path"
}

do_update() {
	do_uninstall
	if is_git_repo "$clone_dir"; then # we already have a cloned repo from a previous installation
		log "removing existing repo in '$clone_dir'"
		rm -rf "$clone_dir"
	fi
	do_install
}

ensure_repo_url() {
	if [[ -z $REPO_URL ]]; then
		REPO_URL="http://github.com/eliranmal/git-flux.git"
	fi
}

ensure_install_prefix() {
	if [[ -z $INSTALL_PREFIX ]]; then
		if [[ $OSTYPE = "linux-gnu" || $OSTYPE = "darwin"* ]]; then # linux / mac osx
			INSTALL_PREFIX="/usr/local/bin"
		elif [[ $OSTYPE = "msys" ]]; then # mingw
			INSTALL_PREFIX="$EXEPATH/usr/local/bin"
		fi
	fi
}

validate_install_prefix() {
	if [[ -z $INSTALL_PREFIX ]]; then
		log "the install prefix path was not set. use the INSTALL_PREFIX environment variable to set it manually."
		exit 1
	elif [[ ! -d $INSTALL_PREFIX ]]; then
		log "the install prefix directory '$INSTALL_PREFIX' was not found."
		exit 1
	fi
}

is_git_repo() {
	[[ -d $1 && -d "$1/.git" ]]
}

log() {
	echo " > $1"
}


main "$@"
