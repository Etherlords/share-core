package ui.layout 
{
	import ui.UIComponent;
	
	public class LayoutGrid 
	{
		private var componentsList:Vector.<UIComponent> = new Vector.<UIComponent>;
		
		public function LayoutGrid() 
		{
			
		}
		
		public function place(component:UIComponent):void
		{
			componentsList.push(component);
		}
		
		public function layout():void
		{
			
		}
		
	}

}