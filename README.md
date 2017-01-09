# le-ui-gitflow

> provides workflow commands for live-engage ui development with git


## prerequisites

- __windows__: [git windows client][1] (you need git-bash)
- __\*nix__: none!


## setup

### *nix

#### install

- create a temporary directory (or use an existing one), and navigate to it:
  
  ```sh
  mkdir ~/tmp
  cd ~/tmp
  ```

- get the setup script, and run it:
  
  ```sh
  curl -H 'Authorization: token 8ba9fcb4212fd9ba15371d60af1c3d10c73b5522' \
      -H 'Accept: application/vnd.github.v3.raw' \
      -O -L https://lpgithub.dev.lprnd.net/raw/WebJedi/le-ui-gitflow/master/bin/setup.sh
  chmod +x setup.sh
  ./setup.sh
  ```

#### uninstall

- navigate to the temporary directory used during install:
  
  ```sh
  cd ~/tmp
  ```

- run the setup script again, with the `uninstall` option:
  
  ```sh
  ./setup.sh uninstall
  ```


### windows

#### install

fire up git-bash __as administrator__, and:
  
- create a temporary directory (or use an existing one), and navigate to it:
  
  ```sh
  mkdir ~/tmp
  cd ~/tmp
  ```

- get the setup script, and run it:
  
  ```sh
  curl -H 'Authorization: token 8ba9fcb4212fd9ba15371d60af1c3d10c73b5522' -H 'Accept: application/vnd.github.v3.raw' -O -L https://lpgithub.dev.lprnd.net/raw/WebJedi/le-ui-gitflow/master/bin/msysgit-install.cmd
  ./msysgit-install.cmd
  ```

#### uninstall

sorry-not-sorry; there is no way to uninstall on windows. 

if you insist, dig through the `bin/msysgit-install.cmd` file, look for 
all the paths it copies files into, and manually remove them.


## usage

this tool only supports bash/msysgit/mingw32, so:

- *nix users, just fire up the terminal. you're good to go.
- windows ppl, open your [git-bash][1], please.


todo - document usage some more..






[1]: https://git-scm.com/download/win