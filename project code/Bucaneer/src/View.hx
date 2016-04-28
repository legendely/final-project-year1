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
class View extends Sprite{

	public var backButton : Sprite; 
	public var titleTextField : TextField; 
	public var textFieldFormat : TextFormat; 
	public var backBitmapData : BitmapData;
	public var backBitmap : Bitmap;
	public var viewName : String;
	
	public function new(vn: String) {
		super();
		backButton = new Sprite();
		titleTextField = new TextField();
		textFieldFormat = new TextFormat();
		backBitmapData = Assets.getBitmapData("img/buttonpictures/backButton.jpg");
		backBitmap = new Bitmap (backBitmapData);
		backButton.addChild(backBitmap);
		viewName = vn;
		addView();
	}
	
	public function removeView(){
		removeChild(backButton);
		removeChild(titleTextField);
	}
	
	public function addView(){
		addChild(backButton);
		addChild(titleTextField);
		initializeTitleText();
	}
	
	//Default settings textfield.
	private function initializeTitleText(){
		titleTextField.text = "You are currently in the "+viewName+"!";
		titleTextField.textColor = 0xFFFFF;
		titleTextField.setTextFormat(textFieldFormat);
		titleTextField.x = 300;
		titleTextField.width = 300;
		addChild(titleTextField);
	}
}