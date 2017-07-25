<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller() {

	$xml = createRootNode();

	session_start();

	if(!isset($_SESSION['log'])) 
		$_SESSION['log']=0; // Assegnazione per il primo accesso al sito

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}


	if($_SESSION['log'] > 0) {

		if (isset($_POST['submit'])) {

			if (!isset($_POST['title']) || !$_POST['title']) {
				$xml->addChild("error", "Inserisci un titolo per continuare");
			} else if (!isset($_POST['ContenutoPlain']) || !$_POST['ContenutoPlain']) {
				$xml->addChild("error", "Inserisci del contenuto per continuare");
			} else {

				$titolo = $_POST['title'];
				$contenuto =  MarkDownParser::render(strip_tags($_POST['ContenutoPlain']));
				$plain = $_POST['ContenutoPlain'];
				$autore = $_SESSION['nome_completo'];
				$id = $_SESSION['idUtente'];


				$query = "INSERT INTO Post (Titolo, UserID, Autore, Pubblico, Contenuto, ContenutoPlain) VALUES ('$titolo', $id, '$autore', 0, '$contenuto', '$plain')";

				$result = mysqli_query($GLOBALS['$connection']->instance,$query);  

				if ($result) {
					$xml->addChild("success", "true");
				} else {
					$xml->addChild("error", "Non è stato possibile aggiungere il tuo post");
				}
			}
		}

		if (isset($_POST['preview'])) {

			$xml->addChild("post");
			$xml->post->addChild("Titolo", htmlentities($_POST['title']));
			$xml->post->addChild("ContenutoPlain", $_POST['ContenutoPlain']);

			if (!isset($_POST['title']) || !$_POST['title']) {
				$xml->addChild("error", "Inserisci un titolo per continuare");
			} else if (!isset($_POST['ContenutoPlain']) || !$_POST['ContenutoPlain']) {
				$xml->addChild("error", "Inserisci del contenuto per continuare");
			} else {
				
				$xml->post->addChild("Contenuto", MarkDownParser::render(strip_tags($_POST['ContenutoPlain'])));
				$xml->post->addChild("ContenutoPlain", $_POST['ContenutoPlain']);
				$xml->post->addChild("DataDisplay", "23 Dicembre");
				$xml->post->addChild("Autore", htmlentities($_SESSION['nome_completo']));
			}
			 

			//Salvataggio
		}
	}
		//sei un admin o un editore
	// 	if (isset($_POST['submit1'])) {
	// 		$test_array = array(  
	// 			'Tipo' => $_POST['Tipo'],
	// 			'Titolo' => $_POST['Titolo'],
	// 			'Autore' =>  $_POST['Autore'],
	// 			'Contenuto' => $_POST['Contenuto'],
	// 			'Copertina' => $_POST['Copertina'],
	// 			'SearchEngineTitolo' => $_POST['SearchEngineTitolo'],
	// 			'SearchEngineDescrizione' => $_POST['SearchEngineDescrizione'],
	// 			'SearchEngineKeywords' => $_POST['SearchEngineKeywords'],
	// 			'FacebookTitolo' => $_POST['FacebookTitolo'],
	// 			'FacebookDescrizione' => $_POST['FacebookDescrizione'],
	// 			'FacebookImmagine' => $_POST['FacebookImmagine'],
	// 			'DataDisplay' => $_POST['DataDisplay'],
	// 			'Pubblico' => $_POST['Pubblico'],
	// 			'SottoTitolo' => $_POST['SottoTitolo'],
	// 			'Thumbail' => $_POST['Thumbail'],
	// 			'Lang' => $_POST['Lang'],
	// 			'Slug' => $_POST['Slug'],
	// 			'PreviewTitolo'=>$_POST['PreviewTitolo'],
	// 			'PreviewSottotitolo'=> $_POST['PreviewSottotitolo'],
	// 			'DataDisplayAlternative'=> $_POST['DataDisplayAlternative']
	// 		);
      
	// 		array_to_xml($test_array,$xml_data);
	// 		$result = $xml_data->asXML('ins-post.xml');
	// 		libxml_use_internal_errors(true); //http://php.net/manual/en/domdocument.schemavalidate.php
	// 		$prova=new DOMDocument();
	// 		$prova->load('ins-post.xml');

	// 		if (true || !$prova->schemaValidate('../models/ins-post.xsd')) {
	// 			print '<b>DOMDocument::schemaValidate() Generated Errors!</b>';
	// 			libxml_display_errors();
	// 		} else {
	// 			$UserID=$_SESSION['idUtente'];
	// 			$Tipo=$_POST['Tipo'];
	// 			$Titolo=$_POST['Titolo'];
	// 			$Autore=$_POST['Autore'];
	// 			$Contenuto=$_POST['Contenuto'];
	// 			$Copertina=$_POST['Copertina'];
	// 			$SearchEngineTitolo=$_POST['SearchEngineTitolo'];
	// 			$SearchEngineDescrizione= $_POST['SearchEngineDescrizione'];
	// 			$SearchEngineKeywords=$_POST['SearchEngineKeywords'];
	// 			$FacebookTitolo=$_POST['FacebookTitolo'];
	// 			$FacebookDescrizione=$_POST['FacebookDescrizione'];
	// 			$FacebookImmagine=$_POST['FacebookImmagine'];
	// 			$DataDisplay=$_POST['DataDisplay'];
	// 			$Pubblico=$_POST['Pubblico'];
	// 			$SottoTitolo=$_POST['SottoTitolo'];
	// 			$Thumbail=$_POST['Thumbail'];
	// 			$Lang=$_POST['Lang'];
	// 			$Slug = $_POST['Slug'];
	// 			$PreviewTitolo=$_POST['PreviewTitolo'];
	// 			$PreviewSottotitolo= $_POST['PreviewSottotitolo'];
	// 			$DataDisplayAlternative= $_POST['DataDisplayAlternative'];

	// 			$query="INSERT INTO Post (PostID, UserID, Tipo, Titolo, Autore, Contenuto, Copertina, SearchEngineTitolo, SearchEngineDescrizione, SearchEngineKeywords, FacebookTitolo, FacebookDescrizione, FacebookImmagine, DataSalvataggio, DataPubblicazione, DataDisplay, Pubblico, SottoTitolo, Thumbail, Lang, Slug, PreviewTitolo, PreviewSottotitolo, DataDisplayAlternative) VALUES (NULL, '$UserID', '$Tipo', '$Titolo', '$Autore', '$Contenuto', '$Copertina', '$SearchEngineTitolo', '$SearchEngineDescrizione', '$SearchEngineKeywords', '$FacebookTitolo', '$FacebookDescrizione', '$FacebookImmagine', NULL, NULL, '$DataDisplay', '$Pubblico', '$SottoTitolo', '$Thumbail', '$Lang', '$Slug', '$PreviewTitolo', '$PreviewSottotitolo', '$DataDisplayAlternative')";

	// 			$result = mysqli_query($GLOBALS['$connection']->instance,$query);  
	// 		}
	// 	}
		
	// }
	// else if($_SESSION['log']==1) {
	// 	//sei un utente
	// 	$xml->addChild('error', 'Impossibile modificare i Post poichè sei un utente');
	// }
	// else{ //$_SESSION['log']==0 //non sei loggato
	// 	header("Location: ?p=/login");
	// 	exit();
	// }

	return $xml;
}


?>