package characters.view 
{
	import away3d.arcane;
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.materials.ColorMaterial;
	import away3d.materials.compilation.ShaderRegisterCache;
	import away3d.materials.compilation.ShaderRegisterData;
	import away3d.materials.compilation.ShaderRegisterElement;
	import away3d.materials.methods.CompositeDiffuseMethod;
	import away3d.materials.methods.MethodVO;
	import away3d.materials.utils.DefaultMaterialManager;
	import away3d.primitives.SphereGeometry;
	import characters.model.PlanetModel;
	import core.fileSystem.IFS;
	import flash.display.BlendMode;
	import flash.geom.Vector3D;
	
	public class PlanetViewController extends ViewController 
	{
		
		use namespace arcane;
		
		private var displayContainer:ObjectContainer3D;
		private var objectModel:PlanetModel;
		
		private var atmosphereMaterial:ColorMaterial;
		private var _atmosphereDiffuseMethod:CompositeDiffuseMethod;
		
		
		public var body:Mesh;
		public var atmosphere:Mesh;
		public var clouds:Mesh;
		
		public var isCreateClouds:Boolean = false;
		
		public var vfs:IFS;
		
		public function PlanetViewController(objectModel:PlanetModel) 
		{
			inject(this);
			
			this.objectModel = objectModel;
			displayContainer = new ObjectContainer3D();
			
			super(displayContainer);
			
			initialize();
		}
		
		override public function get ident():String 
		{
			return "PlanetViewController";
		}
		
		private function initialize():void 
		{
			createMaterial();
			createBodies();
		}
		
		private function createMaterial():void
		{
			if (objectModel.isHaveAtmosphere)
			{
				atmosphereMaterial = new ColorMaterial(objectModel.atmosphereColor, 2);
				atmosphereMaterial.blendMode = BlendMode.ADD;
				atmosphereMaterial.gloss = 5;
				atmosphereMaterial.specular = 0;
				_atmosphereDiffuseMethod = new CompositeDiffuseMethod(modulateDiffuseMethod);
				atmosphereMaterial.diffuseMethod = _atmosphereDiffuseMethod;
			}
		}
		
		private function createBodies():void
		{
			var segmentsH:Number = 50;
			var segmentsW:Number = 100;
			
			body = new Mesh(new SphereGeometry(objectModel.radius, segmentsW, segmentsH), DefaultMaterialManager.getDefaultMaterial());
			//body.geometry.scaleUV(1, 1.2);
			
			
			if (objectModel.isHaveAtmosphere)
			{
				atmosphere = new Mesh(new SphereGeometry(objectModel.radius + objectModel.atmosphereSize, segmentsW, segmentsH), atmosphereMaterial);
				atmosphere.scaleX = -1;
				atmosphere.material['ambient'] = 0.1;
				displayContainer.addChild(atmosphere);
			}
			
			displayContainer.addChild(body);
			
			if (objectModel.ishaveClouds)
			{
				clouds = new Mesh(new SphereGeometry(objectModel.radius + 1, segmentsW, segmentsH), DefaultMaterialManager.getDefaultMaterial());
				displayContainer.addChild(clouds);
			}
			
			
		}
		
		private function modulateDiffuseMethod( vo:MethodVO, t:ShaderRegisterElement, regCache:ShaderRegisterCache, sharedRegisters:ShaderRegisterData ):String {
			
			var viewDirFragmentReg:ShaderRegisterElement = sharedRegisters.viewDirFragment;
			var normalFragmentReg:ShaderRegisterElement = sharedRegisters.normalFragment;
			var temp:ShaderRegisterElement = regCache.getFreeFragmentSingleTemp();
			regCache.addFragmentTempUsages( temp, 1 );
			var code:String = "dp3 " + temp + ", " + viewDirFragmentReg + ".xyz, " + normalFragmentReg + ".xyz\n" +
					"mul " + temp + ", " + temp + ", " + temp + "\n" +
					"mul " + t + ".w, " + t + ".w, " + temp + "\n";
			regCache.removeFragmentTempUsage( temp );
			return code;
		}
		
		private var bodyangle:Number = 0;
		override public function update(worldStep:WorldStep):void 
		{
			super.update(worldStep);
			
			var currentAngle:Number = objectModel.rotationSpeed * worldStep.part;
			var cloudAngle:Number = (objectModel.rotationSpeed - 0.5) * worldStep.part;
			bodyangle += currentAngle;
			
			body.rotate(Vector3D.Y_AXIS, currentAngle);
			
			if(objectModel.ishaveClouds)
				clouds.rotate(Vector3D.Y_AXIS, cloudAngle);
			
			//body.rotationY = bodyangle;
			//clouds.rotationY += cloudAngle;
		}
		
		
		
	}

}