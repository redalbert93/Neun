<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller($page, $per_page) {

	$xml = createRootNode();

	session_start();

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}


	$posts = getPosts(1, $page, $per_page);


	$h_posts = getPosts(1, 0, 1);
	$p_posts = getPopularPosts(1);
	$categories = getCategories();
	$constants = getHomepageConstants();


	


	if ($constants) {
		Fulfill($xml->addChild('constants'), $constants->fetch_assoc());
	}

	Fulfill($xml->addChild('highlight'), $h_posts->fetch_assoc());
	
	if ($posts) {
		FulfillEach($xml->addChild('posts'), $posts);

		$xml->addChild('p_page', $page - 1);
		$xml->addChild('page', $page + 1);


		if ($posts->num_rows < $per_page) {
			$xml->addChild('finish', true);
		} 
	}

	if ($p_posts) {
		FulfillEach($xml->addChild('popular'), $p_posts);
	}

	FulfillEach($xml->addChild('categories'), $categories);
	

	return $xml;
	

}


?>