component persistent="true" table="tblUDFs" cacheName="udf" cacheUse="nonstrict-read-write" {
	property name="id" generator="native" ormtype="integer" fieldtype="id";

	property name="name" ormtype="string";
	property name="shortdescription" ormtype="string";
	property name="description" ormtype="string";
	property name="lastupdated" ormtype="date";
	property name="released" ormtype="boolean";
	property name="returnvalue" ormtype="string";
	property name="example" ormtype="string";
	property name="warnings" ormtype="string";
	property name="code" ormtype="string";
	property name="args" ormtype="string";
	property name="author" ormtype="string";
	property name="authoremail" ormtype="string";
	property name="javadoc" ormtype="string";
	property name="version" ormtype="integer";
	property name="headercomments" ormtype="string";
	property name="exampleother" ormtype="string";
	property name="rejected" ormtype="boolean";
	property name="rejectionreason" ormtype="string";
	property name="cfversion" ormtype="string";
	property name="tagbased" ormtype="boolean";
	property name="ratecount" ormtype="integer";
	property name="ratetotal" ormtype="integer";

    property name="library" fieldtype="many-to-one" cfc="library" fkcolumn="libraryidfk" lazy="true" missingRowIgnored="true";

    public numeric function getRating() {
    	if(variables.ratecount == 0) return 0;
    	return variables.ratetotal/variables.ratecount;
    }
}