
## feature

handle feature level actions.

#### available actions

<dl>
	<dt><code>start <name> [base] [-h]</code></dt>
	<dd>start a new feature; create a local branch and push it to the remote.
the branch name will be composed of the pre-configured feature prefix and the passed <code>name</code>.
pass an optional <code>base</code> to set a custom base for the branch (default <code>base</code> is the current team branch).</dd>
</dl>
<dl>
	<dt><code>finish <name> [-h]</code></dt>
	<dd>finish an existing feature; delete its local and remote branches, for good.</dd>
</dl>
<dl>
	<dt><code>sync <name> [-h]</code></dt>
	<dd>sync an existing feature with its base branch, usually the current team branch, unless otherwise set when the feature was started.</dd>
</dl>