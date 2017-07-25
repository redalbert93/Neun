<?php 
/***** HOMEPAGE CONTROLLER **********/


require('getters.php');
require('xml-utils.php');

function controller($page, $per_page, $search='', $search_param='', $category='') {
	$posts = getPosts(1, $page, $per_page);

	if ($search || $category) {
		$s_posts = getPosts(1, $page, $per_page, $search, $search_param, $category);
	}

	$categories = getCategories();
	$p_posts = getPopularPosts(1, 8);
	$users = getUsersEditors(0, 8);

	// $userTarget = getPostsByUser()

	$xml = createRootNode();

	session_start();

	if(isset($_SESSION['log']) && $_SESSION['log'] > 0){
		$xml->addChild('session', $_SESSION['log']);
		$xml->addChild('user', $_SESSION['utente']);
	}


	if (($search && $s_posts) || ($category && $s_posts)) {
		FulfillEach($xml->addChild('search'), $s_posts);
	}

	if ($search && $search_param) {
		$xml->addChild('searchParam', $search_param);
		$xml->addChild('searchValue', $search);
	}

	if ($category) {
		$category_name = getCategory($category);
		$xml->addChild('category', $category_name->fetch_assoc()['Categoria']);
	}


	if ($users) {
		FulfillEach($xml->addChild('users'), $users);

		foreach ($xml->users->entry as $key => $value) {
			$user_posts = getPostsByUser($value->UserID);
			FulfillEach($value->addChild('posts'), $user_posts);
		}

	}

	// if ($posts) {
	// 	Fulfill($xml->addChild('highlight_s'), $posts->fetch_assoc());
	// 	Fulfill($xml->addChild('highlight_d'), $posts->fetch_assoc());
	// 	FulfillEach($xml->addChild('posts'), $posts);
	// }

	if ($p_posts) {
		FulfillEach($xml->addChild('popular'), $p_posts);
	}

	FulfillEach($xml->addChild('categories'), $categories);
	
	return $xml;
}


?>