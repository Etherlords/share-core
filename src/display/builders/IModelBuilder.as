package display.builders 
{
import characters.view.ViewController;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public interface IModelBuilder 
	{
		
		function build(path:String):ViewController;
	}
	
}