# le-ui-gitflow

> provides git commands for live-engage ui workflow


## prerequisites

this tool only supports bash/mingw32, so:

- *nix users, just fire up the terminal. you're good to go.
- windows ppl, open your [git-bash][1], please.


## setup

### install

- create a temporary directory (or use an existing one), and navigate to it:
  
  ```sh
  mkdir ~/tmp
  cd ~/tmp
  ```

- get the setup script:
  
  ```sh
  curl -H 'Authorization: token 8ba9fcb4212fd9ba15371d60af1c3d10c73b5522' \
      -H 'Accept: application/vnd.github.v3.raw' \
      -O -L https://lpgithub.dev.lprnd.net/raw/WebJedi/le-ui-gitflow/master/bin/setup.sh
  ```

- (*nix only) grant it with execute permissions:
  
  ```sh
  chmod +x setup.sh
  ```

- run it:
  
  ```sh
  ./setup.sh
  ```

### uninstall

- navigate to the temporary directory used during install:
  
  ```sh
  cd ~/tmp
  ```

- run the setup script again, with the `uninstall` option:
  
  ```sh
  ./setup.sh uninstall
  ```


## usage

    git le <command> [action] [-h]

note that you can use the `-h` flag anywhere to show full usage.

### available commands

#### `init`

initializes the repository with information about branch names etc. 
(this command has no actions).

#### `feature`

handles feature branches.

available actions:
   - **`todo`**: some action...

#### `team`

handles integration with the team branch.

available actions:
   - **`todo`**: some action...







[1]: https://git-scm.com/download/win