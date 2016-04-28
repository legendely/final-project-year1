package;

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

	public var username : String;
	public var password : String;
	public var userInterface : UserInterface = new UserInterface();
	public var intro : Intro = new Intro();
	public var user : User;
	public var loginScreen : LoginScreen = new LoginScreen();
	
	public function new(){
		super();
		addChild(loginScreen);
		loginScreen.addEventListener("click", loginButtonClicked);
		user = new User(loginScreen.username);
	}

	// This function will run when the login button is clicked.
	// It will run the passwordcheck function.
	// if the password is correct it will remove the loginscreen and add the userinterface.
	public function loginButtonClicked(me:MouseEvent){
		if (loginScreen.passwordCheck() == true){
			removeChild(loginScreen);
			addChild(userInterface);
		}else{
			//delete userinput
		}
		
	}
}
