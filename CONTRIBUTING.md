
# contributing

## submitting issues

- if it's a bug, please include sufficient information to reproduce the 
problem.  
it would help a lot if you can attach a trace log. check out the 
[trace/debug][2] section to see how to do it.

- for issues with text formatting or colors, post at the [styli.sh][1] 
repo.


## development

### environment setup

1. clone the repository locally, including submodules:
   
   ```sh
   git clone --recursive https://github.com/eliranmal/git-flux.git
   ```

1. run the [dev-env.sh][5] script:
   
   ```sh
   ./bin/dev-env.sh [nohooks]
   ```
   
   it only needs to run once, and its job is to:
   
   - **initialize git-hooks**  
     this is optional - if you run into issues, or you just hate 
     git-hooks, you can pass `nohooks` as the first argument.
     
     the [pre-commit][4] hook will take care of updating the auto-generated 
     documentation when you make changes to the help text (the output of 
     `-h`), and will run before commits with changes in `git-flux*` files.
     
     the [post-commit][3] hook is only there to bypass an issue with 
     JetBrains IDE's - they use `--only` in the commit command, so the 
     auto-generated files seem to have changes after the commit. we fool 
     them by updating these files from the index if they were changed.
   
   - **ensure submodules are in place**  
     in case you forgot to clone it with `--recursive`, or whatever.

1. create a brand new repository on github and clone it locally (you can 
call it *git-flux-playground*).  
its sole purpose will be playing around with git-flux commands and test 
your new awesome code.

### lifecycle / workflow

1. make some changes to the source (a.k.a. *"your new awesome code"*).

1. install git-flux from the source; use the [setup-dev.sh][6] 
script for that:
   
   ```sh
   ./bin/setup-dev.sh update
   ```

1. test your changes in the playground repository by running the updated 
commands.
   
   see [trace/debug][2] for easier debugging.

1. iterate the last three steps until you've made peace with your code.

1. open a [pull-request][7], and i'll check it out :heart:

### code style

in lieu of a formal styleguide, take care to maintain the existing coding style.

### tips & tricks

#### trace/debug

you can get a (much) more detailed log in the terminal if you prepend 
`trace` or `debug` to any subcommand. under the hood, it will set `-x` 
and run bash in debug mode.

for example, to investigate `git flux feature start foo`, type:

```sh
git flux debug feature start foo
```

you can also dump everything to a log file:

```sh
git flux trace <subcommand> [<args>] > trace.log 2>&1
```




[1]: https://github.com/eliranmal/styli.sh
[2]: #tracedebug
[3]: /bin/hooks/post-commit
[4]: /bin/hooks/pre-commit
[5]: /bin/dev-env.sh
[6]: /bin/setup-dev.sh
[7]: https://github.com/eliranmal/git-flux/compare
