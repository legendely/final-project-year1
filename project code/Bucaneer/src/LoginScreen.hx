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

	public var playerId : Int;
	public var setId : Int;
	
	private var loginButtonBitmapData : BitmapData ;
	public var loginButtonBitmap : Bitmap;
	
	public var playerButtonArray : Array<LoginButtons> = new Array();
	private var buttonXCordArray : Array<Int> = new Array();
	public var setChoiseButtonArray : Array<LoginButtons> = new Array();


	public function new(){
		super();
		makePlayerChoiseButtons();
	}
	
	public function makePlayerChoiseButtons(){
		buttonXCordArray = [0,50,100,150,200,250];
		for (i in 0...6) {	
			var tempButton : LoginButtons = new LoginButtons("img/buttonpictures/player"+(1+i)+"Button.jpg", i+1);
			playerButtonArray[i] = tempButton;
			addChild(playerButtonArray[i]);
			playerButtonArray[i].x = buttonXCordArray[i];
			playerButtonArray[i].y = 300;
			playerButtonArray[i].addEventListener("click", playerChoiseClicked);
		}
	}

	public function initializeSetChoise(){
		for (i in 0...4) {	
			buttonXCordArray = [100,200,300,400];
			var tempButton : LoginButtons = new LoginButtons("img/buttonpictures/set"+(1+i)+".jpg", i+1);
			setChoiseButtonArray[i] = tempButton;
			addChild(setChoiseButtonArray[i]);
			setChoiseButtonArray[i].x = buttonXCordArray[i];
			setChoiseButtonArray[i].y = 300;
			setChoiseButtonArray[i].addEventListener("click", setChoiseButtonClicked);
		}
	}
	
	public function removePlayerChoiseButtons(){
		for(i in 0...6){
			removeChild(playerButtonArray[i]);
		}
	}
	
	public function playerChoiseClicked(me : MouseEvent){
		playerId = me.target.id;
		removePlayerChoiseButtons();
		initializeSetChoise();
	}
	
	public function setChoiseButtonClicked(me:MouseEvent):Void{
		setId = me.target.id;
	}
	
	public function getPlayerId():Int{
		return playerId;
	}
	
	public function getSetId():Int{
		return setId;
	}
}