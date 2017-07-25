<?php

require('getters.php');
require('xml-utils.php');

function controller() {



 	$xml = createRootNode();
	// $xml = new SimpleXMLElement("<?xml version=\"1.0\"? ><root></root>");
	session_start();
	if(!isset($_SESSION['log'])) $_SESSION['log']=0; // Assegnazione per il primo accesso al sito

	if($_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}
	// 
	// $unome=$_POST["Nome"];
	// $ucognome=$_POST["Cognome"];
	// $utipo=$_POST["Tipo"];

	if ($_SESSION['log'] == 3) {


		if(isset($_POST['upgrade'])){
			//se viene premuto submit3
			$uid=$_POST["UserID"];
			$query="UPDATE Utente SET Tipo='editore' WHERE UserID='$uid'";
			$result = mysqli_query($GLOBALS['$connection']->instance,$query);
			$xml->addChild("updated", "true");
		}

		if(isset($_POST['delete'])){
			//se viene premuto submit3
			$uid=$_POST["UserID"];
			$query="DELETE from Utente WHERE UserID='$uid'";
			$result = mysqli_query($GLOBALS['$connection']->instance,$query);
			$xml->addChild("deleted", "true");
		}

		if(isset($_POST['downgrade'])){
			//se viene premuto submit3
			$uid=$_POST["UserID"];
			$query="UPDATE Utente SET Tipo='user' WHERE UserID='$uid'";
			$result = mysqli_query($GLOBALS['$connection']->instance,$query);
			$xml->addChild("updated", "true");
		}



		$user = mysqli_query($GLOBALS['$connection']->instance, "SELECT * FROM Utente");
		
	 	FulfillEach($xml->addChild('users'), $user);

 	}


	return $xml;
}
?>
