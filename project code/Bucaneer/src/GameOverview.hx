package src;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import sys.db.Sqlite;
/**
 * ...
 * @author Marcel Stoepker
 */
class GameOverview extends View{

	public var vn : String;
	
	public function new(vn:String){
		super(vn);
		viewName = vn;
		//var connection = Sqlite.open("database/BucaneersTestDB.db");
		//var resultset = connection.request("Select * from highscores");
	}	
}