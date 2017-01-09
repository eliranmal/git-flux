#!/usr/bin/env bash

if [ -z "$INSTALL_PREFIX" ] ; then
	# currently supporting default prefix in common *nix systems, to support more flavors, use this: https://gist.github.com/eliranmal/567ecf4b40a4a5cc0218
	INSTALL_PREFIX="/usr/local/bin"
fi

if [ -z "$REPO_URL" ] ; then
	REPO_URL="http://lpgithub.dev.lprnd.net/UI-Group/le-ui-gitflow.git"
fi

REPO_NAME="le-ui-gitflow"
EXEC_FILES="git-le"
SCRIPT_FILES="git-le-wat git-le-foo"

echo "### git-le setup ###"

case "$1" in
	help)
		echo "usage: [environment] setup.sh [install|uninstall]"
		echo "environment:"
		echo "   INSTALL_PREFIX=$INSTALL_PREFIX"
		echo "   REPO_URL=$REPO_URL"
		echo "   REPO_PATH=$REPO_PATH"
		exit
		;;
	uninstall)
		echo "uninstalling git-le from $INSTALL_PREFIX"
		if [ -d "$INSTALL_PREFIX" ] ; then
			for script_file in $SCRIPT_FILES $EXEC_FILES ; do
				echo "rm -vf $INSTALL_PREFIX/$script_file"
				rm -vf "$INSTALL_PREFIX/$script_file"
			done
		else
			echo "the '$INSTALL_PREFIX' directory was not found."
			echo "do you need to set INSTALL_PREFIX ?"
		fi
		exit
		;;
	*)
		echo "installing git-le to $INSTALL_PREFIX"
		if [ -d "$REPO_PATH" -a -d "$REPO_PATH/.git" ] ; then
			echo "Using existing repo: $REPO_PATH"
			repo_dir="$REPO_PATH"
		else
			echo "cloning repo from github to $REPO_NAME"
			git clone "$REPO_URL" "$REPO_NAME"
			repo_dir="$REPO_NAME"
		fi
		install -v -d -m 0755 "$INSTALL_PREFIX"
		for exec_file in $EXEC_FILES ; do
			install -v -m 0755 "$repo_dir/$exec_file" "$INSTALL_PREFIX"
		done
		for script_file in $SCRIPT_FILES ; do
			install -v -m 0644 "$repo_dir/commands/$script_file" "$INSTALL_PREFIX"
		done
		exit
		;;
esac