
<cfset lib = rc.library>
<cfparam name="rc.start" default="1">
<cfset perpage = 20>
<cfset rc.title = lib.getName()>
	
<cfif not isNumeric(rc.start) or rc.start lte 0 or round(rc.start) neq rc.start or rc.start gt lib.getNumberOfUDFs()>
	<cfset rc.start = 1>
</cfif>

<cfoutput>
<h2>#lib.getName()#</h2>
<h5 class="lastUpdated">Last updated #dateFormat(lib.getLastUpdated(), "mmmm d, yyyy")# / #lib.getNumberOfUDFs()# Released UDF(s)</h5>
<a href="/librarydownload/#lib.getId()#" class="downloadLibrary" rel="noindex,nofollow">Download Library</a>

<cfif lib.getNumberOfUDFs() neq arrayLen(rc.udfs)>
	<p>
	<cfif rc.start neq 1><a href="/library/#lib.getName()#/start/#rc.start-perpage#">Previous #perpage#</a><cfelse>Previous #perpage#</cfif>
	/
	<cfif rc.start+perpage-1 lt lib.getNumberOfUDFs()><a href="/library/#lib.getName()#/start/#rc.start+perpage#">Next #perpage#</a><cfelse>Next #perpage#</cfif>
	</p>
</cfif>

<cfloop index="udf" array="#rc.udfs#">
	<!---
	<cfif rateCount neq "" and rateCount gte 1>
		<cfset rate = rateTotal \ rateCount>
	<cfelse>
		<cfset rate = 0>
	</cfif>
	--->
	
<!-- loop over the 'function' div for all the function in a library, these need to have a unique ID, it doesn't matter what it is as long as it's unique -->
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

<cfif lib.getNumberOfUDFs() neq arrayLen(rc.udfs)>
	<p>
	<cfif rc.start neq 1><a href="/library/#lib.getName()#/start/#rc.start-perpage#">Previous #perpage#</a><cfelse>Previous #perpage#</cfif>
	/
	<cfif rc.start+perpage-1 lt lib.getNumberOfUDFs()><a href="/library/#lib.getName()#/start/#rc.start+perpage#">Next #perpage#</a><cfelse>Next #perpage#</cfif>
	</p>
</cfif>

</cfoutput>