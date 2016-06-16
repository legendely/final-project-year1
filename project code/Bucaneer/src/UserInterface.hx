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
class UserInterface extends Sprite {

	
	// locations
		//views
	private var location1View : View = new View("location1");
	private var location2View : View = new View("location2");
	private var location3View : View = new View("location3");
	
	private var locationArray : Array<Sprite>;
	private var locationY : Array<Int>;
	private var locationX : Array<Int>;
	
	private var location1 : Sprite = new Sprite();
	private var location2 : Sprite = new Sprite();
	private var location3 : Sprite = new Sprite();
	
	// chosen set and player
	private var set : Int;
	private var player : Int;
	
	// timer
	private var timer : haxe.Timer;
	
	//settingsInterface
	private var settingsInterface : SettingsInterface;
	
	//buttons
	private var buttonLeft : Sprite = new Sprite();
	private var buttonRight : Sprite = new Sprite();
	private var settingsButton : Sprite = new Sprite();
	
	//BitmapData and bitmaps
	private var settingButtonBitmapData : BitmapData;
	private var settingButtonBitmap : Bitmap;
	private var buttonLeftBitmapData : BitmapData;
	private var buttonLeftBitmap : Bitmap;
	private var buttonRightBitmapData : BitmapData;
	private var buttonRightBitmap : Bitmap;
	
	//map data
	private var bitmapIsland : Bitmap;
	private var bitmapDataIsland: BitmapData;
	
	public function new(choosenSet:Int,choosenPlayer:Int){
		super();
		settingsInterface = new SettingsInterface(choosenSet, choosenPlayer);
		settingsInterface.backButton.addEventListener("click", backToIsland);
		initializeIsland();
		initialzeBackButtonLocationViewEventlistners();
		
	}
	
	public function initializeSettingButton(){
		settingButtonBitmapData = Assets.getBitmapData("img/buttonpictures/SettingsButtonResized.png");
		settingButtonBitmap = new Bitmap(settingButtonBitmapData);
		settingsButton.addChild(settingButtonBitmap);
	}
	
	//will set the data for the island as background
	public function initializeIsland(){
		//bitmap stuff, will add the pictures to the buttons and set the island picture.
		bitmapDataIsland = Assets.getBitmapData("img/islandMap.jpg");
		bitmapIsland = new Bitmap(bitmapDataIsland);
		buttonLeftBitmapData = Assets.getBitmapData("img/buttonpictures/moveButtonLeft.png");
		buttonLeftBitmap = new Bitmap(buttonLeftBitmapData);
		buttonRightBitmapData = Assets.getBitmapData("img/buttonpictures/moveButtonRight.png");
		buttonRightBitmap = new Bitmap(buttonRightBitmapData);
		initializeSettingButton();
		
		// will add the movement buttons to the UI
		buttonLeft.addChild(buttonLeftBitmap);
		buttonRight.addChild(buttonRightBitmap);
		
		settingsIslandMovementButtons();
		
		addChilderenIsland();

		// adds actionlistners to the buttons to move the island.
		buttonLeft.addEventListener("click", moveIsland);
		buttonRight.addEventListener("click", moveIsland);
		settingsButton.addEventListener("click", settingsButtonClicked);
		
		//init locations add them to the frame.
		initializeLocations();
	}
	
	// removers all the assets involving the island.
	public function removeChilderenIsland():Void{
		removeChild(bitmapIsland);
		removeChild(buttonLeft);
		removeChild(buttonRight);
		removeChild(settingsButton);
	}
	
	// adds all the assets involving the island.
	public function addChilderenIsland():Void{
		addChild(bitmapIsland);
		addChild(buttonLeft);
		addChild(buttonRight);
		addChild(settingsButton);
		addChild(location1);
		addChild(location2);
		addChild(location3);
	}
	
	// will move the picture of the island (actionlistner added to buttonright and buttonleft).
	public function moveIsland(me:MouseEvent):Void{
		timer = new haxe.Timer(1);
		
		// maxMovement indicates how var the island will move.
		var maxMovement : Int = 50;
		// movementSpeed indicated how fast the island will be moveing.
		var movementSpeed : Int = 20;
		var temp : Int = 0;
		
		if (me.target == buttonLeft){
			timer.run = function():Void {
				temp++;
				trace(temp);
				bitmapIsland.x = bitmapIsland.x + movementSpeed;
				if (temp == maxMovement){
					timer.stop();
				}
			}
		}else if (me.target == buttonRight){
			timer.run = function():Void {
				temp++;
				trace(temp);
				bitmapIsland.x = bitmapIsland.x - movementSpeed;
				if (temp == maxMovement){
					timer.stop();
				}
			}	
		}
	}
	
	public function settingsIslandMovementButtons(){
		buttonLeft.x = 10;
		buttonLeft.y = 300;
		buttonRight.x = 1400;
		buttonRight.y = 300;
		settingsButton.x = 0;
		settingsButton.y = 0;
	}

	public function settingsButtonClicked(me:MouseEvent):Void{
		removeChilderenIsland();
		addChild(settingsInterface);
	}
	
	public function backToIsland(me:MouseEvent):Void{
		removeChildren();
		addChilderenIsland();
	}
	
	public function initializeLocations(){
		// first X second y
		locationX = [400, 400, 400];
		locationY = [200, 300, 400];
		locationArray = [location1, location2, location3];

		insertLocationData();
	}
	
	public function insertLocationData(){
		for (i in 0...3){
			var temp : BitmapData = Assets.getBitmapData("img/locations/locationButton"+(i+1)+".png");
			var locationBitTemp : Bitmap = new Bitmap(temp);
			locationArray[i].addChild(locationBitTemp);
			addChild(locationArray[i]);
			locationArray[i].x = locationX[i];
			locationArray[i].y = locationY[i];
			locationArray[i].addEventListener("click", locationClicked);
		}
	}
	
	public function initialzeBackButtonLocationViewEventlistners(){
		location1View.backButton.addEventListener("click", backToIsland);
		location2View.backButton.addEventListener("click", backToIsland);
		location3View.backButton.addEventListener("click", backToIsland);
	}
	
	public function locationClicked(me:MouseEvent):Void{
		removeChildren();
		if (me.target == location1){
			addChild(location1View);
		}else if(me.target == location2){
			addChild(location2View);
		}else if(me.target == location3){
			addChild(location3View);
		}
	}	
}