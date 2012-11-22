<!--- divide the libs into 3 --->
<cfset perCol = arrayLen(rc.libraries) \ 3>

<h2>Libraries</h2>

<cfloop index="mainx" from="1" to="3">
	<cfif mainx is 1>
		<cfset start = 1>
		<cfset end = perCol>
	<cfelseif mainx is 2>
		<cfset start = perCol + 1>
		<cfset end = perCol * 2>
	<cfelse>
		<cfset start = perCol*2+1>
		<cfset end = arrayLen(rc.libraries)>
	</cfif>
	
	<div class="lib">
		<cfloop index="x" from="#start#" to="#end#">
			<cfoutput>
			<p>
			<a href="/library/#rc.libraries[x].getName()#">#rc.libraries[x].getName()#</a> <br/>
			<span class="date">Last Updated #dateFormat(rc.libraries[x].getLastUpdated(),"mmmm d, yyyy")#</span> <br/>
			Number of UDFs: #rc.libraries[x].getNumberOfUDFs()# <br/>
			#rc.libraries[x].getShortDescription()#
			</p>
			</cfoutput>	
		</cfloop>					
	</div>

</cfloop>

					
<div class="homeContent">
<h2>Welcome To CFLib.org</h2>
<p>Welcome to the Common Function Library Project. The purpose of the Common Function Library Project (CFLib.org) is to create a set of user-defined function (UDF) libraries
for ColdFusion 5.0 and higher. These libraries are open source and may be used and modified to your liking. Functions range from email format checking to encryption routines. 
These UDFs can greatly speed up development time as well as add new and powerful features to your web site.
</p>

<p>
Anyone can add their code to the project by simply using our <a href="/submit">submission form</a>. You must be running ColdFusion 5.0 (or higher) to run these libraries. For more information 
about ColdFusion, please visit <a href="http://www.adobe.com/go/coldfusion">Adobe's ColdFusion</a> product page. If you have any suggestions or comments, 
please <a href="/contact">contact</a> me.
</p>	

<p>
CFLib.org was created by Raymond Camden (<a href="http://www.coldfusionjedi.com">Blog</a>). 
Raymond is an Adobe Community Expert and complete and utter Star Wars nerd. 
</p>			
</div>
					
<div class="submissionAndUpdates clear">
	<div class="submissions">
		<h4>Submissions</h4>
		<p>
		You can <a href="/submit">submit</a> your own UDF now. Before doing so, please search the site and ensure we haven't released a similar UDF already. Also note
		that your UDF may be modified to meet CFLib standards.
		</p>
		<p>
		UDFs will be processed and checked manually. This will take a bit of time on my part. Please <a href="/contact">contact</a> me if you have any specific questions about
		your status in the queue.
		</p>
	</div>
	<div class="recentUpdates">
		<h4>Recent Updates</h4>
		<p>
		Welcome to CFLib 2009. After four years of talking about it, I finally got around to rebuilding it. Thanks go to Justin Johnson for the new design.
		</p>
		<p>
		Add support for browing CFLib via ColdFusion Builder - install <a href="http://cflibextension.riaforge.org/">CFLibExtension</a>.
		</p>
	</div>						
</div>

<p>
<script type="text/javascript"><!--
google_ad_client = "pub-1736437642005360";
/* CFLib 2008 Bottom */
google_ad_slot = "4324261250";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</p>