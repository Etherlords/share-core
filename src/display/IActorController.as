package display 
{
	
	/**
	 * ...
	 * @author Nikro
	 */
	public interface IActorController 
	{
		
		function update(worldStep:WorldStep):void;
		
		function get ident():String;
	}
	
}