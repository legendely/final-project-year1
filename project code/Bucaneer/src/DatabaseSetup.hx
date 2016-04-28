package src;

/**
 * ...
 * @author Marcel Stoepker
 */
class DatabaseSetup{

	// don't forget escape at userinput password!!!!!!!!!!!!!!!!!!!!!
	// database connect info
	private var defaultHost : String = "localhost";
	private var defaultPort : Int = 3306;
	private var defaultUser : String = "root";
	private var defaultPassword : String = "";
	private var defaultSocket : String = null;
	private var defaultDatabaseName: String = "Bucaneers";
	
	public var databaseConnection = neko.db.Mysql.connect({
		host : defaultHost,
		port : defaultPort,
        user : defaultUser,
        pass : defaultPassword,
        socket : defaultSocket,
        database : defaultDatabaseName
	})
	
	public function new(){
		
	}
	
	public function QUERYFUNCTION(): String{
		var query : String = "SELECT * FROM 'player'";
		return query;
	}
	
}