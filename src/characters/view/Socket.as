package characters.view 
{
	import away3d.containers.ObjectContainer3D;
	import flash.geom.Vector3D;

	public class Socket 
	{
		private var _rotation:Vector3D = new Vector3D();
		private var _position:Vector3D = new Vector3D();
		private var _scale:Number = 1;
		
		private var socketTarget:ObjectContainer3D;
		public var content:ObjectContainer3D;
		
		public var type:int;
		public var name:String;
		
		public function Socket() 
		{
			
		}
		
		public function attachTo(view:ViewController):void
		{
			socketTarget = view.displayObject;
			
			if (content)
				socketTarget.addChild(content);
		}
		
		public function detach():void 
		{
			socketTarget.removeChild(content);
			socketTarget = null;
		}
		
		public function addContent(content:ObjectContainer3D):void
		{
			this.content = content;
			socketTarget.addChild(content);
			
			applyPositionAndRotation();
		}
		
		public function applyPositionAndRotation():void
		{
			if (!content)
				return;
				
			content.rotationX = _rotation.x;
			content.rotationY = _rotation.y;
			content.rotationZ = _rotation.z;
			
			content.position = _position;
			
			content.scaleX = content.scaleY = content.scaleZ = _scale;
		}
		
		public function set scale(value:Number):void
		{
			_scale = value;
		}
		
		public function get scale():Number
		{
			return _scale;
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