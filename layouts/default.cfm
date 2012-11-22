<cfparam name="rc.latestudfs" default="">
<cfparam name="rc.topudfs" default="">
<cfparam name="rc.title" default="Welcome to CFLib.org">
<cfparam name="rc.search" default="">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	
	<head>
			<cfoutput><title>CFLib.org &ndash; #rc.title#</title></cfoutput>
			<meta name="description" content="CFLib is a open source collection of user defined functions written in ColdFusion." />
			<meta name="keywords" content="coldfusion,udf,user defined function,raymond camden,cold fusion" />
			<link rel="stylesheet" href="/css/reset.css" type="text/css" media="all" charset="utf-8">
			<link rel="stylesheet" href="/css/screen.css" type="text/css" media="all" charset="utf-8">
			<!--[if IE 6]><link rel="stylesheet" href="/css/ie6.css" type="text/css" /><![endif]-->
			<link rel="stylesheet" href="/css/rating.css" type="text/css" media="all">
			<script type="text/javascript" src="/js/jquery.js"></script>
			<script type="text/javascript" src="/js/application.js"></script>			
			<script type="text/javascript" src="/js/jquery.rating.js"></script>
			<script type="text/javascript" src="/js/sifr.js"></script>
			<link rel="alternate" type="application/rss+xml" title="RSS" href="/rss.cfm" />
			<link rel="shortcut icon" href="/images/favicon_cflib.ico">
	</head>

	<body>

			<div id="hd">
				<h1 id="logo" class="bgreplace"><a href="/">CFLib.org &ndash; Common Function Library Project</a></h1>
			</div>
		
		<div id="contentWrapper">	
			<div id="content" class="clear">
				<div class="submitAndRss">
					<ul>
						<li id="tsubmitudf"><a href="/submit">Submit UDF</a></li>
						<li id="trss"><a href="/rss">RSS</a></li>
					</ul>
				</div>
				<div class="leftColumn">
					<!---
					<div class="googlead">
						<script type="text/javascript"><!--
						google_ad_client = "pub-1736437642005360";
						google_ad_width = 468;
						google_ad_height = 15;
						google_ad_format = "468x15_0ads_al";
						google_ad_channel ="4981417033";
						google_color_border = "FFFFFF";
						google_color_bg = "FFFFFF";
						google_color_link = "0000FF";
						google_color_url = "000000";
						google_color_text = "000000";
						//--></script>

						<script type="text/javascript"
						  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
						</script>	
					</div>
					--->
					<cfoutput>#body#</cfoutput>
				</div>
				
				<div class="rightColumn">
					<div class="searchForm">
						<h3><span>Search CFLib.org</span></h3>
						<!---
						<!-- SiteSearch Google -->
						<a href="http://www.google.com/">
						<img src="http://www.google.com/logos/Logo_25wht.gif" border="0" alt="Google" align="middle"></img></a>
						
						<form method="get" action="/searchbare.cfm" target="_top">
							<input type="hidden" name="domains" value="www.cflib.org"/>
							<input type="hidden" name="client" value="pub-1736437642005360"/>
							<input type="hidden" name="forid" value="1"/>
							<input type="hidden" name="ie" value="ISO-8859-1"/>
							<input type="hidden" name="oe" value="ISO-8859-1"/>
							<input type="hidden" name="flav" value="0000"/>
							<input type="hidden" name="sig" value="FeDw-ZsRovYIK_rk"/>
							<input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:336699;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;FORID:11"></input>
							<input type="hidden" name="hl" value="en"/>
						
							<input type="text" name="q" size="15" maxlength="255" value=""/>
							<input type="submit" name="sa" value="Search"/> <br/>
							<input type="radio" name="sitesearch" value=""/>Web
							<input type="radio" name="sitesearch" value="www.cflib.org" checked="checked" />www.cflib.org			
						
						</form>
						<!-- SiteSearch Google -->
							<a href="/search.cfm?searchterms=%25&adv=1" class="advanced">Advanced Search</a>
						--->
						<form method="post" action="/search">
							<cfoutput><input type="text" name="search" id="search" size="15" maxlength="255" value="#rc.search#"/></cfoutput> <input type="submit" value="Search" onclick="return ($('#search').val() != '')"> <br/>
						</form>
					</div>
					<div class="latestAdditions">
						<h3><span>Latest Additions</span></h3>
							<cfloop index="udf" array="#rc.latestudfs#">
								<cfoutput>
								<div class="person clear">
									<p>
									<img src="#helpers.util.formatGravatar(udf.getAuthorEmail())#" title="#udf.getAuthor()#" class="img-left gravatar" />
									<span class="name">#udf.getAuthor()# added</span> <br/>
									<a href="/udf/#udf.getName()#"><cfif len(udf.getName()) gt 16>#left(udf.getName(),16)#...<cfelse>#udf.getName()#</cfif></a> <br/>
									<span class="time">#helpers.util.formatAgo(udf.getLastUpdated())#</span>
									</p>
								</div>			
								</cfoutput>
							</cfloop>
							<!---<a href="" class="viewMore">View More</a>	--->												
					</div>

<div style="margin: 5px;padding-top:5px;padding-bottom:5px;">
<script type="text/javascript"><!--
google_ad_client = "pub-1736437642005360";
/* CFLib Smaller Square Right */
google_ad_slot = "7746331953";
google_ad_width = 200;
google_ad_height = 200;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>

					<div class="topRated">
						<h3><span>Top Rated</span></h3>
							<cfloop index="udf" array="#rc.topudfs#">
								<cfoutput>
								<div class="person clear">
									<p>
									<img src="#helpers.util.formatGravatar(udf.getAuthorEmail())#" alt="#udf.getAuthor()#" class="img-left gravatar" />
									<a href="/udf/#udf.getName()#"><cfif len(udf.getName()) gt 16>#left(udf.getName(),16)#...<cfelse>#udf.getName()#</cfif></a> <br/>
									<span class="name">Rated #helpers.util.decimalRound(udf.getRating(), 1, "up")#, #udf.getRateCount()# time(s)</span> <br/>
									<span class="time">#helpers.util.formatAgo(udf.getLastUpdated())#</span>
									</p>
								</div>							
								</cfoutput>
							</cfloop>
							<!---<a href="" class="viewMore">View More</a>	--->												
					</div>

					<div style="margin: 5px;padding-top:5px">
					<cfinclude template="tla.cfm">
					</div>
					
				</div>
			</div>	
		</div>
		
		
		<div id="ft">
			<div class="ft_content clear">
			<p class="created">Created by <a href="http://www.coldfusionjedi.com">Raymond Camden</a> / Design by <a href="mailto:justinjohnson@system7designs.com">Justin Johnson</a></p>
			<p class="copyright">
				<cfoutput>Copyright #year(now())#</cfoutput>, All Rights Reserved <br/>
				<a href="/submit">Submit A UDF</a> | <a href="/rss">RSS</a>
			</p>
			</div>
		</div>
		<script type="text/javascript">
		if(typeof sIFR == "function"){
		    sIFR.replaceElement(".leftColumn h2", named({sFlashSrc: "/swfs/futura.swf", sColor: "#4e9ad0"}));
		 	sIFR.replaceElement(".submissionAndUpdates h4", named({sFlashSrc: "/swfs/futura.swf", sColor: "#4e9ad0"}));
		};
		</script>		
	<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-70863-4");
pageTracker._initData();
pageTracker._trackPageview();
</script></body>

</html>
	