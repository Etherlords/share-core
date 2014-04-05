package characters.view 
{
	import away3d.containers.ObjectContainer3D;
	import flash.geom.Vector3D;

	public class Socket 
	{
		private var _rotation:Vector3D = new Vector3D();
		private var _position:Vector3D = new Vector3D();
		
		private var socketTarget:ObjectContainer3D;
		private var obj:ObjectContainer3D;
		
		public function Socket() 
		{
			
		}
		
		public function attachTo(view:ViewController):void
		{
			socketTarget = view.displayObject;
		}
		
		public function addContent(obj:ObjectContainer3D):void
		{
			this.obj = obj;
			socketTarget.addChild(obj);
			
			applyPositionAndRotation();
		}
		
		private function applyPositionAndRotation():void
		{
			if (!obj)
				return;
				
			obj.rotationX = _rotation.x;
			obj.rotationY = _rotation.y;
			obj.rotationZ = _rotation.z;
			
			obj.position = _position;
		}
		
		public function get position():Vector3D 
		{
			return _position;
		}
		
		public function set position(value:Vector3D):void 
		{
			_position = value;
			applyPositionAndRotation();
		}
		
		public function get rotation():Vector3D 
		{
			return _rotation;
		}
		
		public function set rotation(value:Vector3D):void 
		{
			_rotation = value;
			applyPositionAndRotation();
		}
		
	}

}