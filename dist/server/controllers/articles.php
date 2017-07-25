<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller($page, $per_page, $search = '') {
	$posts = getPosts(1, $page, $per_page);

	$xml = createRootNode();

	session_start();

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}

	if ($posts) {
		FulfillEach($xml->addChild('posts'), $posts);
	}
	
	return $xml;
}


?>