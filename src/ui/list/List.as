package ui.list 
{
	import ui.style.Style;
	import ui.UIComponent;
	
	public class List extends UIComponent 
	{
		private var dataProvider:ListDataProvider = new ListDataProvider();
		
		private var elementsCount:int;
		
		public function List(style:Style=null, elementsCount:int = 10, dataProvider:ListDataProvider = null) 
		{
			this.dataProvider = dataProvider;
			super(style);
			
			this.selementsCount = selementsCount;
		}
		
		override protected function initialize():void 
		{
			if (!dataProvider)
				dataProvider = new ListDataProvider();
			else
				update();
				
			super.initialize();
		}
		
		override protected function layoutChildren():void 
		{
			
			super.layoutChildren();
		}
		
	}

}