package;

import openfl.display.Sprite;
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

	public var username : String;
	public var password : String;
	public var userInterface : UserInterface = new UserInterface();
	public var intro : Intro = new Intro();
	public var user : User = new User();
	//public var loginscreen : LoginScreen = new LoginScreen();
	
	public function new(){
		super();
		addChild(userInterface);
		//addChild(loginscreen);
	}
	
	public function loginScreenInit(){
		
	}
}
