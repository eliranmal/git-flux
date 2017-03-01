
# git-flux

> git commands for fluent, team-oriented workflow


## prerequisites

this tool only supports bash/mingw32, so:

**mac/linux users**  
just fire up the terminal. you're good to go.

**windows people**  
open your [git-bash][1] *'as administrator'*, please.  
(by the way, does it open up in `U:\`? [this might help][3]).


## setup

#### install

```sh
mkdir ~/tmp
cd ~/tmp
curl -O https://raw.githubusercontent.com/eliranmal/git-flux/master/bin/setup.sh
chmod +x setup.sh
./setup.sh
```

(windows users can skip the `chmod` bit).

#### uninstall

```sh
cd ~/tmp
./setup.sh uninstall
```

#### update

```sh
cd ~/tmp
./setup.sh update
```


## usage

from the terminal, use the `-h` flag anywhere, or see the [usage][4] 
directory of this repository for the markdown-formatted help.


## gotcha's

- if you `git rebase --onto` (which [you shouldn't][2]), bad stuff will 
happen. why? because the branch base (for `start`ed features, `create`ed 
teams, etc.) is saved to the git config, and not dynamically resolved via git.


## troubleshooting

- **\[git-bash\] pull/push fails ([#37][6])**
  
  if your git-bash prompts you for credentials on each git command, 
  git-flux commands may fail for no apparent reason.  
  this happens due a [bug in git-for-windows][5], and can be worked-around
  if you disable the tedious credentials prompt and tell git to use a 
  credential helper and just store it for you:
  
  ```sh
  git config --global credential.helper wincred
  ```







[1]: https://git-scm.com/download/win
[2]: https://git-scm.com/book/en/v2/Git-Branching-Rebasing#_rebase_peril
[3]: https://danlimerick.wordpress.com/2011/07/11/git-for-windows-tip-setting-home-and-the-startup-directory/
[4]: /usage
[5]: https://github.com/git-for-windows/git/issues/327
[6]: https://github.com/eliranmal/git-flux/issues/37
