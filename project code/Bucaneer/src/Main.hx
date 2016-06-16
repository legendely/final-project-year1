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
class Main extends Sprite {
	
	private var chosenAmountOfPlayers : Int = null;
	private var chosenSet : Int = null;
	private var chosenPlayer : Int = null;
	public var userInterface : UserInterface;
	public var loginScreen : LoginScreen = new LoginScreen();
	
	public function new(){
		super();
		addChild(loginScreen);
		loginScreen.addEventListener("click", amountOfPlayersClicked);
	}
	
	// Will run when the user has chosen the amount of players.
	public function amountOfPlayersClicked(me:MouseEvent):Void{
		chosenAmountOfPlayers = loginScreen.getChosenAmountOfPlayers();
		loginScreen.addEventListener("click", playerChoiseButtonClicked);
	}
	
	// Will run when the user has chosen the playercolor.
	public function playerChoiseButtonClicked(me:MouseEvent):Void{
		chosenPlayer = loginScreen.getPlayerId();
		loginScreen.addEventListener("click", setChoiseButtonClicked);
	}
	
	// Will run when the user has chosen the dataset.
	public function setChoiseButtonClicked(me:MouseEvent):Void{
		chosenSet = loginScreen.getSetId();
		userInterface = new UserInterface(chosenSet, chosenPlayer);
		removeChild(loginScreen);
		addChild(userInterface);
	}
}
