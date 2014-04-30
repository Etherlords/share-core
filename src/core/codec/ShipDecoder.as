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
	
	public class ShipDecoder extends EventDispatcher implements IDestructable, IDecoder
	{
		
		private var _content:*;
		
		public function ShipDecoder() 
		{
			
		}
		
		public function decode(data:ByteArray):void 
		{
			_content = data;
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function destroy():void 
		{
			
		}
		
		public function get content():* 
		{
			return _content;
		}
		
	}

}