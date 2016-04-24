package src;

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
	public var password : String;
	
	public function new(){
		super();
		askUserInformation();
	}
	
	public function askUserInformation(){
		Sys.println("What is your username?");
		username = Sys.stdin().readLine();
		Sys.println("What is your password?");
		password = Sys.stdin().readLine();
	}
}