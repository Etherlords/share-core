package characters 
{
	import characters.view.ViewController;
	import display.IActorController;
	
	
	public class Actor 
	{
		private var controllers:Vector.<IActorController> = new Vector.<IActorController>;
		private var controllersMap:Object = { };
		
		public var viewController:ViewController;
		public var id:String;
		
		public function Actor(viewController:ViewController) 
		{
			this.viewController = viewController;
			addController(viewController);
		}
		
		public function getController(ident:String):IActorController
		{
			return controllersMap[ident];
		}
		
		public function addController(controller:IActorController):void
		{
			controllersMap[controller.ident] = controller;
			controllers.push(controller);
		}
		
		public function update(worldStep:WorldStep):void
		{
			
			var l:int = controllers.length;
			for (var i:int = 0; i < l; i++)
			{
				controllers[i].update(worldStep);
			}
		}
		
	}

}