#!/usr/bin/env bash

echo "- - - git-le setup - - -"

if [[ "$OSTYPE" == "linux-gnu" || "$OSTYPE" == "darwin"* ]]; then # linux / mac osx
	INSTALL_PREFIX="/usr/local/bin"
elif [[ "$OSTYPE" == "msys" ]]; then # mingw
	INSTALL_PREFIX="$PROGRAMFILES/Git/usr/bin"
fi

if [ -z "$INSTALL_PREFIX" ] ; then
	echo "could not resolve install path prefix. use the INSTALL_PREFIX environment variable to set it manually."
fi

if [ -z "$REPO_URL" ] ; then
	REPO_URL="http://lpgithub.dev.lprnd.net/WebJedi/le-ui-gitflow.git"
fi

exec_files="git-le"
script_files="git-le-wat git-le-foo gitle-private-cmd"

case "$1" in
	help)
		echo "usage: [environment] setup.sh [install|uninstall]"
		echo "environment:"
		echo "   REPO_URL=$REPO_URL"
		echo "   REPO_PATH=$REPO_PATH"
		echo "   INSTALL_PREFIX=$INSTALL_PREFIX"
		exit
		;;
	uninstall)
		if [ ! -d "$INSTALL_PREFIX" ] ; then
			echo "the '$INSTALL_PREFIX' directory was not found. use the INSTALL_PREFIX environment variable to set it manually."
			exit
		fi
		echo "uninstalling git-le from $INSTALL_PREFIX"
		for script_file in $script_files $exec_files ; do
			echo "rm -vf $INSTALL_PREFIX/$script_file"
			rm -vf "$INSTALL_PREFIX/$script_file"
		done
		exit
		;;
	*)
		if [ ! -d "$INSTALL_PREFIX" ] ; then
			echo "the '$INSTALL_PREFIX' directory was not found. use the INSTALL_PREFIX environment variable to set it manually."
			exit
		fi
		echo "installing git-le to $INSTALL_PREFIX"
		if [ -d "$REPO_PATH" -a -d "$REPO_PATH/.git" ] ; then
			echo "using existing repo: $REPO_PATH"
			repo_dir="$REPO_PATH"
		else
			repo_name="le-ui-gitflow"
			echo "cloning repo from github to $repo_name"
			git clone "$REPO_URL" "$repo_name"
			repo_dir="$repo_name"
		fi
		install -v -d -m 0755 "$INSTALL_PREFIX"
		for exec_file in $exec_files ; do
			install -v -m 0755 "$repo_dir/$exec_file" "$INSTALL_PREFIX"
		done
		for script_file in $script_files ; do
			install -v -m 0644 "$repo_dir/commands/$script_file" "$INSTALL_PREFIX"
		done
		exit
		;;
esac