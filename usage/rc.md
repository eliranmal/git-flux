
    git flux rc start|finish|review <name> [-h]

# rc

handle lifecycle of release-candidates.

## available actions

<dl>
	<dt><code>start &lt;name&gt; [-h]</code></dt>
	<dd>start a release-candidate; create a local branch and push it to the remote.<br/>
the branch name will be composed of the pre-configured release-candidate prefix and the passed <code>name</code>.<br/>
it is advised that <code>name</code> will be the next version, e.g. '1.1.0'.<br/></dd>
</dl>
 
<dl>
	<dt><code>finish &lt;name&gt; [-h]</code></dt>
	<dd>finish an existing release-candidate; delete its local and remote branches, for good.<br/></dd>
</dl>
 
<dl>
	<dt><code>review &lt;name&gt; [-h]</code></dt>
	<dd>opens a pull request from the release-candidate branch to its base branch, i.e. the integration branch, for review in github.<br/></dd>
</dl>
 



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
