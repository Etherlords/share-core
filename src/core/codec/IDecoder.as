package core.codec 
{
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public interface IDecoder 
	{
		function decode(data:ByteArray):void
		function get content():*;
	}
	
}