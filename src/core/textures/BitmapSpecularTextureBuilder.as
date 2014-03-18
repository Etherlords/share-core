package core.textures 
{
	import away3d.textures.BitmapTexture;
	import away3d.textures.SpecularBitmapTexture;
	import away3d.textures.TextureProxyBase;
	import core.IDestructable;
	
	public class BitmapSpecularTextureBuilder extends AbstractBitmapTextureBuilder implements ITextureBuilder, IDestructable
	{
		public function BitmapSpecularTextureBuilder() 
		{
		}
		
		override public function build():TextureProxyBase 
		{
			var texture:BitmapTexture = new SpecularBitmapTexture(source.output);
			
			return texture;
		}
		
		override public function destroy():void 
		{
			
		}
	}

}