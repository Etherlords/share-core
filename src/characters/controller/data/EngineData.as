package characters.controller.data 
{
	/**
	 * ...
	 * @author Nikro
	 */
	public class EngineData 
	{
		
		public var isEngineOn:Boolean = false;
		
		public var maxSpeed:Number = 1000;
		public var currentSpeed:Number = 0;
		
		public var speedUpModificator:Number = 100;
		public var speedDownModificator:Number = 90;
		
		public var rotationSpeed:Number;
		
		public function EngineData() 
		{
			
		}
		
	}

}