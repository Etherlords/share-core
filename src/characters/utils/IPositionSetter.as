package characters.utils
{
import characters.view.ViewController;

import flash.geom.Vector3D;

	/**
	 * ...
	 * @author Nikro
	 */
	public interface IPositionSetter 
	{
		
		function applyPosition(actor:ViewController, position:Vector3D):Number;
	}
	
}