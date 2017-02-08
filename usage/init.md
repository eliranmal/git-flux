
### init

configures the git-flux environment with an interactive survey.

here are the questions you'd have to answer:

**feature prefix?**  
  a prefix for feature branch names, defaults to 'feature/'. 
  for example, 'foo/' will result in feature branch names like 'foo/my_awesome_feature'.

- **team prefix?**  
  a prefix for team branch names, defaults to 'team/'.

   - release candidate prefix?
      a prefix for release candidate branch names, defaults to 'rc/'.

   - hot-fix prefix?
   a prefix for hot-fix branch names, defaults to 'hf/'.

   **integration branch?**
      the long-lived integration branch name, defaults to 'integration'. 
      this branch serves as the base to all team branches, and will be created if it does not already exist.
 