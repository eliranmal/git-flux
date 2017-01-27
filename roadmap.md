
# future plans

- todo:
   - integrate hub for pull-requests
   - prompt for creating new integration branch on init
   - ~~create 'gitflux-config' wrapper~~
   - consider delegating `sync` operations all the way up the bases tree
   - redirect builtin commands stderr to an `error.log` file
   - introduce 'epic' level, capable of aggregating teams *or* features
   - ~~allow overriding the base branch in the 'feature' subcommand~~
   - ~~generalize prompting in the terminal to encapsulate all that 
   verbosity in git-flux-init~~
   - ~~talk about the option to open-source it~~
   - unit tests: explore these libs (ordered by # of stars in github)
      - [bats][1]
      - [assert.sh][2]
      - [shunit2][3]
      - [epoxy][4]
      - [bashtest][5]

- document:
   - an overview of the git-flux model, specifically the levels.
   - elaborate on teams and the ability to switch teams with the `join` action
   - the fact that git-flux addresses some of the issues in git-flow 
   (e.g. we never use `--no-ff`, all merges are done with default strategy)

- exposure:
   - document it well
   - write unit tests
   - search/replace any hard references to the repo url
   - update the docs on setup to use the enterprise form:
   ```sh
   curl -H 'Authorization: token [some_token_with_lots_of_characters]' \
       -H 'Accept: application/vnd.github.v3.raw' \
       -O -L https://lpgithub.dev.lprnd.net/raw/eliranm/git-flux/master/bin/setup.sh
   ```
   - write a blog post (contact vladi regarding the dev-blogs platform)





[1]: https://github.com/sstephenson/bats
[2]: https://github.com/lehmannro/assert.sh
[3]: https://github.com/kward/shunit2
[4]: https://github.com/spbnick/epoxy
[5]: https://github.com/pahaz/bashtest
