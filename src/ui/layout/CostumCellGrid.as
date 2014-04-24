package ui.layout 
{
	import ui.UIComponent;
	
	public class CostumCellGrid extends LayoutGrid 
	{
		
		private var cells:Vector.<GridCell> = new Vector.<GridCell>
		
		public function CostumCellGrid() 
		{
			super();
		}
		
		public function addCell(cell:GridCell):void
		{
			cells.push(cell);
		}
		
		public function placeToCell(ident:String, content:UIComponent):void
		{
			
		}
		
		override public function layout():void 
		{
			for (var i:int = 0; i  < cells.length; i++)
			{
				cells[i].placeContent();
			}
		}
	}

}