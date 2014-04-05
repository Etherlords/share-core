package display.ui 
{
	import core.ioc.Context;
	import flash.display.Stage;
	import ui.scenes.AbstractScene;
	import ui.UIContainer;
	
	public class DisplayManager 
	{
		[Inject]
		public var stage:Stage;
		
		public var defaultScene:AbstractScene;
		
		private var currentScene:AbstractScene;
		private var container:UIContainer = new UIContainer();
		
		public function DisplayManager() 
		{
			inject(this);
			
			stage.addChild(container)
		}
		
		public function initialize():void
		{
			scene = defaultScene;
		}
		
		public function set scene(scene:Object):void
		{
			var sceneEntity:AbstractScene;
			
			if (scene is AbstractScene)
				sceneEntity = scene as AbstractScene;
			else if (scene is String)
				sceneEntity = Context.instance.getObjectById(scene as String) as AbstractScene;
			
			hide();
			
			currentScene = sceneEntity
			
			currentScene.initialize();
			container.addComponent(currentScene.sceneView);
		}
		
		public function hide():void
		{
			if (!currentScene)
				return;
				
			container.removeComponent(currentScene.sceneView);
		}
		
		
	}

}