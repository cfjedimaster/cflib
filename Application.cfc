component extends="org.corfield.framework" {

	this.name="cflib2012E";
	this.applicationTimeout = createTimeSpan(0,0,2,0);

	this.datasource = "cflib2008";
	this.ormenabled = true;
	
	this.ormsettings = {
		cfclocation:expandPath("./model"),
		skipcfcwitherror:false,
		logSQL:true,
		secondarycacheenabled:true,
		cacheconfig:"cflibcache.xml"
	};
	
	variables.framework = {
		reloadApplicationOnEveryRequest=true
	};

	//RAY REMOVE
	if(structKeyExists(url,"init")) {
		ormReload();
		applicationStop();
		location(url="index.cfm?x=1",addtoken=false);
		//admin = createObject("component", "CFIDE.adminapi.administrator");
		//admin.login("admin");
		//rt = createObject("component","CFIDE.adminapi.runtime");
		//rt.stopApplication(this.name);

	}
	
	function setupApplication() {
		application.headerFile = fileRead(getDirectoryFromPath(getCurrentTemplatePath()) & "header.txt");	
		application.formatter = new model.com.jasondelmore.coldfish.coldfish(); 
	}
	
	function setupRequest() {
		// use setupRequest to do initialization per request
		helpers = {};
		helpers.util = createObject("component","util");
	}

}