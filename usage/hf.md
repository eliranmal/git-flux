
<span style="color: #c75646">### hf</span>

handle lifecycle of hot-fixes.

##### available actions

   **start <name> <tag> [-h]**
      start a hot-fix; create a local branch and push it to the remote.
      the branch name will be composed of the pre-configured hot-fix prefix and the passed `name`.
      the passed `tag` will be used as the branch base.
 
   **finish <name> [-h]**
      finish an existing hot-fix; delete its local and remote branches, for good.
 