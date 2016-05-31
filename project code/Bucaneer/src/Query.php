<?php

public function databaseConnect(){
	$hostname = "localhost";
	$username = "";
	$password = "";

	// Create connection
	$conn = mysqli_connect($hostname, $username, $password) 

	// Check connection
	if ($conn->connect_error){
		die("Connection failed: " . $conn->connect_error);
	}else{
		echo "Connected successfully";
	}

	$selected = mysqli_select_db("Bucanneers",$conn)
		or die("Could not select Bucanneers");
}

public function databaseClose(){
	mysqli_close($conn);
}

public function sendQuery(){
	databaseConnect();
	
	$query = "SELECT * FROM player";
	
	databaseClose();
}

public function convertToJson($string) {
	String json_encode($string);
}

?> 
