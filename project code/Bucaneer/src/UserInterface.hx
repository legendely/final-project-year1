package src;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.events.MouseEvent;
/**
 * ...
 * @author Marcel Stoepker
 */
class UserInterface extends Sprite{
	// chosen set and player
	private var set : Int;
	private var player : Int;
	
	// timer
	private var timer : haxe.Timer;
	
	//view buttons
	private var tutorialButton : Sprite = new Sprite();
	private var settingsButton : Sprite = new Sprite();
	private var gameOverviewButton : Sprite = new Sprite();
	private var chatRoomButton : Sprite = new Sprite();
	
	//move buttons
	private var buttonLeft : Sprite = new Sprite();
	private var buttonRight : Sprite = new Sprite();
	
	//move button Data
	private var buttonLeftBitmapData : BitmapData;
	private var buttonLeftBitmap : Bitmap;
	private var buttonRightBitmapData : BitmapData;
	private var buttonRightBitmap : Bitmap;
	
	//views
	private var tutorialView : Tutorial = new Tutorial("turorial");
	private var settingsView : Settings = new Settings("settings");
	private var gameOverviewView : GameOverview ;
	private var chatRoomView : ChatRoom = new ChatRoom("chatroom");
	
	//arrays
	private var buttonArray : Array<Sprite>;
	private var viewArray : Array<View>;
	private var bitmapDataInput : Array<String>;
	
	//map data
	private var bitmapIsland : Bitmap;
	private var bitmapDataIsland: BitmapData;
	
	public function new(choosenSet:Int,choosenPlayer:Int){
		super();
		set = choosenSet;
		player = choosenPlayer;
		gameOverviewView = new GameOverview("gameoverview",set,player);
		initializeIsland();
		initializeArrays();
		initializeButtons();
	}
	
	// This function will insert the Data into the Arrays 
	public function initializeArrays() : Void{
		buttonArray = [tutorialButton, settingsButton, gameOverviewButton, chatRoomButton];
		viewArray = [tutorialView, settingsView, gameOverviewView, chatRoomView];
		bitmapDataInput = 
		["img/buttonpictures/tutorialButton.jpg",
		"img/buttonpictures/settingsButton.jpg",
		"img/buttonpictures/gameOverviewButton.jpg",
		"img/buttonpictures/chatRoomButton.jpg"];
	}
	
	//This function will put all the bitmapdata into bitmaps and adds them to the button sprites.
	//After that the function will add the buttons to the Userinterface.
	//Finaly setting the defaultvalues with function ==> setDefaultSetingsButtons().
	private function initializeButtons() : Void{
		//Bitmap and BitmapData part
		for (i in 0...buttonArray.length){
			var tempBitmapData : BitmapData = Assets.getBitmapData(bitmapDataInput[i]);
			var tempBitmap : Bitmap = new Bitmap(tempBitmapData);
			buttonArray[i].addChild(tempBitmap);
		}

		//addChildren part
		addButtons();
		
		//default location settings
		setDefaultSetingsButtons();
		
		//create actionlistners
		createActionListners();
	}
	
	//This function will set the locations of the buttons.
	private function setDefaultSetingsButtons() : Void{
		tutorialButton.x = 0;
		tutorialButton.y = 0;
		
		settingsButton.x = 0;
		settingsButton.y = 150;
		
		gameOverviewButton.x = 0;
		gameOverviewButton.y = 300;
		
		chatRoomButton.x = 0;
		chatRoomButton.y = 450;
	}

	//creates the actionlisteners for the buttons
	private function createActionListners() : Void {
		for (i in 0...buttonArray.length){
			buttonArray[i].addEventListener("click", buttonClicked);
		}
	}
	
	//This function will add all the buttons to the UI.
	public function addButtons() : Void {
		for (i in 0...buttonArray.length){
			addChild(buttonArray[i]);
		}	
	}
	
	//This function will remove all the buttons from the UI.
	private function removeButtons() : Void{
		for (i in 0...buttonArray.length){
			removeChild(buttonArray[i]);
		}	
	}
	
	//This function will run when one of the buttons is clicked.
	//First it will delete the UI buttons by doing removeButtons().
	// "me.target" is the button which is clicked, therefore this function will check which button is clicked.
	// After the check it will change the view to the clicked option and add the back button.
	public function buttonClicked(me:MouseEvent) : Void {
		removeButtons();
		removeIsland();
		for (i in 0...buttonArray.length){
			if(me.target == buttonArray[i]){
			addChild(viewArray[i]);
			viewArray[i].backButton.addEventListener("click", goBack);
			viewArray[i].addView();
			}	
		}	
	}
	
	//This function will run when a back button is clicked.
	// "me.target" is the button which is clicked, therefore this function will check in which view button is clicked.
	//It will delete the view from the UI.
	//Then it will add the UI buttons again.
	public function goBack(me:MouseEvent) : Void{
		addChilderIsland();
		for (i in 0...buttonArray.length){
			if (me.target == viewArray[i].backButton){
			viewArray[i].removeView();
			addButtons();
			}	
		}
	}
	
	//will set the data for the island as background
	public function initializeIsland(){
		//bitmap stuff
		bitmapDataIsland = Assets.getBitmapData("img/islandMap.jpg");
		bitmapIsland = new Bitmap(bitmapDataIsland);
		buttonLeftBitmapData = Assets.getBitmapData("img/buttonpictures/moveButtonLeft.jpg");
		buttonLeftBitmap = new Bitmap(buttonLeftBitmapData);
		buttonRightBitmapData = Assets.getBitmapData("img/buttonpictures/moveButtonRight.jpg");
		buttonRightBitmap = new Bitmap(buttonRightBitmapData);
		
		buttonLeft.addChild(buttonLeftBitmap);
		buttonRight.addChild(buttonRightBitmap);
		
		buttonLeft.x = 10;
		buttonLeft.y = 500;
		buttonRight.x = 500;
		buttonRight.y = 500;
		
		addChilderIsland();

		buttonLeft.addEventListener("click", moveIsland);
		buttonRight.addEventListener("click", moveIsland);
	}
	
	public function removeIsland():Void{
		removeChild(bitmapIsland);
		removeChild(buttonLeft);
		removeChild(buttonRight);
	}
	
	public function addChilderIsland(){
		addChild(bitmapIsland);
		addChild(buttonLeft);
		addChild(buttonRight);
	}
	
	// will move the picture of the island
	public function moveIsland(me:MouseEvent):Void{
		timer = new haxe.Timer(1);
		var maxMovement : Int = 50;
		var temp : Int = 0;
		
		if (me.target == buttonLeft){
			timer.run = function():Void {
				temp++;
				trace(temp);
				bitmapIsland.x = bitmapIsland.x + 10;
				if (temp == maxMovement){
					timer.stop();
				}
			}
		}else if (me.target == buttonRight){
			timer.run = function():Void {
				temp++;
				trace(temp);
				bitmapIsland.x = bitmapIsland.x - 10;
				if (temp == maxMovement){
					timer.stop();
				}
			}	
		}
	}

}