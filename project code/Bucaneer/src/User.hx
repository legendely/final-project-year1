package src;

/**
 * ...
 * @author Marcel Stoepker
 */
class User{

	public var userId : Int = null;
	public var playerName : String = null;
	public var playerRole : String = null;
	
	public function new(playerNameInput : String){
		playerName = playerNameInput;	
		playerRole = getPlayerRole();
	}
	
	// This function will get the player Id from the database.
	public function getPlayerId(){
		var tempQuery : String = "SELECT id FROM player WHERE name =="+playerName+";";
		var queryOutcome : String = ""; 
		return queryOutcome;
	}
	
	// This funcion will get the player role from the database.
	public function getPlayerRole(){
		var tempQuery : String = "SELECT role FROM player WHERE id ==" + userId + ";";
		var queryOutcome : String = ""; 
		return queryOutcome;
	}
	
	
	
}