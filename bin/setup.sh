#!/usr/bin/env bash


main() {
	local cmd_name="$1"
	local clone_dir="./git-flux"
	local exec_files="git-flux"
	local script_files="
		gitflux-text
		gitflux-util
		gitflux-io
		gitflux-gitlib
		gitflux-validation
		gitflux-action
		gitflux-common
		git-flux-init
		git-flux-feature
		git-flux-team
		git-flux-integration
		git-flux-rc
		git-flux-hf
	"
	ensure_install_prefix
	ensure_repo_url
	call_command "$cmd_name"
}

call_command() {	
	case "$1" in
		help)
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
	echo "\
usage: [environment] setup.sh [install|uninstall|update]
environment:
   REPO_URL=$REPO_URL
   REPO_PATH=$REPO_PATH
   INSTALL_PREFIX=$INSTALL_PREFIX"
}

do_install() {
	validate_install_prefix
	local setup_repo_path
	if [[ -d $REPO_PATH && -d "$REPO_PATH/.git" ]]; then
		echo "using existing repo in '$REPO_PATH'"
		setup_repo_path="$REPO_PATH"
	else
		echo "cloning repo from github into '$clone_dir'"
		git clone "$REPO_URL" "$clone_dir"
		setup_repo_path="$clone_dir"
	fi
	echo "installing git-flux to '$INSTALL_PREFIX'"
	install -v -d -m 0755 "$INSTALL_PREFIX"
	for exec_file in $exec_files; do
		install -v -m 0755 "$setup_repo_path/$exec_file" "$INSTALL_PREFIX"
	done
	for script_file in $script_files; do
		install -v -m 0644 "$setup_repo_path/$script_file" "$INSTALL_PREFIX"
	done
}

do_uninstall() {
	validate_install_prefix
	echo "uninstalling git-flux from '$INSTALL_PREFIX'"
	for script_file in $script_files $exec_files; do
		echo "rm -vf $INSTALL_PREFIX/$script_file"
		rm -vf "$INSTALL_PREFIX/$script_file"
	done
}

do_update() {
	do_uninstall
	if [[ -z $REPO_PATH ]]; then # working on our cloned repo, not the user's repo, it's safe to delete
		echo "rm -rf ..."
#		rm -rf ...
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
		echo "the install prefix path was not set. use the INSTALL_PREFIX environment variable to set it manually."
		exit 1
	elif [[ ! -d $INSTALL_PREFIX ]]; then
		echo "the install prefix directory '$INSTALL_PREFIX' was not found."
		exit 1
	fi
}

main "$@"