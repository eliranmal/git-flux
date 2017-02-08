
     git flux rc <start|finish> <name> [-h]

## rc

handle lifecycle of release-candidates.

#### available actions

<dl>
	<dt><code>start &lt;name&gt; [-h]</code></dt>
	<dd>start a release-candidate; create a local branch and push it to the remote.<br/>
the branch name will be composed of the pre-configured release-candidate prefix and the passed <code>name</code>.<br/></dd>
</dl>
<dl>
	<dt><code>finish &lt;name&gt; [-h]</code></dt>
	<dd>finish an existing release-candidate; delete its local and remote branches, for good.<br/></dd>




<sub style="display: inline-block; text-align: right;"><i>auto-generated with <b>dox</b></i></sub>
