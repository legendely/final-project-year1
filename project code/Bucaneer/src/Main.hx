package;

import openfl.display.Sprite;
import openfl.Lib;
import src.UserInterface;

/**
 * ...
 * @author Marcel Stoepker
 */
class Main extends Sprite{

	public var userInterface : UserInterface = new UserInterface();
	
	public function new(){
		super();
		addChild(userInterface);
	}
}
