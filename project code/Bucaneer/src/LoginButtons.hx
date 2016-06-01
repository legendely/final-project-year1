package src;

import lime.app.Event;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
/**
 * ...
 * @author Stoep
 */
class LoginButtons extends Sprite{

	public var id : Int;
	
	public function new(bitmapDataInput : String, idPicked : Int){
		super();
		id = idPicked;
		this.addEventListener("click", playerPicked);
		
		var tempBitmapData : BitmapData = Assets.getBitmapData(bitmapDataInput);
		var tempBitmap : Bitmap = new Bitmap(tempBitmapData);
		this.addChild(tempBitmap);
	}
	
	public function playerPicked(me:MouseEvent){
		
	}
}