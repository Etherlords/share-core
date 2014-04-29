package ui.list
{
	
	public class ListDataProvider
	{
		private var _list:Vector.<Object> = new Vector.<Object>;
		
		public function ListDataProvider()
		{
		
		}
		
		public function get list():Vector.<Object> 
		{
			return _list;
		}
		
		public function set list(value:Vector.<Object>):void 
		{
			_list = value;
		}
		
		public function pushValue(value:Object):void
		{
			list.push(value);
		}
	
	}

}