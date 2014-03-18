package characters.controller 
{
	import away3d.containers.ObjectContainer3D;
	import characters.controller.data.EngineData;
	import characters.view.ViewController;
	import display.IActorController;

	import flash.events.EventDispatcher;
	import flash.geom.Vector3D;
	
	public class FlightVehicleMoveController extends EventDispatcher implements IActorController 
	{
		private var viewController:ViewController;
		private var partOfIteration:Number;
		
		public var position:Vector3D = new Vector3D();
		public var engineData:EngineData = new EngineData();
		
		public static const IDENT:String = 'FlightVehicleController';
		
		public function FlightVehicleMoveController(viewController:ViewController) 
		{
			this.viewController = viewController;
			
		}
		
		public function get ident():String 
		{
			return IDENT;
		}
		
		public function launch():void
		{
			engineData.isEngineOn = true;
		}
		
		public function stop():void
		{
			engineData.isEngineOn = false;
		}
		
		public function update(worldStep:WorldStep):void 
		{
			
			partOfIteration = worldStep.part;
			
			//trace('dt', dt, partOfIteration);
			
			if (engineData.isEngineOn)
				speedUp();
			else
				speedDown();
				
			calculatePosition();
		}
		
		private function calculatePosition():void 
		{
			var dispalyObject:ObjectContainer3D = viewController.displayObject;
			
			dispalyObject.moveForward(engineData.currentSpeed * partOfIteration);
		}
		
		private function speedDown():void 
		{
			var speedDownRate:Number = engineData.speedDownModificator * partOfIteration;
			engineData.currentSpeed -= speedDownRate;
			
			if (engineData.currentSpeed < 0)
				engineData.currentSpeed = 0;
		}
		
		private function speedUp():void 
		{
			
			var speedUpRate:Number = engineData.speedUpModificator * partOfIteration;
			engineData.currentSpeed += speedUpRate;
			
			
			if (engineData.currentSpeed > engineData.maxSpeed)
			{
				engineData.currentSpeed = engineData.maxSpeed
				return;
			}
		}
		
	}

}