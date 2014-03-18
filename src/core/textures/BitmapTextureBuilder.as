package core.textures 
{
	import away3d.textures.BitmapTexture;
	import away3d.textures.TextureProxyBase;
	import core.IDestructable;
	
	public class BitmapTextureBuilder extends AbstractBitmapTextureBuilder implements ITextureBuilder, IDestructable
	{
		public var generateMipMaps:Boolean = true;
		
		public function BitmapTextureBuilder(generateMipMaps:Boolean = true) 
		{
			this.generateMipMaps = generateMipMaps;
		}
		
		override public function build():TextureProxyBase 
		{
			var texture:BitmapTexture = new BitmapTexture(source.output, generateMipMaps);
			
			return texture;
		}
		
		override public function destroy():void 
		{
			
		}
	}

}