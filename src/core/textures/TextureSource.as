package core.textures 
{
	
	public class TextureSource 
	{
		
		private var _source:IBitmapOutput
		
		public function TextureSource() 
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
		
	}

}