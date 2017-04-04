
# git-flux

> git commands for fluent, collaborative workflow


## overview

- [ ] todo - fill this up with the overview


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
curl -O https://raw.githubusercontent.com/eliranmal/git-flux/master/bin/setup.sh
chmod +x setup.sh
./setup.sh
```

(windows users can skip the `chmod` bit).

#### update

after git-flux is installed, you can use the [`update`][6] subcommand to 
update git-flux with git-flux (mind = blown):

```sh
git flux update [<tag>]
```

use a tag if you want a specific version.

you can also use the setup script for that, but that's way less cool:

```sh
[env REPO_REF=<tag>] ./setup.sh update
```

#### uninstall

```sh
./setup.sh uninstall
```


## usage

from the terminal, use the `-h` flag anywhere, or see the [usage][4] 
directory of this repository for the markdown-formatted help.


## gotcha's

- if you `git rebase --onto` (which [you shouldn't][2]), bad stuff will 
happen. why? because the branch base (for `start`ed features, `create`ed 
teams, etc.) is saved to the git config, and not dynamically resolved via git.


## contributing

thank you :heart: [read this][5].





[1]: https://git-scm.com/download/win
[2]: https://git-scm.com/book/en/v2/Git-Branching-Rebasing#_rebase_peril
[3]: https://danlimerick.wordpress.com/2011/07/11/git-for-windows-tip-setting-home-and-the-startup-directory/
[4]: /usage
[5]: /CONTRIBUTING.md
[6]: /usage/update.md
