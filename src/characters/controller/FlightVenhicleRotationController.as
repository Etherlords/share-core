package characters.controller 
{
	import away3d.containers.ObjectContainer3D;
	import away3d.core.math.Quaternion;
	import away3d.core.math.Vector3DUtils;
	import characters.controller.data.RotationData;
	import characters.view.ViewController;
	import display.IActorController;
	import flash.events.EventDispatcher;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	/**
	 * ...
	 * @author Nikro
	 */
	public class FlightVenhicleRotationController extends EventDispatcher implements IActorController 
	{
		static public const _IDENT:String = "FlightVenhicleRotationController";
		
		public var rotationData:RotationData = new RotationData();
		
		public var rotationNormal:Vector3D = new Vector3D(0, 0, 0);
		
		private var zeroVector:Vector3D = new Vector3D();
		private var viewController:ViewController;
		
		public function FlightVenhicleRotationController(viewController:ViewController) 
		{
			this.viewController = viewController;
			
		}
		
		
		public function get ident():String 
		{
			return _IDENT;
		}
		
		public function update(worldStep:WorldStep):void 
		{
			var m:Matrix3D = new Matrix3D();
			
			var con1:ObjectContainer3D = viewController.displayObject.getChildAt(0);
			var con2:ObjectContainer3D = viewController.displayObject
			
			var partOfIteration:Number = worldStep.part;
			
			var currentAcceleration:Number = rotationData.rotationAcceleration * partOfIteration;
			
			rotationData.currentMaxRotationRateX = rotationNormal.x * rotationData.maxRotationRateX;
			rotationData.currentMaxRotationRateY = rotationNormal.y * rotationData.maxRotationRateY;
			
			var deltaRotationX:Number = Math.abs(rotationData.currentMaxRotationRateX - rotationData.currentRotationRateX)
			
			if (deltaRotationX > currentAcceleration)
			{
				if (rotationData.currentRotationRateX > rotationData.currentMaxRotationRateX)
					rotationData.currentRotationRateX -= currentAcceleration
				else
					rotationData.currentRotationRateX += currentAcceleration
			}
			else
				rotationData.currentRotationRateX = rotationData.currentMaxRotationRateX;
				
				
			var deltaRotationY:Number = Math.abs(rotationData.currentMaxRotationRateY - rotationData.currentRotationRateY)
			
			if (deltaRotationY > currentAcceleration)
			{
				if (rotationData.currentRotationRateY > rotationData.currentMaxRotationRateY)
					rotationData.currentRotationRateY -= currentAcceleration
				else
					rotationData.currentRotationRateY += currentAcceleration
			}
			else
				rotationData.currentRotationRateY = rotationData.currentMaxRotationRateY;
			
			var transform:Matrix3D = con2.transform;
			transform.prependRotation(rotationData.currentRotationRateX, Vector3D.X_AXIS);
			transform.prependRotation(rotationData.currentRotationRateY, Vector3D.Y_AXIS);
			//transform.prependRotation(5, Vector3D.Z_AXIS);
			
			con2.transform = transform;
			
			con1.rotationZ = -rotationData.currentRotationRateY * 3;
			con1.rotationX = rotationData.currentRotationRateX;
			
			//trace(con2.rotationX, con2.rotationY, con2.rotationZ);
		}
		
	}

}