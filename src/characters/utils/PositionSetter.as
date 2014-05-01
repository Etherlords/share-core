package characters.utils
{
import characters.view.ViewController;

import flash.geom.Vector3D;

public class PositionSetter implements IPositionSetter
	{
		
		public function PositionSetter() 
		{
			
		}
		
	
		public function applyPosition(actor:ViewController, position:Vector3D):Number 
		{
			actor.x = position.x;
			actor.y = position.y;
			
			return 0;
		}
		
	}

}