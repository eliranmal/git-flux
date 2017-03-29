
    git flux hf start|finish <name> [<tag>] [-h]

handle lifecycle of hot-fixes.

## available actions

<dl>
	<dt><code>start &lt;name&gt; &lt;tag&gt; [-h]</code></dt>
	<dd>start a hot-fix; create a local branch and push it to the remote.<br/>
the branch name will be composed of the pre-configured hot-fix prefix and the passed <code>name</code>.<br/>
it is advised that <code>name</code> will be the version this hot-fix refers to, e.g. '1.0.0'.<br/>
the passed <code>tag</code> will be used as the branch base.<br/></dd>
</dl>
 
<dl>
	<dt><code>finish &lt;name&gt; [-h]</code></dt>
	<dd>finish an existing hot-fix; delete its local and remote branches, for good.<br/></dd>
</dl>
 



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
