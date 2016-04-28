package src;

import lime.app.Event;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Marcel Stoepker
 */
class LoginScreen extends Sprite{

	public var username : String;
	public var password : String = "default";
	private var loginButtonBitmapData : BitmapData ;
	public var loginButtonBitmap : Bitmap;
	
	public function new(){
		super();
		askUserInformation();
		setButtonData();
	}
	
	public function askUserInformation(){

	}

	// This function creates the button data and does the addchild
	private function setButtonData(){
		loginButtonBitmapData = Assets.getBitmapData("img/buttonpictures/loginButton.jpg");
		loginButtonBitmap = new Bitmap (loginButtonBitmapData);
		addChild(loginButtonBitmap);
	}
	
	// This function will check the password in the database connected to the entered username and compare it with the password input.
	// When the password is correct it will go to the ui.
	public function passwordCheck():Bool {
		var tempQuery : String = "SELECT password WHERE username == "+username+";"; 
		var databasePassword : String = "default";
		
		if (password == databasePassword){
			return true;
		}
		else{
			return false;
		}
	}
}