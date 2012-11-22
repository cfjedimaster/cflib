component persistent="true" table="tblLibraries" cacheName="library" cacheUse="read-only" {
	property name="id" generator="native" ormtype="integer" fieldtype="id";
	property name="name" ormtype="string";
	property name="shortdescription" ormtype="string";
	property name="description" ormtype="string";
	property name="lastupdated" ormtype="date";
	property name="owner" ormtype="string";
	property name="owneremail" ormtype="string";
	property name="released" ormtype="boolean";

	property name="udfs" fieldType="one-to-many" cfc="udf" fkcolumn="libraryidfk" singularname="udf" orderby="tagbased asc,name asc" cascade="delete" lazy="extra" 
	cacheName="libraryudfs" cacheUse="read-only";

	public numeric function getNumberOfUDFS() {
		return ormExecuteQuery("select count(id) as total from udf where library.id=? and released=1 ",[variables.id],false,{cacheable:true, cachename:"numberofudfs"})[1];
	}
}