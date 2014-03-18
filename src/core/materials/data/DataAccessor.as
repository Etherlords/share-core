package core.materials.data 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class DataAccessor 
	{
		private var dataRecipient:Object;
		private var dataDonor:Object;
		
		private var donorMethod:String;
		private var recipientMethod:String;
		
		public function DataAccessor() 
		{
			
		}
		
		public function access():void
		{
			dataRecipient[recipientMethod] = dataDonor[donorMethod];
		}
		
	}

}