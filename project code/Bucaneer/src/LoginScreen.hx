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

	private var playerId : Int;
	private var setId : Int;
	private var chosenAmountOfPlayers : Int;
	private var amountOfButtons : Int;
	
	//bitmap stuff
	private var loginButtonBitmapData : BitmapData ;
	private var loginButtonBitmap : Bitmap;
	
	// Arrays for button cords and login buttons.
	private var buttonXCordArray : Array<Int> = new Array();
	private var loginButtonArray : Array<LoginButtons> = new Array();
	
	private var state : Int = 0;
	
	public function new(){
		super();
		initializeLoginButtonChoices();
	}
	
	public function initializeLoginButtonChoices() {
		// state 0 chose amount of players.
		if (state == 0) {
			amountOfButtons = 2;
			
			// will set the bitmap for the buttons and the x position
			for (i in 0...amountOfButtons){
				buttonXCordArray = [100, 200];
				loginButtonArray[i] = new LoginButtons("img/buttonpictures/amountOfPlayers"+((i*2)+4)+".jpg", ((i*2)+4));
			}
		}
		// state 1 chose a player color.
		else if (state == 1) {
			// depending on the ammount of players it will pick an amount of buttons
			checkAmountOfPlayers();
			
			// will set the bitmap for the buttons and the x position
			for (i in 0...amountOfButtons) {
				buttonXCordArray = [0,50,100,150,200,250];	
				loginButtonArray[i] = new LoginButtons("img/buttonpictures/player" + (1 + i) + "Button.jpg", i + 1);
			}
		}
		// state 2 chose set.
		else if (state == 2) {
			amountOfButtons = 4;
			// will set the bitmap for the buttons and the x position
			for (i in 0...amountOfButtons) {
				buttonXCordArray = [100,200,300,400];	
				loginButtonArray[i] =  new LoginButtons("img/buttonpictures/set" + (1 + i) + ".jpg", i + 1);
			}
		}
		//increment state
		state++;
		// Adding the buttons to loginscreen.
		// Setting the coordinates of the buttons.
		// Adding the mouseventlistner.
		for (i in 0...amountOfButtons){
			addChild(loginButtonArray[i]);
			loginButtonArray[i].x = buttonXCordArray[i];
			loginButtonArray[i].y = 300;
			loginButtonArray[i].addEventListener("click", nextState);
		}
	}
	
	// this function will check the amount of players selected by the player and set the amount of buttons there will have to be at the selection playercolor.
	public function checkAmountOfPlayers(){
		if (chosenAmountOfPlayers == 4){
			amountOfButtons = 4;
		}else if(chosenAmountOfPlayers == 6){
			amountOfButtons = 6;
		}
	}
	
	// This function will run everytime a choice has been made.
	// It will set the choice(amountofplayer/playercolor/set) id to what the player has picked.
	// Then it will remove the buttons from the previous choice.
	// At last it will rune the button initializer again for the next pick.
	public function nextState(me : MouseEvent):Void{
		if (state == 1){
			chosenAmountOfPlayers = me.target.id;
			this.removeChildren();
			initializeLoginButtonChoices();
		}else if (state == 2){
			playerId = me.target.id;
			this.removeChildren();
			initializeLoginButtonChoices();
		}else if (state == 3) {
			this.removeChildren();	
			setId = me.target.id;
		}
		
	}
	
	// get functions for main to get the results of what the player clicked on
	public function getChosenAmountOfPlayers(){
		return chosenAmountOfPlayers;
	}
	
	public function getPlayerId():Int{
		return playerId;
	}
	
	public function getSetId():Int{
		return setId;
	}
}