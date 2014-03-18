package core.services 
{
	import core.codec.FileDecoderFactory;
	import core.Delegate;
	import core.external.io.DesktopFileLoader;
	import core.external.io.FileLoader;
	import core.fileSystem.Directory;
	import core.fileSystem.DirectoryScaner;
	import core.fileSystem.events.FileEvent;
	import core.fileSystem.FsFile;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class FileLoadingService extends EventDispatcher implements IService
	{
		public var fileDecoderFactory:FileDecoderFactory;
		
		public var directoryScaner:DirectoryScaner;
		
		public var fileLoadingManager:Class = DesktopFileLoader;
		
		public var loadingQuee:int = 3;
		
		private var loaders:Vector.<FileLoader>;
		private var toLoadCount:int;
		
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
			
			toLoadCount = toLoadList.length;
			
			for (var i:int = 0; i < toLoadList.length; i++)
			{
				load(toLoadList[i]);
			}
		}
		
		private function _loadFiles(dir:Directory, list:Vector.<FsFile>):void
		{

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
			toLoadCount--;
			
			if (toLoadCount <= 0)
			{
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		
		private function load(file:FsFile):void
		{
			var loader:FileLoader = new fileLoadingManager();
			loader.addEventListener(Event.COMPLETE, Delegate.create(onLoadingComplete, file));
			loader.load(file.nativePath);
		}
		
	}

}