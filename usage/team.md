
### team

handle integration across team members and their features.

available actions

   **create <name> [-h]**
      start a new team; create a local branch and push it to the remote.
      the branch name will be composed of the pre-configured team prefix and the passed `name`.
      aliases: `assemble`, `gather`, `huddle`.
 
   **destroy <name> [-h]**
      destroy an existing team; delete its local and remote branches, for good.
      aliases: `disassemble`, `scatter`, `break`.
 
   **join <name> [-h]**
      join a team for the first time, or switch teams to another team.
      after this, all new features will be based on the new team.
      aliases: `switch`.
 
   **sync <name> [-h]**
      sync an existing team with its base branch (the integration branch).
 