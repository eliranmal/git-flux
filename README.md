
# git-flux

> git commands for fluent, team-oriented workflow


## prerequisites

this tool only supports bash/mingw32, so:

- *nix users, just fire up the terminal. you're good to go.
- windows ppl, open your [git-bash][1] *as administrator*, please 
(does it open up in `U:\`? [this might help][3]).


## setup

#### install

- create a temporary directory (or use an existing one), and navigate to it:
  
  ```sh
  mkdir ~/tmp
  cd ~/tmp
  ```

- get the setup script:
  
  ```sh
  curl -O https://raw.githubusercontent.com/eliranmal/git-flux/master/bin/setup.sh
  ```

- (*nix only) grant it with execute permissions:
  
  ```sh
  chmod +x setup.sh
  ```

- run it:
  
  ```sh
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


## usage

    git flux <sub-command> [action] [action-args...] [-h]

#### flags

- **`-h`**: shows the f***ing manual. works everywhere, and context 
dependent. this means you can `git flux -h`, and also `git flux feature -h`.


#### sub-commands


##### `init`

configures the git-flux environment with an interactive survey.

here are the questions you'd have to answer:

- feature prefix?  
a prefix for feature branch names, defaults to 'feature/'. for example, 
'foo/' will result in feature branch names like 'foo/my_awesome_feature'.

- team prefix?  
your team's branch name prefix, defaults to 'team/'.

- release candidate prefix?  
a prefix for release candidate branch names, defaults to 'rc/'.

- hot-fix prefix?  
a prefix for hot-fix branch names, defaults to 'hf/'.

- integration branch?  
the long-lived integration branch name, defaults to 'integration'. this 
branch serves as the base to all team branches, and will be created if 
it does not already exist.
 

(this sub-command has no actions).


##### `feature`

start working on a new feature, finish working on it, and what have you.

###### actions

- **`start <name>`**: create a new branch based on the team branch, 
and switch to it.
- **`finish <name>`**: delete that old feature branch, and its remote, too.
- **`sync <name>`**: get the latest changes from the team branch.
- **`push <name>`**: push local changes to the remote.
- **`pull <name>`**: pull remote changes to the local.


##### `team`

handles integration among team members and their features.

###### actions

- **`sync <name>`**: get the latest changes from the integration branch.


##### `integration`

handles integration among teams and their content.

###### actions

- **`sync <name>`**: get the latest changes from the master branch.



## gotcha's

- if you `git rebase --onto` (which [you shouldn't][2]), bad stuff will 
happen. why? because the branch base (for `start`ed features, `create`ed 
teams, etc.) is saved to the git config, and not dynamically resolved via git.







[1]: https://git-scm.com/download/win
[2]: https://git-scm.com/book/en/v2/Git-Branching-Rebasing#_rebase_peril
[3]: https://danlimerick.wordpress.com/2011/07/11/git-for-windows-tip-setting-home-and-the-startup-directory/
