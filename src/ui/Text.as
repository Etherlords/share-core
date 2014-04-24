package ui 
{
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import ui.events.TextEvent;
	import ui.style.Style;
	
	public class Text extends UIComponent 
	{
		public var textField:TextField = new TextField();
		private var format:TextFormat = new TextFormat();
		
		private var invalidFormat:Boolean = true;
		private var invaildSize:Boolean = true;
		
		public function Text(style:Style=null) 
		{
			_width = 100;
			_height = 20;
			
			super(style);
		}
		
		override public function get height():Number 
		{
			if (textField.autoSize != TextFieldAutoSize.NONE)
				return textField.textHeight;
			
			return _height;
		}
		
		override public function set height(value:Number):void 
		{
			if (_height == value)
				return;
				
			_height = value;
			
			invalidateSize();
		}
		
		override public function get width():Number 
		{
			if (textField.autoSize != TextFieldAutoSize.NONE)
				return textField.textWidth;
				
			return _width;
		}
		
		override public function set width(value:Number):void 
		{
			if (_width == value)
				return;
				
			_width = value;
			
			invalidateSize();
		}
		
		public function set autoSize(value:String):void
		{
			textField.autoSize = value;
		}
		
		public function set gridFitType(value:String):void
		{
			if (textField.gridFitType == value)
				return;
				
			textField.gridFitType = value;
		}
		
		public function set type(value:String):void
		{
			if (textField.type == value)
				return;
				
			textField.type = value;
		}
		
		public function set sharpness(value:Number):void
		{
			if (textField.sharpness == value)
				return;
				
			textField.sharpness = value;
		}
			
		public function set antiAliasType(value:String):void
		{
			if (value == textField.antiAliasType)
				return;
			
			textField.antiAliasType = value;
		}
		
		public function set font(value:String):void
		{
			format.font = value;
			invalidateFormat();
		}
		
		public function set leading(value:Number):void
		{
			format.leading = value;
			invalidateFormat();
		}
		
		public function set textSize(value:Number):void
		{
			format.size = value;
			invalidateFormat();
		}
		
		public function set textColor(value:uint):void
		{
			format.color = value;
			invalidateFormat();
		}
		
		public function set textAlign(value:String):void
		{
			format.align = value;
			invalidateFormat();
		}
		
		public function get text():String 
		{
			return textField.text;
		}
		
		public function set text(value:String):void 
		{
			textField.text = value;
		}
		
		private function invalidateSize():void
		{
			invaildSize = true;
		}
		
		private function invalidateFormat():void
		{
			invalidFormat = true;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			textField.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.ENTER)
				dispatchEvent(new TextEvent(TextEvent.TEXT_ENTER, false, false, textField.text));
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			textField.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		override protected function buildStyleSheet():void 
		{
			super.buildStyleSheet();
			
			addStyleSheet("font", "font");
			addStyleSheet("textSize", "textSize");
			addStyleSheet("textAlign", "textAlign");
			addStyleSheet("textColor", "textColor");
			addStyleSheet("width", "width");
			addStyleSheet("height", "height");
			addStyleSheet("autoSize", "autoSize");
			addStyleSheet("sharpness", "sharpness");
			addStyleSheet("leading", "leading");
			addStyleSheet("antiAliasType", "antiAliasType");
			addStyleSheet("gridFitType", "gridFitType");
			addStyleSheet("textAlign", "textAlign");
		}
		
		override protected function configureChildren():void 
		{
			super.configureChildren();
			
			textField.defaultTextFormat = format;
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			
			//textField = new TextField();
		}
		
		override protected function updateDisplayList():void 
		{
			super.updateDisplayList();
			
			addChild(textField);
		}
		
		override public function update():void 
		{
			super.update();
			
			validateFormat();
			validateSize();
		}
		
		protected function validateSize():void 
		{
			if (!invaildSize)
				return;
				
			invaildSize = false;
			
			textField.width = _width;
			textField.height = _height;
		}
		
		private function validateFormat():void 
		{
			if (!invalidFormat)
				return;
				
			invalidFormat = false;
			
			this.textField.defaultTextFormat = format;
			this.textField.setTextFormat(format);
		}
		
	}

}