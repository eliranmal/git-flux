#!/usr/bin/env bash


main() {
	local repo_name="le-ui-gitflow"
	local exec_files="git-le"
	local script_files="gitflux-common gitflux-util gitflux-status gitflux-validation gitflux-gitlib git-le-init git-le-feature git-le-team git-le-integration"
	local cmd_name="$1"
	ensure_install_prefix
	ensure_repo_url
	ensure_repo_path
	call_command "$cmd_name"
}

call_command() {	
	case "$1" in
		help)
			usage
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
	echo "usage: [environment] setup.sh [install|uninstall]"
	echo "environment:"
	echo "   REPO_URL=$REPO_URL"
	echo "   REPO_PATH=$REPO_PATH"
	echo "   INSTALL_PREFIX=$INSTALL_PREFIX"
}

do_uninstall() {
	validate_install_prefix
	echo "uninstalling git-le from '$INSTALL_PREFIX'"
	for script_file in $script_files $exec_files; do
		echo "rm -vf $INSTALL_PREFIX/$script_file"
		rm -vf "$INSTALL_PREFIX/$script_file"
	done
}

do_install() {
	validate_install_prefix
	if [ -d "$REPO_PATH" -a -d "$REPO_PATH/.git" ]; then
		echo "using existing repo in '$REPO_PATH'"
	else
		echo "cloning repo from github to '$repo_name'"
		git clone "$REPO_URL" "$repo_name"
	fi
	echo "installing git-le to '$INSTALL_PREFIX'"
	install -v -d -m 0755 "$INSTALL_PREFIX"
	for exec_file in $exec_files; do
		install -v -m 0755 "$REPO_PATH/$exec_file" "$INSTALL_PREFIX"
	done
	for script_file in $script_files; do
		install -v -m 0644 "$REPO_PATH/$script_file" "$INSTALL_PREFIX"
	done
}

ensure_repo_url() {
	if [ -z "$REPO_URL" ]; then
		REPO_URL="http://lpgithub.dev.lprnd.net/WebJedi/le-ui-gitflow.git"
	fi
}

ensure_repo_path() {
	if [ -z "$REPO_PATH" ]; then
		REPO_PATH="$repo_name"
	fi
}

ensure_install_prefix() {
	if [ -z "$INSTALL_PREFIX" ]; then
		if [[ $OSTYPE = "linux-gnu" || $OSTYPE = "darwin"* ]]; then # linux / mac osx
			INSTALL_PREFIX="/usr/local/bin"
		elif [[ $OSTYPE = "msys" ]]; then # mingw
			INSTALL_PREFIX="$EXEPATH/usr/local/bin"
		fi
	fi
}

validate_install_prefix() {
	if [ -z "$INSTALL_PREFIX" ]; then
		echo "the install prefix path was not set. use the INSTALL_PREFIX environment variable to set it manually."
		exit 1
	elif [ ! -d "$INSTALL_PREFIX" ]; then
		echo "the install prefix directory '$INSTALL_PREFIX' was not found."
		exit 1
	fi
}

main "$@"