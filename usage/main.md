
    usage: git flux <init|feature|team|integration|rc|hf> [action] [action-args...] [-h]

## git-flux

git commands for fluent, team-oriented workflow.

#### flags
flags

-h
shows the f***ing manual. works everywhere, and context dependent. this means you can git flux -h, and also git flux feature -h or git flux feature start -h.

#### available subcommands

<dl>
	<dt><code>init</code></dt>
	<dd>initialize the git-flux configuration survey.<br/></dd>
</dl>
<dl>
	<dt><code>feature</code></dt>
	<dd>handle feature level actions.<br/></dd>
</dl>
<dl>
	<dt><code>team</code></dt>
	<dd>handle integration across team members and their features.<br/></dd>
</dl>
<dl>
	<dt><code>integration</code></dt>
	<dd>handle integration across teams.<br/></dd>
</dl>
<dl>
	<dt><code>rc</code></dt>
	<dd>handle lifecycle of release-candidates.<br/></dd>
</dl>
<dl>
	<dt><code>hf</code></dt>
	<dd>handle lifecycle of hot-fixes.<br/></dd>
</dl>

refer to each subcommand's help menu for an in-depth description of its actions (e.g. `git flux init -h`).
