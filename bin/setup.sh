#!/usr/bin/env bash


main() {
	local exec_file='git-flux'
	local stylish_dir='styli.sh'
	local submodule_files="
		formatter
	"

	ensure_install_prefix
	ensure_repo_url
	ensure_repo_ref

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
   REPO_REF=$REPO_REF
   REPO_PATH=$REPO_PATH
   INSTALL_PREFIX=$INSTALL_PREFIX
"
}

do_install() {
	validate_install_prefix

	local source_repo_path
	if is_git_repo "$REPO_PATH"; then # user passed a local repo path, and it's a valid git repo
		log "using existing local repo in '$REPO_PATH'"
		source_repo_path="$REPO_PATH"
	else # installer is in charge of cloning
		local temp_dir="$(create_temp_dir)"
		cleanup_dir_on_exit "$temp_dir"
		local clone_dir="$temp_dir"'/git-flux'
		log "cloning repo from github into '$clone_dir' ($REPO_REF)"
		light_clone "$REPO_URL" "$clone_dir" "$REPO_REF" || { exit 1; }
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
	do_install
}

light_clone() {
	local url="$1"; local dir="$2"; local ref="$3"

	# --recurse-submodules ensures submodules are initialized after the clone
	git clone --recurse-submodules \
	          --shallow-submodules \
	          --depth 1 \
	          --branch "$ref" \
	          "$url" "$dir" || { exit 1; }
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
	REPO_URL="${REPO_URL:-http://github.com/eliranmal/git-flux.git}"
}

ensure_repo_ref() {
	REPO_REF="${REPO_REF:-master}"
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

create_temp_dir() {
	mktemp -d 2>/dev/null || mktemp -d -t 'git-flux-setup'
}

# responsibly handle cleanup of the temporary directories
cleanup_dir_on_exit() {
	trap 'rm -rf '"$@"' >/dev/null 2>&1' EXIT
}

log() {
	echo " [setup] $1"
}


main "$@"
