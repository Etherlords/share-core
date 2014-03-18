package characters.model.mobile 
{
	import flash.geom.Vector3D;
	import display.ViewController;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public interface IPositionSetter 
	{
		
		function applyPosition(actor:ViewController, position:Vector3D):Number;
	}
	
}