<?php 
/***** ERROR CONTROLLER **********/

require_once('xml-utils.php');

function ErrController($errorCode, $errorMsg) {
	$xml = createRootNode();
	$xml->addChild('errorcode', $errorCode);
	$xml->addChild('errormsg', $errorMsg);
	$xsl = new DOMDocument;
	$aux = new XSLTProcessor;
	$xsl->load('./views/error.xsl');
	$aux->importStyleSheet($xsl);

	session_start();

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}


	echo($aux->transformToXML($xml));
}


?>