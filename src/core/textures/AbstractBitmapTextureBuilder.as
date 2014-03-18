package core.textures 
{
	import away3d.textures.TextureProxyBase;
	import core.IDestructable;
	
	public class AbstractBitmapTextureBuilder implements ITextureBuilder, IDestructable 
	{
		private var _source:IBitmapOutput;
		
		public function AbstractBitmapTextureBuilder() 
		{
			
		}
		
		public function get source():IBitmapOutput 
		{
			return _source;
		}
		
		public function set source(value:IBitmapOutput):void 
		{
			_source = value;
		}
			
		public function build():TextureProxyBase 
		{
			return null;
		}
		
		public function destroy():void 
		{
			
		}
		
	}

}