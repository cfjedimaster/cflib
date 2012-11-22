component {

	public array function getLibraries() {
		return entityLoad("library",{},"name asc",{cacheable:true,cachename:"libraries"});
	}

	public any function getLibrary(libraryid) {
		var library = entityLoadByPk("library", libraryid);
		if(!isNull(library)) return library;
		else throw("Library not valid");

	}
	public any function getLibraryByName(libraryname) {
		var library = entityLoad("library", {name:arguments.libraryname}, "", {cacheable:true,cachename:"librarybyname"});
		if(arrayLen(library)) return library[1];

	}

}