package core.codec 
{
	import core.Delegate;
	import core.fileSystem.FsFile;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class FileDecoderFactory extends EventDispatcher
	{
		private var decodersMap:Object = { };
		private var currentDecoder:IDecoder;
		private var currentFile:FsFile;
		
		public function FileDecoderFactory() 
		{
			initialize();
		}
		
		private function initialize():void 
		{
			var imageDecoder:Class = BitmapDecoder;
			decodersMap['png'] = imageDecoder;
			decodersMap['jpg'] = imageDecoder;
			decodersMap['txt'] = FakeDecoder;
			decodersMap['cxm'] = FakeDecoder;
			decodersMap['mtl'] = FakeDecoder;
			decodersMap['awd'] = AwdDecoder;
			
			decodersMap['ship'] = ShipDecoder;
			
			decodersMap['obj'] = ObjDecoder;
		}
		
		private function onDecodeComplete(e:Event, file:FsFile):void 
		{
			//currentFile.content = currentDecoder.
			currentFile = file;
			currentDecoder = e.target as IDecoder;
			(currentDecoder as EventDispatcher).removeEventListener(Event.COMPLETE, onDecodeComplete);
			
			currentFile.content = currentDecoder.content;
			
			dispatchEvent(e);
		}
		
		public function decode(file:FsFile):void
		{
			currentFile = file;
			currentDecoder = new decodersMap[file.extension];
			(currentDecoder as EventDispatcher).addEventListener(Event.COMPLETE, Delegate.create(onDecodeComplete, file));
			currentDecoder.decode(file.nativeContent);
		}
		
	}

}