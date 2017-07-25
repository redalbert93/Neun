<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller() {

	$xml = createRootNode();

	session_start();

	if(!isset($_SESSION['log'])) $_SESSION['log']=0; 

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}

	if(isset($_POST["username"]) && isset($_POST["password"])) {

		$username=htmlentities($_POST["username"]);
		$password=htmlentities($_POST["password"]);

		$usr = getUserByUsername($username);

		$username2 = $usr[0];
		$idUtente =  $usr[1];
		$tipo = $usr[2];

		//compare passwords
		$query = "SELECT U.Password, U.Nome, U.Cognome FROM Utente U WHERE U.Password = MD5('$password') AND U.Username = '$username2'";
		$result = $GLOBALS['$connection']->instance->query($query)->fetch_assoc();

		$name = $result["Nome"];
		$last_name = $result["Cognome"];
		$pwd = $result["Password"];

		if ($username == $username2 && md5($password) == $pwd) {

			if($tipo == 'admin')
				$_SESSION['log']=3;
			else if($tipo == 'editore')
				$_SESSION['log']=2;
			else if($tipo == 'user')
				$_SESSION['log']=1;
			else
				$_SESSION['log']=0;
	
			//set session
			$_SESSION['utente']   = $username;
			$_SESSION['nome_completo'] = $name." ".$last_name;
			$_SESSION['idUtente'] = $idUtente;
			
			header('Location: /');
			exit();
			return;
		} else {
			$xml->addChild('error', 'Le credenziali non sono corrette');
		}


	}

	
	return $xml;
}


?>