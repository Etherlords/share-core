package core.materials 
{
	import away3d.materials.TextureMaterial;
	import away3d.textures.Texture2DBase;
	import core.textures.ITextureBuilder;
	
	public class TextureMaterialBuilder 
	{
		
		private var _diffuseTexture:ITextureBuilder;
		
		public function TextureMaterialBuilder() 
		{
			
		}
		
		public function builder():TextureMaterial
		{
			var material:TextureMaterial = new TextureMaterial(_diffuseTexture.build() as Texture2DBase, true, true, true);
			
			return material;
		}
		
		public function get diffuseTexture():ITextureBuilder 
		{
			return _diffuseTexture;
		}
		
		public function set diffuseTexture(value:ITextureBuilder):void 
		{
			_diffuseTexture = value;
		}
		
	}

}