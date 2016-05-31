package;

import lime.ui.Mouse;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.Lib;
import src.Intro;
import src.LoginScreen;
import src.User;
import src.UserInterface;

/**
 * ...
 * @author Marcel Stoepker
 */
class Main extends Sprite{

	public var chosenSet : Int = null;
	public var chosenPlayer : Int = null;
	public var userInterface : UserInterface = new UserInterface();
	public var loginScreen : LoginScreen = new LoginScreen();
	
	public function new(){
		super();
		addChild(loginScreen);
		loginScreen.addEventListener("click", playerChoiseButtonClicked);
	}
	
	public function playerChoiseButtonClicked(me:MouseEvent):Void {
		chosenPlayer = loginScreen.getPlayerId();
		loginScreen.addEventListener("click", setChoiseButtonClicked);
	}
	
	public function setChoiseButtonClicked(me:MouseEvent):Void{
		chosenSet = loginScreen.getSetId();
		removeChild(loginScreen);
		addChild(userInterface);
	}
}
