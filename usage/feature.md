
    git flux feature start|finish|sync|review <name> [<base>] [-h]

# feature

handle feature level actions.

## available actions

<dl>
	<dt><code>start &lt;name&gt; [&lt;base&gt;] [-h]</code></dt>
	<dd>start a new feature; create a local branch and push it to the remote.<br/>
the branch name will be composed of the pre-configured feature prefix and the passed <code>name</code>.<br/>
pass an optional <code>base</code> to set a custom base for the branch (default <code>base</code> is the current team branch).<br/></dd>
</dl>
 
<dl>
	<dt><code>finish &lt;name&gt; [-h]</code></dt>
	<dd>finish an existing feature; delete its local and remote branches, for good.<br/></dd>
</dl>
 
<dl>
	<dt><code>sync &lt;name&gt; [-h]</code></dt>
	<dd>sync an existing feature with its base branch, usually the current team branch, unless otherwise set when the feature was started.<br/></dd>
</dl>
 
<dl>
	<dt><code>review &lt;name&gt; [-h]</code></dt>
	<dd>open a pull request from the feature branch to its base branch, for review in github.<br/></dd>
</dl>



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
