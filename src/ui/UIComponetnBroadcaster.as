package ui 
{
	import core.broadcasting.AbstractEventBroadcaster;
	import core.broadcasting.IEventBroadcaster;
	import flash.events.Event;
	import ui.style.Style;

	public class UIComponetnBroadcaster extends UIComponent implements IEventBroadcaster 
	{
		
		private var broadcaster:AbstractEventBroadcaster = new AbstractEventBroadcaster();
		
		public function UIComponetnBroadcaster(style:Style=null) 
		{
			super(style);
		}
		
		public function broadcastFor(scope:String, event:Event):void 
		{
			broadcaster.broadcastFor(scope, event);
		}
		
		public function broadcast(event:Event):void 
		{
			broadcaster.broadcast(event);
		}
		
		public function addScope(scope:String):void 
		{
			broadcaster.addScope(scope);
		}
		
		public function set scopes(value:Vector.<String>):void 
		{
			broadcaster.scopes = value;
		}
		
		public function get scopes():Vector.<String> 
		{
			return broadcaster.scopes;
		}
		
	}

}