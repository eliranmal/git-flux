#!/usr/bin/env bash


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	local clone_dir="$source_dir"'/git-flux'
	local exec_file='git-flux'
	local stylish_dir='styli.sh'
	local submodule_files="
		formatter
	"

	ensure_install_prefix
	ensure_repo_url

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
	log "ensuring availability and mode of the install directory"
	install -v -d -m 0755 "$INSTALL_PREFIX"
	log "installing executable (main script)"
	install -v -m 0755 "$source_repo_path/$exec_file" "$INSTALL_PREFIX"
	log "installing sourceable scripts"
	for script_file_path in $(script_file_patterns "$source_repo_path"); do
		install -v -m 0644 "$script_file_path" "$INSTALL_PREFIX"
	done
	log "ensuring availability and mode of the styli.sh submodule install directory"
	install -v -d -m 0755 "$INSTALL_PREFIX/$stylish_dir"
	log "installing submodule sourceable scripts"
	for submodule_file in $submodule_files; do
		# $submodule_files may contain/full/paths, so we're being careful
		local submodule_file_dir="$( dirname "$INSTALL_PREFIX/$stylish_dir/$submodule_file" )"
		install -v -d -m 0755 "$submodule_file_dir"
		install -v -m 0644 "$source_repo_path/$stylish_dir/$submodule_file" "$submodule_file_dir"
	done
}

do_uninstall() {
	validate_install_prefix
	
	log "uninstalling git-flux from '$INSTALL_PREFIX'"
	log "removing executable (main script)"
	rm -vf "$INSTALL_PREFIX/$exec_file"
	log "removing sourceable scripts"
	for script_file_path in $(script_file_patterns "$INSTALL_PREFIX"); do
		rm -vf "$script_file_path"
	done
	log "removing the styli.sh submodule directory"
	rm -vfr "$INSTALL_PREFIX/$stylish_dir"
}

do_update() {
	do_uninstall
	if is_git_repo "$clone_dir"; then # we already have a cloned repo from a previous installation
		log "removing existing repo in '$clone_dir'"
		rm -rf "$clone_dir"
	fi
	do_install
}

# script file paths rely on resolution of paths via globbing pattens, 
# so they have to be declared only after ensuring their directory path exists.
# this is why we don't declare them statically at the top, but using a function instead.
script_file_patterns() {
	local base="$1"
	echo "
		$base/gitflux-*
		$base/git-flux-*
	"
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
