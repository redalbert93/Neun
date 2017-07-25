<?php 
/***** HOMEPAGE CONTROLLER **********/
require('getters.php');
require('xml-utils.php');

function controller() {

	session_start();

	$xml = createRootNode();

	if(isset($_SESSION['log']) && $_SESSION['log'] > 1){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	} else {
		header('Location: /?p=/login');
		return;
	}

	if (isset($_GET["created"])) {
		$xml->addChild("created", "true");
	}

	if (isset($_GET["published"])) {
		$xml->addChild("published", "true");
	}

	if (isset($_GET["deleted"])) {
		$xml->addChild("deleted", "true");
	}


	if(!isset($_SESSION['log'])) $_SESSION['log']=0; // Assegnazione per il primo accesso al sito

	if($_SESSION['log']==3){
		//sei un admin
		FulfillEach($xml->addChild('posts'), getAllPosts());
	}
	else if($_SESSION['log']==2){
		//sei un editore
		FulfillEach($xml->addChild('posts'), getAllPostsOfUser($_SESSION['idUtente']));
	}

	return $xml;
}


?>