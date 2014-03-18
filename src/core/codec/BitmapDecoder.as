package core.codec 
{
	import core.IDestructable;
	import core.textures.IBitmapOutput;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	/**
	 * Dispatched if file was modified
	 * @eventType	flash.events.Event.COMPLETE
	 */
	[Event(name="complete", type="flash.events.Event")] 
	
	public class BitmapDecoder extends EventDispatcher implements IDestructable, IBitmapOutput, IDecoder
	{
		private var _output:BitmapData;
		public var context:LoaderContext;
		
		private var loader:Loader;
		
		private var isInProgress:Boolean = false;
		
		public function BitmapDecoder() 
		{
			initialize();
		}
		
		private function initialize():void 
		{
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(e:Event):void 
		{
			_output = (loader.content as Bitmap).bitmapData;
			isInProgress = false;
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function decode(data:ByteArray):void
		{
			loader.loadBytes(data, context);
			isInProgress = true;
		}
		
		public function clean():void
		{
			if(isInProgress)
				loader.close();
				
			_output = null;
			isInProgress = false;
		}
		
		public function destroy():void 
		{
			clean();
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
		}
		
		public function get content():* 
		{
			return _output;
		}
		
		public function get output():BitmapData 
		{
			return _output;
		}
		
	}

}