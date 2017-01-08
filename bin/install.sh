#!/usr/bin/env bash

# currently supporting default *nix systems, to support more flavors, use this: https://gist.github.com/eliranmal/567ecf4b40a4a5cc0218
INSTALL_PREFIX="/usr/local/bin"
REPO_NAME="le-ui-gitflow"
REPO_HOME="http://lpgithub.dev.lprnd.net/UI-Group/le-ui-gitflow.git"

EXEC_FILES="git-le"
SCRIPT_FILES="git-le-wat git-le-foo"

echo "### gitflow no-make installer ###"

case "$1" in
	uninstall)
		echo "Uninstalling git-flow from $INSTALL_PREFIX"
		if [ -d "$INSTALL_PREFIX" ] ; then
			for script_file in $SCRIPT_FILES $EXEC_FILES ; do
				echo "rm -vf $INSTALL_PREFIX/$script_file"
				rm -vf "$INSTALL_PREFIX/$script_file"
			done
		else
			echo "The '$INSTALL_PREFIX' directory was not found."
			echo "Do you need to set INSTALL_PREFIX ?"
		fi
		exit
		;;
	help)
		echo "Usage: [environment] gitflow-installer.sh [install|uninstall]"
		echo "Environment:"
		echo "   INSTALL_PREFIX=$INSTALL_PREFIX"
		echo "   REPO_HOME=$REPO_HOME"
		echo "   REPO_NAME=$REPO_NAME"
		exit
		;;
	*)
		echo "Installing git-flow to $INSTALL_PREFIX"
		if [ -d "$REPO_NAME" -a -d "$REPO_NAME/.git" ] ; then
			echo "Using existing repo: $REPO_NAME"
		else
			echo "Cloning repo from GitHub to $REPO_NAME"
			git clone "$REPO_HOME" "$REPO_NAME"
		fi
		install -v -d -m 0755 "$INSTALL_PREFIX"
		for exec_file in $EXEC_FILES ; do
			install -v -m 0755 "$REPO_NAME/$exec_file" "$INSTALL_PREFIX"
		done
		for script_file in $SCRIPT_FILES ; do
			install -v -m 0644 "$REPO_NAME/commands/$script_file" "$INSTALL_PREFIX"
		done
		exit
		;;
esac