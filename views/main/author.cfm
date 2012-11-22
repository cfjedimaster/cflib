<cfset rc.title = "UDFs by #rc.authorOb.name#">

<cfoutput>
<img src="#helpers.util.formatGravatar(email=rc.authorOb.email,size=200,usedefault=false)#" title="#rc.authorOb.name#" align="right" />
<h2>#rc.authorOb.name#</h2>

<p>
Here are all the UDFs (#arrayLen(rc.udfs)#) submitted by #rc.authorOb.name#:
</p>

<cfloop index="udf" array="#rc.udfs#">
	
<div class="function" id="function#udf.getId()#">
	<a href="/udf/#udf.getName()#" class="funcName">#udf.getName()#</a> <br/>
	<p>
		#udf.getShortDescription()# | <strong>Requires:</strong> #helpers.util.formatVersion(udf.getCFVersion())#
	</p> 

	<ul class="options">
		<li><a href="/udfdownload/#udf.getId()#">Download UDF</a> | </li>
		<li><a href="/udf/#udf.getName()###examples">Examples</a> |</li>
		<li><a href="/udf/#udf.getName()#">Details</a></li>	
	</ul>
	<div class="udfCode">
		<a href="" class="viewUDF">View UDF</a>
		<div class="code">
			<code>
			<img src="/images/ajax-loader.gif" />Loading...
			</code>
		</div>
	</div>
		
</div>
</cfloop> 
</cfoutput>