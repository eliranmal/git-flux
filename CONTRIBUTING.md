
# contributing

[pull-request][7] are very welcomed. i'll check them out, i promise :heart:

## code style

in lieu of a formal styleguide, take care to maintain the existing coding style.

## development environment setup

1. clone the repository, including submodules:
   
   ```sh
   git clone --recursive https://github.com/eliranmal/git-flux.git
   ```
   
   you can fork it beforehand, or clone directly from the original repository.

1. run the [hookup.sh][5] script. its job is to set-up git hooks, and it 
only needs to run once.  
the pre-commit hook will take care of updating the auto-generated documentation 
when you make changes to the help text (the output of `-h`), and will run 
before commits with changes in `git-flux*` files.  
if you don't want this behavior - just skip this step.

1. create a brand new repository on github and clone it locally (you can 
call it *git-flux-playground*).  
its sole purpose will be playing around with git-flux commands and test 
your new awesome code.

1. make some changes to the source code (a.k.a. *"your new awesome code"*).

1. install git-flux from the source code; use the [setup-dev.sh][6] 
script for that:
   
   ```sh
   ./bin/setup-dev.sh update
   ```
   
   repeat this command whenever you make changes to your code and want to 
test them in your playground repository.

1. iterate the last two steps until you've made peace with your code.








[5]: /bin/hookup.sh
[6]: /bin/setup-dev.sh
[7]: https://github.com/eliranmal/git-flux/compare
