
# future plans

- todo:
   - introduce an abstract notion of 'scopes', e.g. 'epic', 'team'
   - allow overriding of the base branch in the 'feature' subcommand
   - create a gitflux-survey script to hold all logic found in git-flux-init
   - talk about the option to open-source it

- document:
   - the git-flux model 'scopes' notion
   - git-flux addresses some of the issues in git-flow (e.g. we don't use `--no-ff`)

- exposure:
   - document it well
   - write tests (how to do this in bash? what's the convention?)
   - update the docs on setup to use the enterprise form:
   ```sh
   curl -H 'Authorization: token [some_token_with_lots_of_characters]' \
       -H 'Accept: application/vnd.github.v3.raw' \
       -O -L https://lpgithub.dev.lprnd.net/raw/eliranm/git-flux/master/bin/setup.sh
   ```
   - write a blog post (contact vladi regarding the dev-blogs platform)
