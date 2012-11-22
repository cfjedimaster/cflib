<cfcomponent>

<cffunction name="formatAgo" output="false" hint="Based on how old something is, it will return 10 mins ago, 2 days ago, etc.">
	<cfargument name="date" type="date" required="true">

	<cfif dateDiff("n", arguments.date, now()) lt 60>
		<cfreturn dateDiff("n", arguments.date, now()) & " minute(s) ago">
	<cfelseif dateDiff("h", arguments.date, now()) lt 24>
		<cfreturn dateDiff("h", arguments.date, now()) & " hour(s) ago">
	<cfelseif dateDiff("d", arguments.date, now()) lt 31>
		<cfreturn dateDiff("d", arguments.date, now()) & " day(s) ago">
	<!---
	<cfelse>
		<cfreturn dateDiff("m", arguments.date, now()) & " month(s) ago">
	--->
	<cfelse>
		<cfreturn " a while ago">
	</cfif>
</cffunction>

<cffunction name="formatVersion" output="false" hint="Change 'CF5' to 'ColdFusion 5', and so on...">
	<cfargument name="version" type="string" required="true">
	<cfset arguments.version = trim(arguments.version)>
	<cfswitch expression="#arguments.version#">
		<cfcase value="CF5">
			<cfreturn "ColdFusion 5">
		</cfcase>
		<cfcase value="CF6">
			<cfreturn "ColdFusion MX">
		</cfcase>
		<cfcase value="CF7">
			<cfreturn "ColdFusion MX7">
		</cfcase>
		<cfcase value="CF8">
			<cfreturn "ColdFusion 8">
		</cfcase>
		<cfcase value="CF9">
			<cfreturn "ColdFusion 9">
		</cfcase>
		<cfdefaultcase>
			<cfreturn "Unknown">
		</cfdefaultcase>
	</cfswitch>
</cffunction>

<cffunction name="formatCode" output="false" hint="Formats code.">
	<cfargument name="code" type="string" required="true">
	<cfargument name="formatter" type="any" required="true">
	<cfset var result = "">

	<!--- look for & entities --->
	<!---
	<cfset arguments.code = rereplacenocase(arguments.code, "&([##a-z]{2,})", "&amp;\1", "all")>
	--->
	
	<cftry>
		<cfset result = arguments.formatter.formatString(arguments.code)>
		<cfreturn result>
		<cfcatch>
			<cfreturn htmlCodeFormat(arguments.code)>
		</cfcatch>
	</cftry>
</cffunction>

<cffunction name="formatGravatar" output="false" hint="Used to format gravatar IMG src">
	<cfargument name="email" type="string" required="true">
	<cfargument name="size" type="string" required="false" default="43">
	<cfargument name="usedefault" type="string" required="false" default="true">

	<cfset var s = "http://www.gravatar.com/avatar/">
	<cfset s &= lcase(hash(trim(arguments.email)))>
	<cfset s &= "?s=#arguments.size#">
	<cfif arguments.usedefault>
		<cfset s &= "&d=" & urlEncodedFormat("http://#cgi.server_name#/images/gravatarsample.jpg")>
	</cfif>
	<cfreturn s>
</cffunction>

<cffunction name="makeRandomString" returnType="string" output="false">
	<cfset var chars = "23456789ABCDEFGHJKMNPQRS?">
	<cfset var length = randRange(4,7)>
	<cfset var result = "">
	<cfset var i = "">
	<cfset var char = "">

	<cfscript>
	for(i=1; i <= length; i++) {
		char = mid(chars, randRange(1, len(chars)),1);
		result&=char;
	}
	</cfscript>

	<cfreturn result>
</cffunction>

<cffunction name="renderUDFCode" returnType="string" output="false">
	<cfargument name="code" type="string" required="true">
	<cfargument name="javadoc" type="string" required="true">
	<cfargument name="tagbased" type="boolean" required="true">
	<cfargument name="formatter" type="any" required="true">

	<cfset var nl = chr(10)>
	<cfset var javaDocClean = scramail(arguments.javadoc)>

	<cfif not arguments.tagBased>
		<cfset code = "<cfscript>#nl##javadocclean##code##nl#</cfscript>">
	<cfelse>
		<cfset code = "#javadocclean##code#">
	</cfif>

	<!--- look for & entities --->
	<!---
	<cfset code = rereplacenocase(code, "&([a-z]{2,})", "&amp;\1", "all")>
	--->
	<cfset code = formatCode(code,formatter)>
	<cfreturn code>
</cffunction>

<cfscript>
//Added by Ray since coldfish had a problem with our encoded stuff
function nukemail(str) {
	var emailregex = "(['_a-z0-9-]+(\.['_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|coop|info|museum|name)))";
	var i = 1;
	var email = "";
	var ascMail = "";
	var marker = 1;
	var matches = "";

	matches = reFindNoCase(emailregex,str,marker,marker);

	while(matches.len[1] gt 0) {
		email = mid(str,matches.pos[1],matches.len[1]);
		for (i=1; i LTE len(email); i=i+1) {
			ascMail = ascMail & "&##" & asc(mid(email,i,1)) & ";";
		}
		str = replace(str,email,ascMail,"all");
		marker = matches.pos[1] + matches.len[1];
		matches = reFindNoCase(emailregex,str,marker,marker);
	}
	return str;
}

function scramail(str) {
	var emailregex = "(['_a-z0-9-]+(\.['_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|coop|info|museum|name)))";
	var i = 1;
	var email = "";
	var ascMail = "";
	var marker = 1;
	var matches = "";

	matches = reFindNoCase(emailregex,str,marker,marker);

	while(matches.len[1] gt 0) {
		email = mid(str,matches.pos[1],matches.len[1]);
		for (i=1; i LTE len(email); i=i+1) {
			ascMail = ascMail & "&##" & asc(mid(email,i,1)) & ";";
		}
		str = replace(str,email,ascMail,"all");
		marker = matches.pos[1] + matches.len[1];
		matches = reFindNoCase(emailregex,str,marker,marker);
	}
	return str;
}

/**
* Rounds a number to a specific number of decimal places by using Java's math library.
*
* @param numberToRound      The number to round. (Required)
* @param numberOfPlaces      The number of decimal places. (Required)
* @param mode      The rounding mode. Defaults to even. (Optional)
* @return Returns a number.
* @author Peter J. Farrell (pjf@maestropublishing.com)
* @version 1, March 3, 2006
*/
function decimalRound(numberToRound, numberOfPlaces) {
    // Thanks to the blog of Christian Cantrell for this one
    var bd = CreateObject("java", "java.math.BigDecimal");
    var mode = "even";
    var result = "";

    if (ArrayLen(arguments) GTE 3) {
        mode = arguments[3];
    }

    bd.init(javacast("string",arguments.numberToRound));
    if (mode IS "up") {
        bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_UP);
    } else if (mode IS "down") {
        bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_DOWN);
    } else {
        bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_EVEN);
    }
    result = bd.toString();

    if(result EQ 0) result = 0;

    return result;
}
</cfscript>

</cfcomponent>