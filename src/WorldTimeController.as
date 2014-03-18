package  
{
	
	public class WorldTimeController 
	{
		private var lastTime:Number = 0;
		
		public var currentTime:Number = new Date().getTime();
		
		public var worldStep:WorldStep = new WorldStep();
		
		public function WorldTimeController() 
		{
			if (lastTime == 0)
				lastTime = currentTime;
		}
		
		public function correctTime(time:Number):void
		{
			currentTime = time;
			lastTime = currentTime;
		}
		
		public function updateTime():void
		{
			var actualTime:Number = new Date().getTime();
			
			var dt:Number = actualTime - lastTime;
			lastTime = actualTime
			this.currentTime += dt;
			
			worldStep.time = this.currentTime;
			worldStep.dt = dt;
			worldStep.part = dt / 1000;
		}
		
	}

}