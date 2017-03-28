
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

1. run the [hookup.sh][5] script. it only needs to run once, and its job 
is to:
   
   - **initialize git-hooks**  
     this is optional - if you just hate git-hooks, you can pass `nohooks` 
     as the first argument.
     the [pre-commit][4] hook will take care of updating the auto-generated 
     documentation when you make changes to the help text (the output of 
     `-h`), and will run before commits with changes in `git-flux*` files.  
   
   - **ensure submodules are in place**  
     in case you forgot to clone it with `--recursive`, or whatever.

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








[4]: /bin/hooks/pre-commit
[5]: /bin/hookup.sh
[6]: /bin/setup-dev.sh
[7]: https://github.com/eliranmal/git-flux/compare
