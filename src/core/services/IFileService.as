package core.services 
{
	import core.fileSystem.Directory;
	
	public interface IFileService extends IService
	{
		function loadFiles(directoriesList:Directory):void;
	}
	
}