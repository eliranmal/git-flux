
feature
-------

handle feature level actions.

available actions

   feature start <name> [base] [-h]
      start a new feature; create a local branch and push it to the remote.
      the branch name will be composed of the pre-configured feature prefix and the passed name.
      pass an optional base to set a custom base for the branch (default base is the current team branch).
 
   feature finish <name> [-h]
      finish an existing feature; delete its local and remote branches, for good.
 
   feature sync <name> [-h]
      sync an existing feature with its base branch, usually the current team branch, unless otherwise set when the feature was started.
 