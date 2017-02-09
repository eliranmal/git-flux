
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

(windows users may skip the `chmod` bit).

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

see the [usage][4] directory for full usage.


## gotcha's

- if you `git rebase --onto` (which [you shouldn't][2]), bad stuff will 
happen. why? because the branch base (for `start`ed features, `create`ed 
teams, etc.) is saved to the git config, and not dynamically resolved via git.







[1]: https://git-scm.com/download/win
[2]: https://git-scm.com/book/en/v2/Git-Branching-Rebasing#_rebase_peril
[3]: https://danlimerick.wordpress.com/2011/07/11/git-for-windows-tip-setting-home-and-the-startup-directory/
[4]: /usage
