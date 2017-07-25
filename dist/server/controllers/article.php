<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller($post_id) {

	$xml = createRootNode();

	session_start();

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}

	

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}


	$post = getPostById($post_id, 1);
	$p_posts = getPopularPosts(1);
	

	if ($post) {
		Fulfill($xml->addChild('post'), $post->fetch_assoc());
		stripslashes($xml->post->Contenuto);
	}

	else {
		//handle exception
	}

	if ($p_posts) {
		FulfillEach($xml->addChild('posts'), $p_posts);
	}

	if (isset($_POST['Contenuto'])) {
		if (strlen($_POST['Contenuto']) < 140) {
			$xml->addChild('error', 'Inserisci almeno 140 caratteri');
		} else {
			$Contenuto = $_POST['Contenuto']; 
			$query="INSERT INTO Commenti( PostID, UserID, Contenuto, DataOra) VALUES (".$xml->post->PostID.", '".$_SESSION['idUtente']."', '$Contenuto', '1000-01-01 00:00:00')";
			$result = mysqli_query($GLOBALS['$connection']->instance,$query);  	
			$xml->addChild('success', 'true');
		}
	}

	$comments = getAllComments($xml->post->PostID);
	if ($comments)
		FulfillEach($xml->addChild('comment'), $comments); 

	return $xml;	
}


?>