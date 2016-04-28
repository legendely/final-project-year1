package src;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
/**
 * ...
 * @author Marcel Stoepker
 */
class Settings extends View{

	public var vn : String;
	
	public function new(vn:String){
		super(vn);
		viewName = vn;
	}	
}