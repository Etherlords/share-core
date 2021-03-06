package ui 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import ui.style.Style;
	
	public class Progress extends UIComponent
	{
		private var convasContainer:Bitmap;
		private var convas:BitmapData;
		
		public var bgPattern:BitmapData;
		public var progressPattern:BitmapData;
		
		private var _progress:Number = 0;
		
		public var fillStyle:int = 0;
		
		public function Progress(style:Style, progress:Number = 0) 
		{
			this._progress = progress;
			
			super(style);
		}
		
		override protected function buildStyleSheet():void 
		{
			super.buildStyleSheet();
			addStyleSheet("width", "width");
			addStyleSheet("background", "bgPattern");
			addStyleSheet("progress", "progressPattern");
		}
		
		override protected function updateDisplayList():void 
		{
			super.updateDisplayList();
			addChild(convasContainer);
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			convasContainer = new Bitmap();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			convas = convasContainer.bitmapData;
			update();
		}
		
		override public function update():void
		{
			//if(fillStyle == 0)
				drawAsTiled();
			//else if (fillStyle == 1)
			//	drawAs
		}
		
		private function drawAsTiled():void
		{
			graphics.clear();
			
			_height = bgPattern.height;
			
			var delta:Number = (bgPattern.width - progressPattern.width);
			drawTiled(0, delta / 2, progressPattern, (_width - delta) * _progress);
			drawTiled(0, 0, bgPattern, _width);
		}
		
		private function drawTiled(x:Number, y:Number, source:BitmapData, w:Number):void
		{
			graphics.beginBitmapFill(source);
			graphics.drawRect(x, y, w, source.height);			
		}
		
		public function get progress():Number 
		{
			return _progress;
		}
		
		public function set progress(value:Number):void 
		{
			_progress = value;
		}
	}

}