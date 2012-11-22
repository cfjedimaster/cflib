component {
	
	public any function init( fw ) {
		variables.fw = fw;
		variables.libraryService = new services.library();
		variables.udfService = new services.udf();
		
		return this;
	}

	//TODO: Possibly disable on non-view downloads, like librarydownload
	public void function before(rc) {
		variables.fw.service("udf.getLatestUDFs","latestudfs");
		variables.fw.service("udf.getTopUDFs","topudfs");
	}	

	public void function author(rc) {
		variables.fw.service("udf.getAuthor", "authorOB");
		variables.fw.service("udf.getUDFsByAuthor", "udfs");
	}
	
	public void function default( rc ) {
		variables.fw.service("library.getLibraries","libraries");
	}

	public void function download( rc ) {
		var udfs = [];

		request.layout=false;

		//first, we either get a udf or a library
		if(structKeyExists(rc, "libraryid")) {
			var library = variables.libraryService.getLibrary(rc.libraryid);
			udfs = library.getUDFs();
			rc.filename = library.getName();
		} else if(structKeyExists(rc, "udfid")) {
			throw("Must implement");
		} else {
			variables.fw.redirect(action="main.default");
		}

		var nl = chr(10);
		rc.result = "<" & "!---" & nl & trim(application.headerfile) & nl & "---" & ">" & nl & nl;

		arrayEach(udfs, function(udf) {
			if(!udf.getTagBased()) {
				rc.result &= "<cfscript>#nl#";	
			}

			rc.result &= trim(udf.getJavaDoc()) & nl & trim(udf.getCode()) & nl;
			
			if(!udf.getTagBased()) {
				rc.result &= "</cfscript>#nl#";	
			}

			rc.result &= nl;
		});		
		
	}
	

	public void function library( rc ) {
		if(!structKeyExists(rc, "libraryname")) variables.fw.redirect(action="main.default");
		variables.fw.service("library.getLibraryByName","library");
		variables.fw.service("udf.getUDFs","udfs");
	}

	public void function endlibrary(rc) {
		if(isNull(rc.library)) variables.fw.redirect("main.default");
	}	

	public void function rate(rc) {
		
	}
	
	public void function udf( rc ) {
		if(!structKeyExists(rc, "udfname")) variables.fw.redirect(action="main.default");
		rc.udf = variables.udfService.getUDFByName(rc.udfname);
		
		//Two checks here. If null, we leave
		if(isNull(rc.udf)) variables.fw.redirect(action="main.default");

		//Next, see if released. TODO - toggle for admin to get?
		if(!rc.udf.getReleased()) variables.fw.redirect(action="main.default");

		rc.formatter = application.formatter;
		
	}

}