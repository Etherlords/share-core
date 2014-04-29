package ui 
{
	import core.collections.Iterable;
	import core.fileSystem.IFS;
	import core.IDestructable;
	import core.ioc.Context;
	import flash.display.Sprite;
	import ui.effects.OverEffect;
	import ui.style.Style;
	import ui.style.StylesCollector;
	import ui.style.StyleSheet;
	
	public class UIComponent extends Sprite implements IDestructable
	{
		

		public static var styles:StylesCollector = StylesCollector.instance;
		public static var vfs:IFS;
		
		protected var _width:Number = 0;
		protected var _height:Number = 0;
		
		protected var _style:Style;
		protected var styleSheet:StyleSheet = new StyleSheet();
		
		protected var subComponentsList:Vector.<UIComponent> = new Vector.<UIComponent>;
		
		protected var invaildLayout:Boolean = true;
		
		protected var _mouseInteraction:Boolean = true;
		
		public function UIComponent(style:Style = null) 
		{
			if (!vfs)
				vfs = Context.instance.getObjectByInterface('core.fileSystem::IFS') as IFS;
				
			_style = style;
			
			preinitialzie();
			buildStyleSheet();
			applyStyle();
			createChildren();
			configureChildren();
			updateDisplayList();
			initialize();
		}
		
		public function get mouseInteraction():Boolean
		{
			return _mouseInteraction;
		}
		
		public function set mouseInteraction(value:Boolean):void
		{
			if (_mouseInteraction == value)
				return;
				
			this.mouseChildren = value;
			this.mouseEnabled = value;
		}
		
		protected function invalidateLayout():void
		{
			invaildLayout = true;
		}
		
		public function removeComponents():void
		{
			for (var i:int = 0; i < subComponentsList.length; i++)
			{
				removeChild(subComponentsList[i])
			}
			
			subComponentsList = new Vector.<UIComponent>;
		}
		
		public function removeComponent(component:UIComponent):void
		{
			for (var i:int = 0; i < subComponentsList.length; i++)
			{
				if (subComponentsList[i] == component)
				{
					subComponentsList.splice(i, 1);
					break;
				}
			}
			
			removeChild(component);
		}
		
		public function addComponent(component:UIComponent):void
		{
			subComponentsList.push(component);
			
			addChild(component);
		}
		
		public function update():void
		{
			for (var i:int = 0; i < subComponentsList.length; i++)
			{
				subComponentsList[i].update();
			}
			
			if(invaildLayout)
				layoutChildren();
		}
		
		public function setEffect(effect:OverEffect):void
		{
			effect.initialize(this);
		}
		
		public function setSize(width:Number, height:Number):void
		{
			_width = width;
			_height = height;
			
			invalidateLayout();
		}
		
		public function get measureHeight():Number
		{
			return super.height;
		}
		
		public function get measureWidth():Number
		{
			return super.width;
		}
		
		override public function get height():Number 
		{
			return _height;
		}
		
		override public function set height(value:Number):void 
		{
			_height = value;
		}
		
		override public function get width():Number 
		{
			return _width;
		}
		
		override public function set width(value:Number):void 
		{
			_width = value;
		}
		
		protected function updateDisplayList():void 
		{
			
		}
		
		/**
		 * Initialize system operations, call before create children etc...
		 */
		protected function preinitialzie():void 
		{
			
		}
		
		/**
		 * Setup event calaboration, initialize objects, etc... Call after childs created and added.
		 */
		protected function initialize():void
		{
			
		}
		
		/**
		 * Create sub chldren, sub components and containers.
		 */
		protected function createChildren():void
		{
			
		}
		
		/**
		 * specific configuration for childrens, specific params etc...
		 */
		protected function configureChildren():void
		{
			
		}
		
		/**
		 * Выравнивание потомков, вызывается после создания компонента и при изменении рамзмеров или чего то подобного
		 * вызывается после вхождения в новый кадр, если флаг <code>invaildLayout = true;</code>
		 */
		protected function layoutChildren():void
		{
			invaildLayout = false;
		}
		
		/**
		 * Убирает потомков (суб компоненты) из дисплей листа
		 */
		protected function destroyChildren():void
		{
			for (var i:int = 0; i < subComponentsList.length; i++)
			{
				removeChild(subComponentsList[i]);
			}
			
			subComponentsList = null;
		}
		
		/**
		 * Деструктор, по дефолту инициирует удаление потомков с дисплей листа
		 */
		public function destroy():void
		{
			destroyChildren();
		}
		
		
		/**
		 * Вызвается перед <code>applyStyle</code> для добавления или замещение полей в стиль компонента
		 */
		protected function buildStyleSheet():void
		{
			
		}
		
		/**
		 * Добавляет поле стиля в таблицу стилей
		 * @param	styleKey
		 * @param	fieldToBind
		 */
		public function addStyleSheet(styleKey:String, fieldToBind:String):void
		{
			styleSheet.bindStyle(styleKey, fieldToBind);
		}
		
		public function get style():Style 
		{
			return _style;
		}
		
		public function set style(value:Style):void 
		{
			_style = value;
		}
		
		/**
		 * Присваивает полям заданым в стиле значения текущего стиля
		 */
		protected function applyStyle():void
		{
			var stylesList:Iterable = styleSheet.styles;
			
			if (stylesList.length == 0)
				return;
				
			if(!_style)
				return;
				
			var currentItem:Object = stylesList.currentItem; 
			
			for (var i:int = 0; i < stylesList.length; i++)
			{
				_style.applyStyle(this, stylesList.current, currentItem as String);
				
				currentItem = stylesList.nextItem;
			}
		}
		
	}

}