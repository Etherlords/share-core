package core.services 
{
	import core.fileSystem.Directory;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public interface IService extends IEventDispatcher
	{
		function loadFiles(directoriesList:Directory):void;
	}
	
}