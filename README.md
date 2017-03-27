
# git-flux

> git commands for fluent, collaborative workflow


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


## contributing

in lieu of a formal styleguide, take care to maintain the existing coding style.

### development environment setup

1. clone the repository locally (preferably with the default name; *git-flux*). 
you can fork it beforehand, or clone directly from the original repository.

1. run the [hookup.sh][5] script. its job is to set-up git hooks, and it 
only needs to run once.  
the pre-commit hook will take care of updating the auto-generated documentation 
when you make changes to the help text (the output of `-h`).

1. create a brand new repository on github and clone it locally (you can 
call it *git-flux-playground*).  
its sole purpose will be playing around with git-flux commands and test 
your new awesome code.

1. make some changes to the source code (a.k.a. *"your new awesome code"*).

1. install git-flux from the source code; use the [dev-setup.sh][6] 
script for that:
   
   ```sh
   ./bin/dev-setup.sh update
   ```
   
   repeat this command whenever you make changes to your code and want to 
test them in your playground repository.

1. open a [pull-request][7]. i'll check it out, i promise.








[1]: https://git-scm.com/download/win
[2]: https://git-scm.com/book/en/v2/Git-Branching-Rebasing#_rebase_peril
[3]: https://danlimerick.wordpress.com/2011/07/11/git-for-windows-tip-setting-home-and-the-startup-directory/
[4]: /usage
[5]: /bin/hookup.sh
[6]: /bin/dev-setup.sh
[7]: https://github.com/eliranmal/git-flux/compare
