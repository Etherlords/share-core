package ui 
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import ui.events.ScrollEvent;
	import ui.style.Style;
	
	public class ScrollContainer extends UIComponent 
	{
		private var _content:UIComponent;
		private var container:UIComponent;
		
		private var scrollBar:ScrollBar;
		
		public function ScrollContainer(style:Style=null, scrollBar:ScrollBar = null, width:Number = 100, height:Number = 250) 
		{
			this.scrollBar = scrollBar;
			_height = height;
			_width = width;
			
			super(style);	
		}
		
		private var contentOldHeight:Number = 0;
		
		override public function update():void 
		{
			super.update();
			
			if (_content && _content.height != contentOldHeight)
			{
				contentOldHeight = _content.height;
				setContentPosition();
			}
		}
		
		private function setContentPosition():void 
		{
			if (_content)
			{
				scrollBar.pageSize = contentOldHeight;
				scrollBar.size = _height;
				
				var heightDelta:Number = _height - contentOldHeight;
				
				if (heightDelta > 0)
					heightDelta = 0;
				
				_content.y = heightDelta * scrollBar.position;
			}
		}
		
		private function applySize():void
		{
			if(container)
				container.scrollRect = new Rectangle(0, 0, _width - scrollBar.width, _height);
		}
		
		override protected function configureChildren():void 
		{
			super.configureChildren();
			scrollBar.size = _height;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			scrollBar.addEventListener(ScrollEvent.SCROLL, onScrollChange);
		}
		
		private function onScrollChange(e:ScrollEvent):void 
		{
			if(e.delta != 0)
				setContentPosition();
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
		}
		
		private static var topLeft:Point = new Point();
		private static var bottomRight:Point = new Point();
		
		private function onMouseWheel(e:MouseEvent):void 
		{
			topLeft.setTo(this.x, this.y);
			topLeft = localToGlobal(topLeft);
			bottomRight.setTo(topLeft.x + width, topLeft.y + height);
			
			if (!isInside(e.stageX, e.stageY))
				return;
			
			var delta:Number = -100 / (_height - _content.height);
			
			if (e.delta < 0)
				delta *= -1;
			
			this.scrollBar.position -= delta;
			
			setContentPosition();
		}
		
		private function isInside(x:Number, y:Number):Boolean
		{
			return x > topLeft.x && x < bottomRight.x && y > topLeft.y && y < bottomRight.y
		}
		
		override protected function layoutChildren():void 
		{
			super.layoutChildren();
			
			applySize();
			scrollBar.x = _width - scrollBar.width
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			container = new UIComponent();
		}
		
		override protected function updateDisplayList():void 
		{
			super.updateDisplayList();
			
			addComponent(container);
			addComponent(scrollBar);
		}
		
		public function get content():UIComponent 
		{
			return _content;
		}
		
		public function set content(value:UIComponent):void 
		{
			if (_content)
				container.removeComponent(_content);
				
			_content = value;
			
			container.addComponent(_content);
			
			applySize();
		}
		
	}

}