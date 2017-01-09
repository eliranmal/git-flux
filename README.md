# le-ui-gitflow

> provides workflow commands for ui development with git


# setup

## *nix

### install

- create a temporary directory, and navigate to it:

```sh
mkdir ~/tmp
cd ~/tmp
```

- run this:

```sh
curl -H 'Authorization: token 8ba9fcb4212fd9ba15371d60af1c3d10c73b5522' \
    -H 'Accept: application/vnd.github.v3.raw' \
    -O -L https://lpgithub.dev.lprnd.net/raw/UI-Group/le-ui-gitflow/master/bin/setup.sh
chmod +x setup.sh
./setup.sh
```

### uninstall

- navigate to the temporary directory created during install:

```sh
cd ~/tmp
```

- run this:

```sh
./setup.sh uninstall
```



## windows

### install

run `bin/msysgit-install.cmd` in the windows command prompt (i.e. **cmd**, 
not git-bash!). you may have to open cmd with administrator privileges.

### uninstall

sorry-not-sorry, there is no way to uninstall on windows. 
if you insist, dig through the `bin/msysgit-install.cmd` file, look for 
all the paths it copies files into, and manually remove them.


# usage

- *nix users, just fire up the terminal. you're good to go.
- windows ppl, open your git-bash shell.

