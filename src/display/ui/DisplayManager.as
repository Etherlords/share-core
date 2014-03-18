package display.ui 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public class DisplayManager 
	{
		
		[Inject]
		public var stage:Stage;
		
		public function DisplayManager() 
		{
			inject(this);
		}
		
		public function show(target:Sprite):void
		{
			stage.addChild(target);
		}
		
		public function hide(target:Sprite):void
		{
			stage.removeChild(target);
		}
		
		
	}

}