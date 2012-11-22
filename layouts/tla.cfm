<CFSET local_file_name = 'local_49674.xml'>
<CFSET inventory_key = '0NMK28F8THS81R7FK946'>
<CFSET local_directory = Getdirectoryfrompath(GetBasetemplatepath())>
<CFSET local_xml_filename = local_directory & local_file_name>
<cftry>
<CFIF not fileExists(local_xml_filename)>
    <CFTHROW message="Text Link Ads Error: Unable to find local xml file, #local_xml_filename#">
</CFIF>

<CFFILE action="read" file="#local_xml_filename#" variable="localdoc">

<CFDIRECTORY action="list" directory="#local_directory#" filter="#local_file_name#" name="LocalFileDetails">

<CFIF (LEN(localdoc) LTE 20) OR (DateCompare(LocalFileDetails.dateLastModified, DateAdd("h", -1, Now())) EQ -1) or structkeyexists(url,"tla")>
	<CFHTTP url="http://www.text-link-ads.com/xml.php?inventory_key=#INVENTORY_KEY#&user_agent=#CGI.HTTP_USER_AGENT#" method="GET" timeout="10"></CFHTTP>
	<CFSET remotedoc = cfhttp.FileContent>
	<CFIF LEN(remotedoc) LTE 20>
		<CFSET remotedoc = localdoc>
	</CFIF>
	<CFFILE action = "write" file = "#local_xml_filename#" output = "#remotedoc#">
	<CFSET localdoc = remotedoc>
</CFIF>

<CFTRY>
   <CFSET myDoc = XmlParse(localdoc)>
   <CFCATCH type="Any">
		<CFTHROW message="Text Link Ads Error: Error parsing local xml file, #local_xml_filename#">
   </CFCATCH>
</CFTRY>

<CFSET numItems = ArrayLen(mydoc.links.XmlChildren)>

<CFIF numItems GTE 1>
	<CFSET xmlquery = QueryNew("url, text, beforetext, aftertext") >
	<CFSET temp = QueryAddRow(xmlquery, numItems)>

	<CFLOOP index= "i" from = "1" to = #numItems#>
		<CFSET temp = QuerySetCell(xmlquery, "url", mydoc.links.link[i].url.XmlText, i)>
		<CFSET temp = QuerySetCell(xmlquery, "text", mydoc.links.link[i].text.XmlText, i)>
		<CFSET temp = QuerySetCell(xmlquery, "beforetext", mydoc.links.link[i].beforetext.XmlText, i)>
		<CFSET temp = QuerySetCell(xmlquery, "aftertext", mydoc.links.link[i].aftertext.XmlText, i)>
	</CFLOOP>

	<CFOUTPUT>
	<ul style="width: 80%; padding-left:5px; overflow: hidden; margin: 0; border: 1px solid ##000000; border-spacing: 0px; background-color: ##F0F0F0; list-style: none;">
	</CFOUTPUT>

	<CFOUTPUT query="xmlquery">
	<li style="padding: 0; display: inline; clear: none; margin: 0; width: 100%; float: left;"><span style="font-size: 12px; margin: 0; display: block; width: 100%; padding: 3px; color: ##000000;">#beforetext# <a style="font-size: 12px; color: ##000000;" href="#url#">#text#</a> #aftertext#</span></li>
	</CFOUTPUT>

	<CFOUTPUT>
	</ul>
	</CFOUTPUT>

</CFIF>
<cfcatch></cfcatch>
</cftry>
<!--- END OF COLD FUSION CODE --->