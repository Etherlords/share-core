package ui.events 
{
	import flash.events.Event;
	
	public class ScrollEvent extends Event 
	{
		public var delta:Number;
		public var position:Number;
		
		public static const SCROLL:String = 'scroll';
		
		public function ScrollEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, delta:Number = 0, position:Number = 0) 
		{
			super(type, bubbles, cancelable);
			this.position = position;
			this.delta = delta;
			
		}
		
		override public function clone():Event 
		{
			return new ScrollEvent(type, bubbles, cancelable, delta, position);
		}
		
	}

}