package ui.list 
{
	import ui.style.Style;
	import ui.UIComponent;

	public class DefaultListItemFactory extends AbstractListItemFactory 
	{
		public var itemConstructor:Class;
		
		public function DefaultListItemFactory() 
		{
			super();
		}
		
		override public function buildItem(style:Style):UIComponent 
		{
			return new itemConstructor(style);
		}
	}

}