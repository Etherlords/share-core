package characters.view 
{
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import display.IActorController;
	import display.ISceneObject;
	import flash.geom.Vector3D;
	
	public class ViewController implements ISceneObject, IActorController
	{
		public static const FORWARD:Vector3D = new Vector3D(0, 0, 1);
		public static const BACKWARD:Vector3D = new Vector3D(0, 0, -1);
		public static const LEFT:Vector3D = new Vector3D(-1, 0, 0);
		public static const RIGHT:Vector3D = new Vector3D(1, 0, 0);
		
		private static const _ident:String = "ViewController";
		
		private var isInViewPlane:Boolean;
		
		protected var _displayObject:ObjectContainer3D;
		private var currentTimePhase:Number 
		
		protected var sockets:Vector.<Socket> = new Vector.<Socket>();
		
		public var camera:Camera3D;
		
		public function ViewController(displayObject:ObjectContainer3D) 
		{
			_displayObject = displayObject;
			//inject(this);
		}
		
		public function set x(value:Number):void
		{
			_displayObject.x = value;
		}
		
		public function get x():Number
		{
			return _displayObject.x
		}
		
		public function set y(value:Number):void
		{
			_displayObject.y = value;
		}
		
		public function get y():Number
		{
			return _displayObject.y
		}
		
		public function set z(value:Number):void
		{
			_displayObject.z = value;
		}
		
		public function get z():Number
		{
			return _displayObject.z
		}
		
		private static const CAMERA_VECTOR_HELPER:Vector3D = new Vector3D();
		private static const DISPLAY_OBJECT_VECTOR_HELPER:Vector3D = new Vector3D();
		
		/**
		 * TODO: Нужно делать эту проверку, если делать вообще только при изменении координат объекта, либо камеры
		 * иначе нагрузка не малая выходит и пустая.
		 */
		public function update(worldStep:WorldStep):void
		{
			//CAMERA_VECTOR_HELPER.setTo(camera.x, camera.y, camera.z);
			//DISPLAY_OBJECT_VECTOR_HELPER.setTo(_displayObject.x, _displayObject.y, _displayObject.z);
		//	isInViewPlane = true//_characherMeshModel.mesh.worldBounds.isInFrustum(camera.frustumPlanes, camera.frustumPlanes.length);
		//	var distanceFactor:Number = DimensionalMath.distance(CAMERA_VECTOR_HELPER, DISPLAY_OBJECT_VECTOR_HELPER) / 700;
			
			currentTimePhase = worldStep.time;	
			//_displayObject.visible = isInViewPlane;
		}
		
		public function addSocket(socket:Socket):void
		{
			socket.attachTo(this);
			sockets.push(socket);
		}
		
		public function removeSocket(socket:Socket):void 
		{
			socket.detach();
		}
		
		public function get ident():String 
		{
			return _ident;
		}
		
		public function get displayObject():ObjectContainer3D 
		{
			return _displayObject;
		}
		
	}

}