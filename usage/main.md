
    git flux init|feature|team|integration|rc|hf|update [<action>] [<action-args>...] [ -h]

# git-flux

git commands for fluent, collaborative workflow.

## flags

<dl>
	<dt><code>-h</code></dt>
	<dd>shows the f***ing manual. works everywhere, and context dependent.<br/>
this means you can <code>git flux -h</code>, and also <code>git flux feature -h</code> or <code>git flux feature start -h</code>.<br/></dd>
</dl>

## available subcommands

<dl>
	<dt><code>init</code></dt>
	<dd>configure the git-flux environment with an interactive survey.<br/></dd>
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

<dl>
	<dt><code>update</code></dt>
	<dd>auto-magically updates git-flux.<br/></dd>
</dl>

refer to each subcommand's help menu for an in-depth description of its actions (e.g. `git flux init -h`).
 



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
