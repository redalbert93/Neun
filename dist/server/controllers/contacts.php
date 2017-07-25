<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller() {

	$xml = createRootNode();

	session_start();

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}

	if (isset($_POST['submit'])) {

		if (!isset($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
			//Here you should send email
			$xml->addChild("error", "Inserisci un indirizzo email valido");
		} else if (!isset($_POST['content']) || strlen($_POST['content']) < 100) {
			$xml->addChild("error", "Inserisci un contenuto valido. Deve essere più lungo di 140 caratteri.");
		} else {
			//Here you should send an email to the admin. Disabled for now
			$xml->addChild("success", "Richiesta inoltrata con successo. Abbiamo avvisato gli amministratori della tua richiesta.");
		}
	}

	return $xml;
}


?>