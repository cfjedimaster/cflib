<cfprocessingdirective pageencoding="utf-8">
<cfset rc.title = rc.udf.getName()>
	
<cfset argstr = "">
<cfset argData = arrayNew(1)>
<cfif len(rc.udf.getArgs())>
	<cfwddx action="wddx2cfml" input="#rc.udf.getArgs()#" output="argdata">
	<cfset argstr = "(">
	<cfloop index="x" from=1 to="#arraylen(argData)#">
		<cfif argdata[x].req>
			<cfif x is not 1>
				<cfset argstr = argstr & ", ">
			</cfif>
			<cfset argstr = argstr & argdata[x].name>
		<cfelse>
			<cfif x is not 1>
				<cfset argstr = argstr & " [, ">
			<cfelse>
				<cfset argstr = argstr & "[">
			</cfif>
			<cfset argstr = argstr & argdata[x].name & "]">
		</cfif>
	</cfloop>
	<cfset argstr = argstr & ")">
</cfif>

<cfif rc.udf.getRateCount() neq "" and rc.udf.getRateCount() gte 1>
	<cfset rate = helpers.util.decimalRound(rc.udf.getRateTotal()/rc.udf.getRateCount(), 1, "up")>
<cfelse>
	<cfset rate = 0>
</cfif>

<cfoutput>
<h2>#trim(rc.udf.getName())##argStr#</h2>
<h5 class="lastUpdated">Last updated #dateFormat(rc.udf.getLastUpdated(), "mmmm d, yyyy")#</h5>

<div class="author">
	<a href="/udfdownload/#rc.udf.getId()#" class="downloadUDF">Download UDF</a>
	<h3><span>author</span></h3>
	<p>
	<img src="#helpers.util.formatGravatar(rc.udf.getAuthorEmail())#" title="#rc.udf.getAuthor()#" class="img-left gravatar" />
	<span class="name"><a href="/author/#hash(rc.udf.getAuthorEmail())#">#rc.udf.getAuthor()#</a></span> <br/>
	<!---<a href="/emailauthor/#rc.udf.getId()#" class="email">Send Email</a> <br/>--->
	</p>	
</div>
<p class="description">
	<strong>Version:</strong> #rc.udf.getVersion()#  |  <strong>Requires:</strong> #helpers.util.formatVersion(rc.udf.getCFVersion())# 	 | <strong>Library:</strong> <a href="/library/#rc.udf.getLibrary().getName()#">#rc.udf.getLibrary().getName()#</a>
</p>

<script type="text/javascript">
ratingSaved = function(){
	$('##ratingMsg').html('Rating Posted!');
	$('##ratingStars').toggle();
}
$(document).ready(function() {
	$('##ratingStars').rating('/index.cfm?action=main.rate&udfid=#rc.udf.getId()#', {freeze:true,cancel:true,maxvalue:5,increment:.5,curvalue:#rate#,callback:ratingSaved});
});
</script>
<div id="ratingStars" class="rating">&nbsp;</div>
<div id="ratingMsg">Rated #rc.udf.getRateCount()# time(s). Average Rating: #rate#</div>
<div class="udfDetails">	
<p>
	<strong>Description:</strong> <br/>
	#rc.udf.getDescription()#
</p>
<p>
	<strong>Return Values:</strong> <br/>
	#rc.udf.getReturnValue()#						
</p>
<a name="examples"></a><p><strong>Example:</strong></p>
<div class="udfCode">
	#helpers.util.formatCode(rc.udf.getExample(),rc.formatter)#
</div>	
<p><strong>Parameters:</strong></p>
<cfif arrayLen(argData)>
<table id="paramsTable" cellpadding="0" cellspacing="0">
	<tr>
		<th>Name</th>
		<th>Description</th>
		<th>Required</th>
	</tr>
	<cfloop index="x" from="1" to="#arrayLen(argData)#">
		<tr <cfif x mod 2 is 0>class="even"</cfif>>
		<td>#argdata[x].name#</td>
		<td>#htmleditformat(argdata[x].desc)#</td>
		<td>#yesnoformat(argdata[x].req)#</td>
		</tr>
	</cfloop>
</table>
<cfelse>
<p>No arguments.</p>
</cfif>

<p><strong>Full UDF Source:</strong></p>
<div class="udfCode">	
	<code>	
	#helpers.util.renderUDFCode(rc.udf.getCode(), rc.udf.getJavaDoc(), rc.udf.getTagBased(),rc.formatter)#
	</code>
</div>

<div id="disqus_thread"></div>
<script type="text/javascript">
    var disqus_shortname = 'cflib';

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>

</div>
</cfoutput>