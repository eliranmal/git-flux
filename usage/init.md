
### init

configures the git-flux environment with an interactive survey.

here are the details you need to fill in:

- **<span style="color: #72b3cc">feature</span> prefix**  
  a prefix for feature branch names, defaults to `feature/`. 
  for example, `foo/` will result in feature branch names like `foo/my_awesome_feature`.

- **<span style="color: #d0b03c">team</span> prefix**  
  a prefix for team branch names, defaults to `team/`.

- **<span style="color: #8eb33b">release candidate</span> prefix**  
  a prefix for release candidate branch names, defaults to `rc/`.

- **<span style="color: #c75646">hot-fix</span> prefix**  
  a prefix for hot-fix branch names, defaults to `hf/`.

- **<span style="color: #c8a0d1">integration</span> branch**  
  the long-lived integration branch name, defaults to `integration`. 
  this branch serves as the base to all team branches, and will be created if it does not already exist.
 