package core.services 
{
	import core.codec.FileDecoderFactory;
	import core.Delegate;
	import core.external.io.FileLoader;
	import core.fileSystem.Directory;
	import core.fileSystem.events.FileEvent;
	import core.fileSystem.FsFile;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	
	public class FileLoadingService extends EventDispatcher implements IFileService
	{
		public var fileDecoderFactory:FileDecoderFactory;
		
		public var fileLoadingManager:String = "FileLoader";
		
		public var loadingQuee:int = 3;
		
		private var loaders:Vector.<FileLoader>;
		private var loadTotal:int = 0;
		private var currentlyLoad:int = 0;
		
		public function FileLoadingService() 
		{
			
		}
		
		public function initialize():void
		{
			//directoryScaner.addEventListener(FileEvent.FILE_ADDED, onFileAdded);
			//directoryScaner.scan();
		}
		
		private function onFileAdded(e:FileEvent):void 
		{
			load(e.fileInfo);
		}
		
		public function loadFiles(dir:Directory):void
		{
			var toLoadList:Vector.<FsFile> = new Vector.<FsFile>
			
			_loadFiles(dir, toLoadList);
			
			loadTotal = toLoadList.length;
			currentlyLoad = 0;
			
			for (var i:int = 0; i < toLoadList.length; i++)
			{
				load(toLoadList[i]);
			}
		}
		
		private function _loadFiles(dir:Directory, list:Vector.<FsFile>):void
		{
			if (dir.length == 0)
				return;
				
			var item:* = dir.currentItem;
			for (var i:int = 0; i < dir.length; i++ )
			{
				if (item is Directory)
					_loadFiles(item, list)
				else
				{
					list.push(item as FsFile);//load(item as FsFile);
				}
					
				item = dir.nextItem;
			}
		}
		
		private function onLoadingComplete(e:Event, file:FsFile):void 
		{
			var loader:FileLoader = e.target as FileLoader;
			file.nativeContent = loader.data;
			
			fileDecoderFactory.addEventListener(Event.COMPLETE, onDecodeComplete);
			fileDecoderFactory.decode(file);
			
		}
		
		private function onDecodeComplete(e:Event):void 
		{
			currentlyLoad++;
			
			if (currentlyLoad == loadTotal)
			{
				
				dispatchEvent(new Event(Event.COMPLETE));
			}
			else
				dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, currentlyLoad, loadTotal-1));
		}
		
		private function load(file:FsFile):void
		{
			var loader:FileLoader = new (ApplicationDomain.currentDomain.getDefinition(fileLoadingManager));
			loader.addEventListener(Event.COMPLETE, Delegate.create(onLoadingComplete, file));
			loader.load(file.nativePath);
		}
		
	}

}