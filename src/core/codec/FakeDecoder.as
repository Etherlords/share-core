package core.codec 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	/**
	 * ...
	 * @author Nikro
	 */
	public class FakeDecoder extends EventDispatcher implements IDecoder 
	{
		private var _content:Object;
		
		public function FakeDecoder() 
		{
			
		}
		
		/* INTERFACE core.codec.IDecoder */
		
		public function get content():* 
		{
			return {};
		}
		
		public function decode(data:ByteArray):void 
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
	}

}