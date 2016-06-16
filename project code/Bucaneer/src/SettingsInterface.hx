package src;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.events.MouseEvent;
import src.View;
/**
 * ...
 * @author Stoep
 */
class SettingsInterface extends View{
	
	private var background : Sprite = new Sprite();
	
	//view buttons
	private var tutorialButton : Sprite = new Sprite();
	private var settingsButton : Sprite = new Sprite();
	private var gameOverviewButton : Sprite = new Sprite();
	private var PuzzleButton : Sprite = new Sprite();
	
	//views
	private var tutorialView : Tutorial = new Tutorial("turorial");
	private var settingsView : Settings = new Settings("settings");
	private var gameOverviewView : GameOverview ;
	private var chatRoomView : ChatRoom = new ChatRoom("Puzzelroom");
	
	//arrays
	private var buttonArray : Array<Sprite>;
	private var viewArray : Array<View>;
	private var bitmapDataInput : Array<String>;
	
	public function new(set:Int,player:Int){
		super("settings");
		initializeBackground();
		gameOverviewView = new GameOverview("gameoverview", set, player);
		initializeArrays();
		initializeButtons();
		
	}
	
	public function initializeBackground(){
		var backgroundBitmapData : BitmapData = Assets.getBitmapData("img/background.jpg");
		var backgroundBitmap : Bitmap = new Bitmap(backgroundBitmapData);
		background.addChild(backgroundBitmap);
		addChild(background);
	}
	
	
	// This function will insert the Data into the Arrays 
	public function initializeArrays() : Void{
		buttonArray = [tutorialButton, settingsButton, gameOverviewButton, PuzzleButton];
		viewArray = [tutorialView, settingsView, gameOverviewView, chatRoomView];
		bitmapDataInput = 
		["img/buttonpictures/tutorialButton.jpg",
		"img/buttonpictures/settingsButton.jpg",
		"img/buttonpictures/gameOverviewButton.jpg",
		"img/buttonpictures/PuzzleButtonResized.png"];
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
	
	//This function will add all the buttons to the UI.
	public function addButtons() : Void {
		for (i in 0...buttonArray.length){
			addChild(buttonArray[i]);
		}	
	}
	
		//This function will set the locations of the buttons.
	private function setDefaultSetingsButtons() : Void{
		tutorialButton.x = 600;
		tutorialButton.y = 200;
		
		settingsButton.x = 600;
		settingsButton.y = 350;
		
		gameOverviewButton.x = 600;
		gameOverviewButton.y = 500;
		
		PuzzleButton.x = 600;
		PuzzleButton.y = 650;
	}
	
		//creates the actionlisteners for the buttons
	private function createActionListners() : Void {
		for (i in 0...buttonArray.length){
			buttonArray[i].addEventListener("click", buttonClicked);
		}
	}
	
	//This function will run when one of the buttons is clicked.
	//First it will delete the UI buttons by doing removeButtons() and the island by removeIsland().
	// "me.target" is the button which is clicked, therefore this function will check which button is clicked.
	// After the check it will change the view to the clicked option and add the back button.
	public function buttonClicked(me:MouseEvent) : Void {
		removeButtons();
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
	public function goBack(me:MouseEvent) : Void {
		this.addView();
		for (i in 0...buttonArray.length){
			if (me.target == viewArray[i].backButton){
				viewArray[i].removeView();
				addButtons();
			}	
		}
	}
	
	//This function will remove all the buttons from the UI.
	private function removeButtons() : Void {
		this.removeView();
		
		for (i in 0...buttonArray.length){
			removeChild(buttonArray[i]);
		}	
	}
}