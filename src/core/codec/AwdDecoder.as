package core.codec 
{
	import away3d.events.AssetEvent;
	import away3d.events.LoaderEvent;
	import away3d.events.ParserEvent;
	import away3d.loaders.Loader3D;
	import away3d.loaders.parsers.AWDParser;
	import core.IDestructable;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	
	/**
	 * Dispatched if file was modified
	 * @eventType	flash.events.Event.COMPLETE
	 */
	[Event(name="complete", type="flash.events.Event")] 
	
	public class AwdDecoder extends EventDispatcher implements IDestructable, IDecoder
	{
		private var parser:AWDParser;
		private var _content:*;
		private var loader:Loader3D;
		
		public function AwdDecoder() 
		{
			loader = new Loader3D();
			
			parser = new AWDParser();
			//parser.addEventListener(ParserEvent.PARSE_COMPLETE, onParseComplete);
			//parser.addEventListener(AssetEvent.MESH_COMPLETE, onMeshComplete);
			loader.addEventListener(LoaderEvent.RESOURCE_COMPLETE, onResrouceComplete);
		}
		
		private function onResrouceComplete(e:LoaderEvent):void 
		{
			_content = loader;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function onMeshComplete(e:AssetEvent):void 
		{
			_content = e.asset;
		}
		
		private function onParseComplete(e:ParserEvent):void 
		{
			
		}
		
		public function decode(data:ByteArray):void 
		{
			loader.loadData(data, null, null, parser);
			//parser.parseAsync(data);
		}
		
		public function destroy():void 
		{
			//parser.removeEventListener(ParserEvent.PARSE_COMPLETE, onParseComplete);
			//parser.removeEventListener(AssetEvent.MESH_COMPLETE, onMeshComplete);
			loader.removeEventListener(LoaderEvent.RESOURCE_COMPLETE, onResrouceComplete);
		}
		
		public function get content():* 
		{
			return _content;
		}
		
	}

}