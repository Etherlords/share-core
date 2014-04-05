package characters.model 
{

	public class PlanetModel extends ActorModel
	{
		
		public var radius:Number;
		public var orbitRadius:Number;
		public var orbitalSpeed:Number;
		public var rotationSpeed:Number;
		public var isHaveAtmosphere:Boolean = true
		public var cloudsRotationSpeed:Number;
		public var atmosphereColor:uint;
		public var atmosphereSize:Number;
		public var ishaveClouds:Boolean = false;
		
		public function PlanetModel() 
		{
			
		}
		
	}

}