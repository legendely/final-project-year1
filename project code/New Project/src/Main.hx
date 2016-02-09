package;

import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.display.Sprite;
import flash.Lib;
import view.View;

/**
 * ...
 * @author Marcel Stoepker
 */
class Main extends Sprite{
	
	public var mainMenuView : View;
	public var gameRunningView : View;
	
	static function main(){
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// Entry point
	}
	
	// view(width,height,type)
	public function buildMenuView():Void{
		mainMenuView =  new View (1200,1200,"menu");
	}
	
	public function buildGameView():Void{
		gameRunningView =  new View (1200,1200,"game");
	}
}