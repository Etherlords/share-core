package core.external.io 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.ByteArray;
	
	/**
	 * Dispatched if file was modified
	 * @eventType	flash.events.Event.COMPLETE
	 */
	[Event(name = "complete", type = "flash.events.Event")] 
	
	public class FileLoader extends EventDispatcher 
	{
		public var data:ByteArray;
		
		public function FileLoader(target:flash.events.IEventDispatcher=null) 
		{
			super(target);
			
		}
		
		public function load(path:String):void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	}

}