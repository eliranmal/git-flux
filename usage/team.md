
## team

handle integration across team members and their features.

#### available actions

<dl>
	<dt><code>create <name> [-h]</code></dt>
	<dd>start a new team; create a local branch and push it to the remote.
the branch name will be composed of the pre-configured team prefix and the passed <code>name</code>.
aliases: <code>assemble</code>, <code>gather</code>, <code>huddle</code>.</dd>
</dl>
<dl>
	<dt><code>destroy <name> [-h]</code></dt>
	<dd>destroy an existing team; delete its local and remote branches, for good.
aliases: <code>disassemble</code>, <code>scatter</code>, <code>break</code>.</dd>
</dl>
<dl>
	<dt><code>join <name> [-h]</code></dt>
	<dd>join a team for the first time, or switch teams to another team.
after this, all new features will be based on the new team.
aliases: <code>switch</code>.</dd>
</dl>
<dl>
	<dt><code>sync <name> [-h]</code></dt>
	<dd>sync an existing team with its base branch (the integration branch).</dd>
</dl>