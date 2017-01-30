
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
a prefix for feature branch names, defaults to 'feature/'. 
for example, 'foo/' will result in feature branch names like 'foo/my_awesome_feature'.

- team prefix?  
your team's branch name prefix, defaults to 'team/'.

- release candidate prefix?  
a prefix for release candidate branch names, defaults to 'rc/'.

- hot-fix prefix?  
a prefix for hot-fix branch names, defaults to 'hf/'.

- integration branch?  
the long-lived integration branch name, defaults to 'integration'. 
this branch serves as the base to all team branches, and will be created if it does not already exist.
 

(this sub-command has no actions).


##### `feature`

handle feature level actions.

###### actions

- **`start <name> [base]`**  
start a new feature; create a local branch and push it to the remote.
the branch name will be composed of the pre-configured feature prefix and the passed **name**.
pass an optional **base** to set a custom base for the branch (default **base** is the current team branch).

**`finish <name>`**  
finish an existing feature; delete its local and remote branches, for good.

- **`sync <name>`**  
sync an existing feature with its base branch, usually the current team branch, unless otherwise set when the feature was started.


##### `team`

handle integration across team members and their features.

###### actions

- **`create <name>`**  
start a new team; create a local branch and push it to the remote.
the branch name will be composed of the pre-configured team prefix and the passed **`name`**.
aliases: **`assemble`**, **`gather`**, **`huddle`**.

- **`destroy <name>`**  
destroy an existing team; delete its local and remote branches, for good.
aliases: **`disassemble`**, **`scatter`**, **`break`**.

- **`sync <name>`**  
sync an existing team with its base branch (the integration branch).

- **`join <name>`**  
join a team for the first time, or switch teams to another team.
after this, all new features will be based on the new team.
aliases: **`switch`**.


##### `integration`

handle integration across teams.

###### actions

- **`sync <name>`**  
pulls changes from the base branch, i.e. 'master', into the integration branch.


##### `rc`

handle lifecycle of release-candidates.

###### actions

- **`start <next-version>`**  
start a release-candidate; create a local branch and push it to the remote.
the branch name will be composed of the pre-configured release-candidate prefix and the passed **`next-version`**.

- **`finish <next-version>`**  
finish an existing release-candidate; delete its local and remote branches, for good.


##### `hf`

handle lifecycle of hot-fixes.

###### actions

- **`start <version>`**  
start a hot-fix; create a local branch and push it to the remote.
the branch name will be composed of the pre-configured hot-fix prefix and the passed **`version`**.

- **`finish <version>`**  
finish an existing release-candidate; delete its local and remote branches, for good.



## gotcha's

- if you `git rebase --onto` (which [you shouldn't][2]), bad stuff will 
happen. why? because the branch base (for `start`ed features, `create`ed 
teams, etc.) is saved to the git config, and not dynamically resolved via git.







[1]: https://git-scm.com/download/win
[2]: https://git-scm.com/book/en/v2/Git-Branching-Rebasing#_rebase_peril
[3]: https://danlimerick.wordpress.com/2011/07/11/git-for-windows-tip-setting-home-and-the-startup-directory/
