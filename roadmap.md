
# future plans

- todo:
   - introduce 'epic' level, capable of aggregating teams *or* features
   - ~~allow overriding the base branch in the 'feature' subcommand~~
   - ~~generalize prompting in the terminal to encapsulate all that 
   verbosity in git-flux-init~~
   - ~~talk about the option to open-source it~~

- document:
   - an overview of the git-flux model, specifically the levels.
   - elaborate on teams and the ability to switch teams with the `join` action
   - the fact that git-flux addresses some of the issues in git-flow 
   (e.g. we never use `--no-ff`, all merges are done with default strategy)

- exposure:
   - document it well
   - write tests (how to do this in bash? what's the convention?)
   - search/replace any hard references to the repo url
   - update the docs on setup to use the enterprise form:
   ```sh
   curl -H 'Authorization: token [some_token_with_lots_of_characters]' \
       -H 'Accept: application/vnd.github.v3.raw' \
       -O -L https://lpgithub.dev.lprnd.net/raw/eliranm/git-flux/master/bin/setup.sh
   ```
   - write a blog post (contact vladi regarding the dev-blogs platform)
