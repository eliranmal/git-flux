
    git flux team create|destroy|sync|review|switch <name> [-h]

# team

handle integration across team members and their features.

## available actions

<dl>
	<dt><code>create &lt;name&gt; [-h]</code></dt>
	<dd>start a new team; create a local branch and push it to the remote.<br/>
the branch name will be composed of the pre-configured team prefix and the passed <code>name</code>.<br/>
aliases: <code>assemble</code>, <code>gather</code>, <code>huddle</code>.<br/></dd>
</dl>
 
<dl>
	<dt><code>destroy &lt;name&gt; [-h]</code></dt>
	<dd>destroy an existing team; delete its local and remote branches, for good.<br/>
aliases: <code>disassemble</code>, <code>scatter</code>, <code>break</code>.<br/></dd>
</dl>
 
<dl>
	<dt><code>sync &lt;name&gt; [-h]</code></dt>
	<dd>sync an existing team with its base branch, i.e. the integration branch.<br/></dd>
</dl>
 
<dl>
	<dt><code>review &lt;name&gt; [-h]</code></dt>
	<dd>open a pull request from the team branch to its base branch, i.e. the integration branch, for review in github.<br/></dd>
</dl>
 
<dl>
	<dt><code>switch &lt;name&gt; [-h]</code></dt>
	<dd>switch teams to another team, or join a team for the first time.<br/>
after this, all new features will be based on the new team.<br/>
aliases: <code>switch</code>.<br/></dd>
</dl>



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
