
<cfprocessingdirective pageencoding="utf-8">
<cfparam name="rc.filename" default="download">

<cfheader name="Content-Type" value="UTF-8">
<cfheader name="Content-Disposition" value="inline; filename=#rc.filename#.cfm">
<cfcontent type="application/octet-stream; charset=utf-8" reset="Yes"><cfoutput>#rc.result#</cfoutput>
