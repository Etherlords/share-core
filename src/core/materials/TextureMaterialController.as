package core.materials 
{
	import away3d.materials.TextureMaterial;
	import away3d.textures.Texture2DBase;
	import core.textures.ITextureBuilder;

	public class TextureMaterialController 
	{
		
		private var _diffuseTextureBuilder:ITextureBuilder;
		public var normalTextureBuilder:ITextureBuilder;
		public var ambientTextureBuilder:ITextureBuilder;
		public var specularTextureBuilder:ITextureBuilder;
		
		private var textureMaterialBuilder:TextureMaterialBuilder = new TextureMaterialBuilder();
		
		private var _material:TextureMaterial;
		
		public function TextureMaterialController() 
		{
			
		}
		
		public function clear():void
		{
			diffuseTextureBuilder = null;
			normalTextureBuilder = null;
			ambientTextureBuilder = null;
			specularTextureBuilder = null;
		}
		
		public function buildMaterial():void
		{
			_material = textureMaterialBuilder.builder();
			
			if (normalTextureBuilder)
				_material.normalMap = normalTextureBuilder.build() as Texture2DBase;
				
			if (ambientTextureBuilder)
				_material.ambientTexture = ambientTextureBuilder.build() as Texture2DBase;
				
			if (specularTextureBuilder)
				_material.specularMap = specularTextureBuilder.build() as Texture2DBase;
		}
		
		public function get diffuseTextureBuilder():ITextureBuilder 
		{
			return _diffuseTextureBuilder;
		}
		
		public function set diffuseTextureBuilder(value:ITextureBuilder):void 
		{
			_diffuseTextureBuilder = value;
			textureMaterialBuilder.diffuseTexture = value;
		}
		
		public function get material():TextureMaterial 
		{
			return _material;
		}
		
		
		
	}

}