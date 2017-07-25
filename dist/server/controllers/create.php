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

	if($_SESSION['log'] > 1) {


		if (isset($_GET['id']) && isset($_GET['delete']) && $_SESSION['log'] == 3) {
			$id = $_GET['id'];
			$query = "DELETE FROM Post WHERE PostID='$id'";
			$result = mysqli_query($GLOBALS['$connection']->instance,$query);
			header("Location: /?p=/dashboard&deleted=true");
			return $xml;
		}

		if (isset($_GET['id']) && isset($_GET['delete']) && $_SESSION['log'] == 2 && false) {
			$userid = $_SESSION['idUtente'];
			$id = $_GET['id'];
			$query = "DELETE FROM Post WHERE PostID=$id AND UserID=$userid";
			$result = mysqli_query($GLOBALS['$connection']->instance,$query);
			header("Location: /?p=/dashboard&deleted=true");
			return $xml;
		}

		if (isset($_GET['id']) && isset($_GET['publish']) && $_SESSION['log'] == 3) {
			$id = $_GET['id'];
			$query = "UPDATE Post SET Pubblico = 1, DataPubblicazione = NOW() WHERE PostID= $id";



			$result = mysqli_query($GLOBALS['$connection']->instance,$query);


			echo $GLOBALS['$connection']->instance->error;
			header("Location: /?p=/dashboard&published=true");
			return $xml;
		}

		
		if (isset($_POST['submit']) || isset($_POST['preview'])) {

			if (!isset($_POST['Titolo']) || !$_POST['Titolo']) {
				$xml->addChild("error", "Inserisci un titolo per continuare");
			} else if (!isset($_POST['ContenutoPlain']) || !$_POST['ContenutoPlain']) {
				$xml->addChild("error", "Inserisci del contenuto per continuare");
			} else if (!isset($_POST['Slug']) || !$_POST['Slug']) {
				$xml->addChild("error", "Inserisci un frammento di URL valido per continuare");
			}else if (!isset($_POST['Autore']) || !$_POST['Autore']) {
				$xml->addChild("error", "Inserisci un autore per continuare");
			}else if (!isset($_POST['LinkCopertina']) || !$_POST['LinkCopertina']) {
				$xml->addChild("error", "Inserisci il link per l'immagine di copertina");
			} else if (!isset($_POST['LinkThumbail']) || !$_POST['LinkThumbail']) {
				$xml->addChild("error", "Inserisci il link per l'immagine di thumbail");
			}else {

				$titolo = strip_tags($_POST['Titolo']);
				$copertina = $_POST['LinkCopertina'];
				$thumbail = $_POST['LinkThumbail'];	
				$ptitolo = strip_tags($_POST['PreviewTitolo']);	
				$psottotitolo = strip_tags($_POST['PreviewSottotitolo']);	
				$contenutoplain = $_POST['ContenutoPlain'];
				$contenuto = addslashes(MarkDownParser::render(strip_tags($_POST['ContenutoPlain'])));
				$autore = strip_tags($_POST['Autore']);
				$data = strip_tags($_POST['DataDisplay']);
				$slug = strip_tags($_POST['Slug']);

				$xml->addChild("post");

				if (isset($_POST['submit'])) {

					$id = $_SESSION['idUtente'];

					if (isset($_POST['PostID']) && $_POST['PostID']) {
						$postid = $_POST['PostID'];
						
						if ($_SESSION['log'] == 3) {
							$query = "UPDATE Post SET Titolo = '$titolo', Slug = '$slug', Autore = '$autore', Contenuto = '$contenuto', ContenutoPlain = '$contenutoplain', LinkCopertina = '$copertina', LinkThumbail = '$thumbail', DataDisplay = '$data', PreviewTitolo = '$ptitolo', PreviewSottotitolo ='$psottotitolo' WHERE PostID = $postid ";
						} else if ($_SESSION['log'] == 2) {
							$query = "UPDATE Post SET Titolo = '$titolo', Slug = '$slug', Autore = '$autore', Contenuto = '$contenuto', ContenutoPlain = '$contenutoplain', LinkCopertina = '$copertina', LinkThumbail = '$thumbail', DataDisplay = '$data', PreviewTitolo = '$ptitolo', PreviewSottotitolo ='$psottotitolo' WHERE PostID = '$postid' AND UserID = '$id'";
						}

						$result = mysqli_query($GLOBALS['$connection']->instance,$query);

						if ($result) {
							$xml->addChild("updated", "true");
						} else {
							$xml->addChild("error", "Non è stato possibile aggiornare il tuo post".$GLOBALS['$connection']->instance->error);
						}
	
					} else {
						$id = $_SESSION['idUtente'];
						$query = "INSERT INTO Post (Slug, Titolo, UserID, Autore, Pubblico, Contenuto, ContenutoPlain, LinkCopertina, LinkThumbail, DataDisplay, PreviewTitolo, PreviewSottotitolo) VALUES ('$slug', '$titolo', $id, '$autore', 0, '$contenuto', '$contenutoplain', '$copertina', '$thumbail', '$data', '$ptitolo', '$psottotitolo')";
						$result = mysqli_query($GLOBALS['$connection']->instance,$query);

						$xml->post->addChild("Titolo", $titolo);  

						if ($result) {
							header("Location: /?p=/dashboard&created=true");
						} else {
							$xml->addChild("error", "Non è stato possibile aggiungere il tuo post");
						}
					}
				}


				if (isset($_POST['PostID']) && $_POST['PostID']) {
					$postid = $_POST['PostID'];
					$xml->post->addChild("PostID", $postid);
				}
				
				$xml->post->addChild("Titolo", $titolo);
				$xml->post->addChild("Slug", $slug);
				$xml->post->addChild("LinkCopertina", $copertina);
				$xml->post->addChild("LinkThumbail", $thumbail);
				$xml->post->addChild("PreviewTitolo", $ptitolo);
				$xml->post->addChild("PreviewSottotitolo", $psottotitolo);
				$xml->post->addChild("ContenutoPlain", $contenutoplain);
				$xml->post->addChild("Contenuto", stripslashes($contenuto));
				$xml->post->addChild("Autore", $autore);
				$xml->post->addChild("DataDisplay", $data);

				if (isset($_POST['preview'])) {
					$xml->addChild("preview", "true");
				}

				
			}
		} else if (isset($_GET['id'])) {
			$post = getById(intval($_GET['id']));

			if ($post) {
				Fulfill($xml->addChild('post'), $post->fetch_assoc());
			}
		}	

	}

	return $xml;
}


?>