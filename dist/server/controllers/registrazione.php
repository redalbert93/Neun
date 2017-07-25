<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller() {

	$xml = createRootNode();

	session_start();

	if(!isset($_SESSION['log']) || $_SESSION['log'] === 0) {
		$_SESSION['log'] = 0; // Assegnazione per il primo accesso al sito
		$xml->addChild('session', 0);
	}

	if($_SESSION['log'] > 0){
		$xml->addChild('session', 1);
		$xml->addChild('user', $_SESSION['utente']);
		header("Location: /");
		return;
	}
	else{

		

		if($_POST){

			/* CONTENUTO */	
			if(isset($_POST['username']) && 
				$_POST['username'] &&
				isset($_POST['password']) && 
				$_POST['password'] &&
				isset($_POST['password_repeat']) && 
				$_POST['password_repeat'] == $_POST['password']  && 
				strlen($_POST['password']) > 4 && 
				isset($_POST['nome']) && 
				$_POST['nome'] &&
				isset($_POST['cognome'])&&
				$_POST['cognome']) {

				$username=htmlentities($_POST["username"]);
				$password=htmlentities($_POST["password"]);
				$nome=htmlentities($_POST["nome"]);
				$cognome=htmlentities($_POST["cognome"]);
				$pass=md5($password);

				//richiedere al db se ci sn l md5 della password e l username
				$query = "SELECT U.Username FROM Utente U WHERE U.Username = '$username'";
				$result = mysqli_query($GLOBALS['$connection']->instance,$query);
				$record = mysqli_fetch_array($result);
				if($record){
					$xml->addChild('error', 'Username gi&#224; utilizzato');
					//inserire link alla login
				} else {
					$query="INSERT INTO Utente (UserID, Facebook_link, Username, Password, Nome, Cognome, Tipo, Immagine) VALUES (null, 'https://www.facebook.com/neungiurofrate/', '$username', '$pass', '$nome', '$cognome', default, 20)";
					$result = mysqli_query($GLOBALS['$connection']->instance, $query);

					if(!($result)){
					$xml->addChild('error', 'Registrazione non riuscita');
					} else {
						$xml->addChild('success', 'Registrazione avvenuta con successo');						
					}
				}

			} else{

				if(!isset($_POST["nome"]) || !$_POST["nome"]){
					$xml->addChild('error', 'Inserisci il tuo nome.');
				}

				else if(!isset($_POST["cognome"]) || !$_POST["cognome"]){
					$xml->addChild('error', 'Inserisci il tuo cognome.');
				}

				else if(!isset($_POST["nome"]) || !$_POST["username"]){
					$xml->addChild('error', 'Inserisci un nome utente per registrarti.');
				}

				else if(!isset($_POST["password"]) || !$_POST["password"]){
					$xml->addChild('error','Inserisci una password valida per resgistrarti.');
				}

				else if(isset($_POST["password"]) && strlen($_POST['password']) < 4){
					$xml->addChild('error','La tua password deve essere lunga almeno 4 caratteri');
				}

				else if (isset($_POST['password']) && isset($_POST['password_repeat']) && $_POST['password_repeat'] == $_POST['password']) {
					$xml->addChild('error', 'Le due password devono coincidere');
				}
			}
		}
	}
	
	return $xml;
}


?>