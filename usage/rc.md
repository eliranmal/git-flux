
## rc

handle lifecycle of release-candidates.

#### available actions

   **start <name> [-h]**
      start a release-candidate; create a local branch and push it to the remote.
      the branch name will be composed of the pre-configured release-candidate prefix and the passed `name`.
 
   **finish <name> [-h]**
      finish an existing release-candidate; delete its local and remote branches, for good.
 