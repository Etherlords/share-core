package display 
{
	import away3d.containers.View3D;
	import characters.Actor;
	
	public class SceneController 
	{
		public var view:View3D;
		
		public var displayList:DisplayList;
		private var frameTime:Date = new Date();
		
		public var worldStep:WorldStep = new WorldStep();
		
		public function SceneController(view:View3D) 
		{
			this.view = view;
			
			initilize();
		}
		
		public function addDisplayObject(actor:Actor):void
		{
			displayList.addDisplayObject(actor);
		}
		
		public function removeDisplayObject(actor:Actor):void
		{
			displayList.removeDisplayObject(actor);
		}
		
		private function initilize():void
		{
			displayList = new DisplayList(view.scene);
			
			worldStep.time = new Date().getTime();
		}
		
		public function update():void
		{
			if (view.parent)
				view.render();
			
			var t:Number = new Date().getTime();
			worldStep.dt = t - worldStep.time;
			worldStep.time = t;
			worldStep.part = worldStep.dt / 1000;
			
			
			var displayObjects:Vector.<Actor> = displayList.displayList;
			var l:int = displayObjects.length;
			for (var i:int = 0; i < l; i++)
				displayObjects[i].update(worldStep);
		}
		
	}

}