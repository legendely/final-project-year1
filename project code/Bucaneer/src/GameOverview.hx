package src;

import haxe.remoting.Connection;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import sys.db.ResultSet;
import sys.db.Sqlite;
/**
 * ...
 * @author Marcel Stoepker
 */
class GameOverview extends View{

	//var connection : Connection; 
	public var vn : String;
	public var role : String;
	public var roleTextfield: TextField = new TextField();
	private var resultset : ResultSet;
	public function new(vn:String,set:Int,player:Int){
		super(vn);
		viewName = vn;
		getDBData(set,player);
		InitializeRoleTextfield();
	}
	
	public function getDBData(choosenSet:Int,choosenPlayer:Int):Void{ 
		var set : String = "set" + choosenSet;
		var connection = Sqlite.open("database/BucaneersTestDB.db");
		resultset = connection.request("SELECT role from "+set+" Where playerID = "+choosenPlayer+"");
		
		for (row in resultset) {
			trace(row.role);
			role = row.role;	
		}
	
		connection.close;
	}
	
	public function InitializeRoleTextfield(){
		roleTextfield.text = "Your role is: " + role +" !";
		roleTextfield.x = 500;
		roleTextfield.y = 500;
		roleTextfield.width =  300;
		addChild(roleTextfield);
	}
	
	public override function removeView(){
		removeChild(roleTextfield);
		removeChild(backButton);
		removeChild(titleTextField);
	}
	
	public override function addView() {
		addChild(roleTextfield);
		addChild(backButton);
		addChild(titleTextField);
		initializeTitleText();
	}
}