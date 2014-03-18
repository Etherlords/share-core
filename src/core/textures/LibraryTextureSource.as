package core.textures 
{
	import core.fileSystem.IFS;
	import flash.display.BitmapData;
	
	public class LibraryTextureSource implements IBitmapOutput 
	{
		[Inject]
		public var fs:IFS;
		public var path:String;
		
		public function LibraryTextureSource(path:String = null) 
		{
			this.path = path;
			
			inject(this);
		}
		
		public function get output():BitmapData 
		{
			return  fs.getFile(path).content as BitmapData;
		}
		
	}

}