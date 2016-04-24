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
class Tutorial extends Sprite{

	public var backButton : Sprite = new Sprite();
	
	public function new(){
		super();
		var backBitmapData : BitmapData = Assets.getBitmapData("img/buttonpictures/backButton.jpg");
		var backBitmap : Bitmap = new Bitmap (backBitmapData);
		backButton.addChild(backBitmap);
	}
	
	public function removeBackButton(){
		removeChild(backButton);
	}
	
	public function addBackButton(){
		addChild(backButton);
	}
	
	
	
}