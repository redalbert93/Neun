<?php

	define("ENVIRONMENT", "development");

	date_default_timezone_set('UTC');

	include('connection.php');
	include('router.php');

	if ($connection->error) {
		http_response_code(500);
		require('controllers/error.php');
		ErrController(500, 'ERRORE INTERNO DEL SERVER. Non è stato possibile stabilire una connessione con il Database. Riprova più tardi');
		exit();
	} else {

		//SET HTTP HEADER
		header('Content-type: text/xml');

		if(!isset($_SESSION['log'])) 
			$_SESSION['log']=0; // Assegnazione per il primo accesso al sito

		if ($_GET)
			route($_GET, false);
		else if ($_POST) {
			route($_POST, false);
		} else {
			route(array(), false);
		}
	}


?>