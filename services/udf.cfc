component {

	public any function getAuthor(string author) {
		var q = new com.adobe.coldfusion.query();    
	    q.setSQL("select author, authoremail from tbludfs where convert(md5(authoremail),char) = :hash");    
	    q.addParam(name="hash",value="#arguments.author#",cfsqltype="cf_sql_varchar");    
	    var results = q.execute().getResult();

		if(results.recordCount == 0) return {};
		return {name:results.author,email:results.authoremail};	
	}
	
	public array function getLatestUDFs() {
		return entityLoad("udf",{released:1},"lastupdated desc", {maxResults:4, cacheable:true, cachename:"latestudfs"});
	}

	public array function getTopUDFs() {
		return ormExecuteQuery("from udf order by ratetotal/ratecount desc, ratecount desc",[],false,{maxResults:4, cacheable:true, cachename:"topudfs"});
	}

	public array function getUDFsByAuthor() {
		return entityLoad("udf",{released:1,authoremail:arguments.authorob.email},"name asc", {maxResults:999, cacheable:true, cachename:"latestudfs"});
	}

	public any function getUDFByName(required string udfname) {
		var udf = entityLoad("udf", {name:arguments.udfname}, "", {cacheable:true,cachename:"udfbyname"});
		if(arrayLen(udf)) return udf[1];
	}
	
	public array function getUDFs(start=1,maxResults=20) {
		var options = {};
		options.offset=arguments.start;
		options.maxResults=arguments.maxResults;
		var filter = {};
		filter.released=1;
		if(structKeyExists(arguments,"library")) filter.library = arguments.library;

		return entityLoad("udf", filter, "name asc", options );
	}
}