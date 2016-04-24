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

	//buttons
	private var tutorialButton : Sprite = new Sprite();
	private var settingsButton : Sprite = new Sprite();
	private var gameOverviewButton : Sprite = new Sprite();
	private var chatRoomButton : Sprite = new Sprite();
	
	//views
	private var tutorialView : Tutorial = new Tutorial();
	private var chatRoomView : ChatRoom = new ChatRoom();
	private var gameOverviewView : GameOverview = new GameOverview();
	private var settingsView : Settings = new Settings();
	
	public function new(){
		super();
		initializeButtons();
	}
	
	//This function will put all the bitmapdata into bitmaps and adds them to the button sprites.
	//After that the function will add the buttons to the Userinterface.
	//Finaly setting the defaultvalues with function ==> setDefaultSetingsButtons().
	private function initializeButtons() : Void{
		//Bitmap and BitmapData part
		var tutorialBitmapData : BitmapData = Assets.getBitmapData("img/buttonpictures/tutorialButton.jpg");
		var tutorialBitmap : Bitmap = new Bitmap (tutorialBitmapData);
		tutorialButton.addChild(tutorialBitmap);
		
		var settingsBitmapData : BitmapData = Assets.getBitmapData("img/buttonpictures/settingsButton.jpg");
		var settingsBitmap : Bitmap = new Bitmap (settingsBitmapData);
		settingsButton.addChild(settingsBitmap);
		
		var gameOverviewBitmapData : BitmapData = Assets.getBitmapData("img/buttonpictures/gameOverviewButton.jpg");
		var gameOverviewBitmap : Bitmap = new Bitmap (gameOverviewBitmapData);
		gameOverviewButton.addChild(gameOverviewBitmap);
		
		var chatRoomBitmapData : BitmapData = Assets.getBitmapData("img/buttonpictures/chatRoomButton.jpg");
		var chatRoomBitmap : Bitmap = new Bitmap (chatRoomBitmapData);
		chatRoomButton.addChild(chatRoomBitmap);
		
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
	private function createActionListners() : Void{
		tutorialButton.addEventListener( "click", buttonClicked);
		settingsButton.addEventListener( "click", buttonClicked);
		gameOverviewButton.addEventListener( "click", buttonClicked);
		chatRoomButton.addEventListener( "click", buttonClicked);
	}
	
	//This function will add all the buttons to the UI.
	public function addButtons() : Void{
		addChild(tutorialButton);
		addChild(settingsButton);
		addChild(gameOverviewButton);
		addChild(chatRoomButton);
	}
	
	//This function will remove all the buttons from the UI.
	private function removeButtons() : Void{
		removeChild(tutorialButton);
		removeChild(settingsButton);
		removeChild(gameOverviewButton);
		removeChild(chatRoomButton);
	}
	
	//This function will run when one of the buttons is clicked.
	//First it will delete the UI buttons by doing removeButtons().
	// "me.target" is the button which is clicked, therefore this function will check which button is clicked.
	// After the check it will change the view to the clicked option and add the back button.
	public function buttonClicked(me:MouseEvent) : Void {
		removeButtons();
		if(me.target == tutorialButton){
			addChild(tutorialView);
			tutorialView.backButton.addEventListener("click", goBack);
			tutorialView.addBackButton();
		}else if(me.target == settingsButton){
			addChild(settingsView);
			settingsView.backButton.addEventListener("click", goBack);
			settingsView.addBackButton();
		}else if(me.target == gameOverviewButton){
			addChild(gameOverviewView);
			gameOverviewView.backButton.addEventListener("click", goBack);
			gameOverviewView.addBackButton();
		}else if(me.target == chatRoomButton){
			addChild(chatRoomView);
			chatRoomView.backButton.addEventListener("click", goBack);
			chatRoomView.addBackButton();
		}	
	}
	
	//This function will run when a back button is clicked.
	// "me.target" is the button which is clicked, therefore this function will check in which view button is clicked.
	//It will delete the view from the UI.
	//Then it will add the UI buttons again.
	public function goBack(me:MouseEvent) : Void{
		if (me.target == tutorialView.backButton){
			tutorialView.removeTutorialData();
			addButtons();
		}else if (me.target == settingsView.backButton){
			settingsView.removeSettingsData();
			addButtons();
		}else if (me.target == gameOverviewView.backButton){
			gameOverviewView.removeGameOverviewData();
			addButtons();
		}else if (me.target == chatRoomView.backButton){
			chatRoomView.removeChatRoomData();
			addButtons();
		}
	}
	
}