package core.materials 
{
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.materials.TextureMaterial;
	import core.fileSystem.IFS;
	import core.materials.data.MaterialBuilderContext;
	import core.textures.BitmapSpecularTextureBuilder;
	import core.textures.BitmapTextureBuilder;
	import core.textures.LibraryTextureSource;

	public class MaterialFactory 
	{
		public var absolutePath:String = '';
		
		private var textureMaterialController:TextureMaterialController;
		
		private var diffuseBuilder:BitmapTextureBuilder;
		private var normalBuilder:BitmapTextureBuilder;
		private var ambientBuilder:BitmapTextureBuilder;
		private var specularBuilder:BitmapSpecularTextureBuilder;
		
		public var lights:StaticLightPicker
		
		public function MaterialFactory() 
		{
			
			initialize();
		}
		
		private function initialize():void 
		{
			textureMaterialController = new TextureMaterialController();
			
			diffuseBuilder = new BitmapTextureBuilder();
			diffuseBuilder.source = new LibraryTextureSource();
			
			normalBuilder = new BitmapTextureBuilder();
			normalBuilder.source = new LibraryTextureSource();
			
			specularBuilder = new BitmapSpecularTextureBuilder();
			specularBuilder.source = new LibraryTextureSource();
			
			ambientBuilder = new BitmapTextureBuilder();
			ambientBuilder.source = new LibraryTextureSource();
		}
		
		public function buildMaterial(context:MaterialBuilderContext):TextureMaterial
		{
			textureMaterialController.clear();
			
			(diffuseBuilder.source as LibraryTextureSource).path = context.diffusePath;
			textureMaterialController.diffuseTextureBuilder = diffuseBuilder;
			
			if (context.normalPath)
			{
				(normalBuilder.source as LibraryTextureSource).path = context.normalPath;
				textureMaterialController.normalTextureBuilder = normalBuilder;
			}
				
			if (context.specularMap)
			{
				(specularBuilder.source as LibraryTextureSource).path = context.specularMap;
				textureMaterialController.specularTextureBuilder = specularBuilder;
			}
				
			if (context.ambientMap)	
			{
				(ambientBuilder.source as LibraryTextureSource).path = context.ambientMap;
				textureMaterialController.ambientTextureBuilder = ambientBuilder;
			}
			
			textureMaterialController.buildMaterial();
			
			if (lights)
				textureMaterialController.material.lightPicker = lights;
			
			return textureMaterialController.material;
		}
		
	}

}