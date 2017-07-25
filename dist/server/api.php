<?php

	define("ENVIRONMENT", "development");

	include('connection.php');
	include('router.php');

	if ($connection->error) {
		http_response_code(500);
		require('controllers/error.php');
		ErrController(500, 'ERRORE INTERNO DEL SERVER. Non è stato possibile stabilire una connessione con il Database. Riprova più tardi');
		exit();
	} else {

		//SET HTTP HEADER
		header('Content-type: application/xml');
		route($_GET, true);
	}


?>