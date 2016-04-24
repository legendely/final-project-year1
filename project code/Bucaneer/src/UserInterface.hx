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
	
	//screens
	private var tutorial : Tutorial = new Tutorial();
	
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
		tutorialButton.addEventListener( "click", tutorialButtonClicked);
		settingsButton.addEventListener( "click", settingsButtonClicked);
		gameOverviewButton.addEventListener( "click", gameOverviewButtonClicked);
		chatRoomButton.addEventListener( "click", chatRoomButtonClicked);
	}
	
	//This function will add all the buttons to the UI.
	public function addButtons(){
		addChild(tutorialButton);
		addChild(settingsButton);
		addChild(gameOverviewButton);
		addChild(chatRoomButton);
	}
	
	//This function will remove all the buttons from the UI.
	private function removeButtons(){
		removeChild(tutorialButton);
		removeChild(settingsButton);
		removeChild(gameOverviewButton);
		removeChild(chatRoomButton);
	}
	
	//This function will run when the tutorial button is clicked.
	public function tutorialButtonClicked(me:MouseEvent):Void {
		removeButtons();
		addChild(tutorial);
		tutorial.backButton.addEventListener("click", goBack);
		tutorial.addBackButton();
	}
	
	//This function will run when the settings button is clicked.
	public function settingsButtonClicked(me:MouseEvent):Void {
		removeButtons();
	}
	
	//This fucntion will run when the gameOverview button is clicked.
	public function gameOverviewButtonClicked(me:MouseEvent):Void {
		removeButtons();
	}
	
	//This function will run when the chatRoom button is clicked.
	public function chatRoomButtonClicked(me:MouseEvent):Void {
		removeButtons();
	}
	
	public function goBack(me:MouseEvent){
		tutorial.removeBackButton();
		addButtons();
	}
}