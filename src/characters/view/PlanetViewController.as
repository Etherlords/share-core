package characters.view 
{
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.materials.utils.DefaultMaterialManager;
	import away3d.primitives.SphereGeometry;
	import characters.model.PlanetModel;
	import flash.geom.Vector3D;
	
	public class PlanetViewController extends ViewController 
	{
		private var displayContainer:ObjectContainer3D;
		private var objectModel:PlanetModel;
		public var body:Mesh;
		
		public var isCreateClouds:Boolean = false;
		
		public function PlanetViewController(objectModel:PlanetModel) 
		{
			this.objectModel = objectModel;
			displayContainer = new ObjectContainer3D();
			
			super(displayContainer);
			
			initialize();
		}
		
		private function initialize():void 
		{
			createBodies();
		}
		
		private function createMaterial():void
		{
			
		}
		
		private function createBodies():void
		{
			body = new Mesh(new SphereGeometry(objectModel.radius, 32, 24), DefaultMaterialManager.getDefaultMaterial());
			
			displayContainer.addChild(body);
		}
		
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
			
			var currentAngle:Number = objectModel.rotationSpeed * worldStep.part;
			
			body.rotate(Vector3D.X_AXIS, currentAngle);
		}
		
		
		
	}

}