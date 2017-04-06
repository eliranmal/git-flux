
    git flux init [-h]

# init

configure the git-flux environment with an interactive survey.

here are the details you need to fill in:

- **feature prefix**  \n  a prefix for feature branch names, defaults to `feature/`.
  for example, `foo/` will result in feature branch names like `foo/my_awesome_feature`, and `feature/foo/` will generate names like `feature/foo/my_awesome_feature`.

- **team prefix**  \n  a prefix for team branch names, defaults to `team/`.

- **release candidate prefix**  \n  a prefix for release candidate branch names, defaults to `rc/`.

- **hot-fix prefix**  \n  a prefix for hot-fix branch names, defaults to `hf/`.

- **integration branch**  \n  the long-lived integration branch name, defaults to `integration`.
  this branch serves as the base to all team branches, and will be created if not already exists.



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
