<?php 

	
function route($data, $api) {

	//Prepare document and processor
	$xsl = new DOMDocument('1.0', 'utf-8');
	$aux = new XSLTProcessor;

	if (!isset($data['p'])) {
		//If path is not defined we are at index page

		require('controllers/index.php');

		if (!$api) {
			$xsl->load('./views/index.xsl');
			$aux->importStyleSheet($xsl);

			$page = 0;
			$per_page = 15;

			if (isset($_GET['page']) && isset($_GET['per_page'])) {
				$page = $_GET['page'];
				$per_page = $_GET['per_page'];
			}

			echo($aux->transformToXML(controller($page, $per_page, '')));
		} else {
			echo controller()->asXML();
		}

	} else {
		//Otherwise we parse the URL
		$path_array = explode('/', $data['p']);

		switch($path_array[1]) {

			case 'contatti':
				require('controllers/contacts.php');
				$xsl->load('./views/contacts.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'login':
				require('controllers/login.php');
				$xsl->load('./views/login.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'dashboard':
				require('controllers/post-list.php');
				$xsl->load('./views/dashboard.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'purpose':
				require('controllers/purpose.php');
				$xsl->load('./views/purpose.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'modpost':
				require('controllers/mod-post.php');
				$xsl->load('./views/mod-post.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'norme':
				require('controllers/norme.php');
				$xsl->load('./views/norme.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'create':
				require('controllers/create.php');
				$xsl->load('./views/create-post.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'users':
				require('controllers/dashboard-users.php');
				$xsl->load('./views/dashboard-utenti.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'inscomment':
				require('controllers/ins-comment.php');
				$xsl->load('./views/ins-comment.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'dashboard':

				if (!isset($path_array[2])) {
					require('controllers/post-list.php');
					$xsl->load('./views/post-list.xsl');
					$aux->importStyleSheet($xsl);
					echo $aux->transformToXML(controller());
				} else {
					switch($path_array[2]) {
						case 'create':
							require('controllers/ins-post.php');
							$xsl->load('./views/ins-post.xsl');
							$aux->importStyleSheet($xsl);
							echo $aux->transformToXML(controller());
						break;
						default: 
							require('controllers/error.php');
							ErrController(404, "Pagina non trovata!");
						break;
					}
				}
			break;

			case 'signup':
				require('controllers/registrazione.php');
				$xsl->load('./views/signup.xsl');
				$aux->importStyleSheet($xsl);
				echo $aux->transformToXML(controller());
			break;

			case 'logout':

				session_start();
		    $sname=session_name();
		    session_destroy();
		    if (isset($_COOKIE[$sname])) {
		     setcookie($sname,'', time()-3600,'/');
		    }

		    header('Location: /');

			break;

			case 'articoli':
				$page = 0;
				$per_page = 15;
				$search = '';
				$search_param = '';
				$category = '';

				if (isset($_GET['page']) && isset($_GET['per_page'])) {
					$page = $_GET['page'];
					$per_page = $_GET['per_page'];
				}

				if (isset($_POST['search']) && isset($_POST['filter'])) {
					$search = $_POST['search'];
					$search_param = $_POST['filter'];
				}

				if (isset($_POST['category'])) {
					$category = $_POST['category'];
				}

				if (isset($_GET['category'])) {
					$category = $_GET['category'];
				}

				if (isset($path_array[2]) && !isset($path_array[3])) {
					
					require('controllers/article.php');
					
					if (!$api) {
						$xsl->load('./views/post.xsl');
						$aux->importStyleSheet($xsl);
						echo($aux->transformToXML(controller($path_array[2])));
					} else {
						echo controller($path_array[2])->asXML();
					}
			
				} else if (!isset($path_array[2])) {
					
					if (!$api) {
						require('controllers/articles-page.php');
						$xsl->load('./views/posts.xsl');
						$aux->importStyleSheet($xsl);

						echo($aux->transformToXML(controller($page, $per_page, $search, $search_param, $category)));

					} else {
						require('controllers/articles.php');
						echo controller($page, $per_page)->asXML();
					}
				}
			break;
			default: 
				require('controllers/error.php');
				ErrController(404, "Pagina non trovata!");
			break;
		}
	}	
}


?>