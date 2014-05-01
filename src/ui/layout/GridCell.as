package ui.layout 
{
	import ui.UIComponent;

	public class GridCell 
	{
		public static const ABSOLUTE:int = 0;
		public static const PERCENT:int = 1;
		
		public var sizeMode:int = ABSOLUTE;
		
		public var x:Number;
		public var y:Number;
		
		public var width:Number;
		public var height:Number;
		
		public var ident:String;
		
		public var boundTo:GridCell;
		
		public var content:UIComponent;
		
		public function GridCell() 
		{
			
		}
		
		public function placeContent():void 
		{
//			content.setSize(
		}
		
	}

}