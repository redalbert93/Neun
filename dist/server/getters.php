<?php



function getUserByUsername($username) {
	$query = "SELECT U.Username, U.UserID, U.Tipo FROM Utente U WHERE U.Username = '$username'";
	$result = mysqli_query($GLOBALS['$connection']->instance, $query);
	return mysqli_fetch_array($result);
}

function getAllPosts() {
	return mysqli_query($GLOBALS['$connection']->instance, "SELECT * FROM Post ORDER BY DataSalvataggio DESC");
}

function getAllComments($post_id) {
	return mysqli_query($GLOBALS['$connection']->instance, "SELECT u.Username, c.Contenuto  FROM Utente u JOIN Commenti c WHERE u.UserID=c.UserID AND c.PostID='$post_id'");
}

function getAllPostsOfUser($id) {
	return mysqli_query($GLOBALS['$connection']->instance, "SELECT * FROM Post WHERE UserID='$id'");
}

function getPosts($published, $page = 0, $per_page = 15, $search = '', $search_param='', $category='') { 


	$start = $page*$per_page;
	$end = $start+$per_page;


	$categoryCondition = 'WHERE';
	$searchCondition = '';

	if ($search && $search_param) {
		$searchCondition = "AND a.$search_param LIKE '%$search%'";
	}

	$query = "SELECT a.PreviewTitolo, a.Slug, a.LinkThumbail, a.LinkCopertina, a.Titolo, a.SottoTitolo, a.PreviewSottotitolo, b.path Thumbail, c.path Copertina, b.Titolo ThumbailAlt, c.Titolo CopertinaAlt FROM Post a LEFT JOIN Immagini b ON (a.Thumbail = b.ImageID) LEFT JOIN Immagini c ON (a.Copertina = c.ImageID) WHERE Pubblico = $published $searchCondition ORDER BY DataPubblicazione DESC LIMIT $start, $per_page";

	if ($category != '') {
		$query  = "SELECT a.PreviewTitolo, a.LinkThumbail, a.LinkCopertina, a.Slug, a.Titolo, a.SottoTitolo, a.PreviewSottotitolo, b.path Thumbail, c.path Copertina, b.Titolo ThumbailAlt, c.Titolo CopertinaAlt FROM Post a LEFT JOIN Immagini b ON (a.Thumbail = b.ImageID) LEFT JOIN Immagini c ON (a.Copertina = c.ImageID) WHERE a.PostID IN (SELECT s.postID from PostCategorie s where s.Categoria = $category) AND Pubblico = $published $searchCondition ORDER BY DataPubblicazione DESC LIMIT $start, $per_page";
	}

	$result = $GLOBALS['$connection']->instance->query($query);

	if ($result && $result->num_rows === 0) {
		return false;
	} else {
		return $result;
	}
}

function getPostById($resource_slug, $published) {
	$result = $GLOBALS['$connection']->instance->query("SELECT a.LinkThumbail, a.LinkCopertina, a.PostID, a.DataDisplay, a.PreviewTitolo, a.Titolo, a.SottoTitolo, a.Contenuto, a.Autore, b.path Thumbail, c.path Copertina, b.Titolo ThumbailAlt, c.Titolo CopertinaAlt FROM Post a LEFT JOIN Immagini b ON (a.Thumbail = b.ImageID) LEFT JOIN Immagini c ON (a.Copertina = c.ImageID) WHERE Pubblico = $published AND Slug = '$resource_slug' ORDER BY DataPubblicazione DESC LIMIT 16");

	if ($result && $result->num_rows === 0) {
		return false;
	} else {
		return $result;
	}
}

function getById($id) {
	return $GLOBALS['$connection']->instance->query("SELECT * FROM Post WHERE PostID = $id");
}

function getHomepageConstants() {
	return $GLOBALS['$connection']->instance->query("SELECT * FROM Constants WHERE version='it'");
}

function getPopularPosts($published, $per_page=6) { 

	$result = $GLOBALS['$connection']->instance->query("SELECT a.PreviewTitolo, a.LinkCopertina, a.LinkThumbail, a.Slug, a.Titolo, a.SottoTitolo, a.PreviewSottotitolo, b.path Thumbail, c.path Copertina, b.Titolo ThumbailAlt, c.Titolo CopertinaAlt FROM PopularPosts d INNER JOIN Post a ON (a.PostID = d.PostID) LEFT JOIN Immagini b ON (a.Thumbail = b.ImageID) LEFT JOIN Immagini c ON (a.Copertina = c.ImageID) WHERE Pubblico = $published ORDER BY DataPubblicazione DESC LIMIT $per_page");

	if ($result && $result->num_rows === 0) {
		return false;
	} else {
		return $result;
	}
}

function getCategories() { 
  return $GLOBALS['$connection']->instance->query("SELECT * FROM Categorie");
}

function getCategory($id) { 
  return $GLOBALS['$connection']->instance->query("SELECT Categoria FROM Categorie WHERE CategoryID = $id");
}

function getUsersEditors($page = 0, $per_page = 8) { 
  return $GLOBALS['$connection']->instance->query("SELECT * FROM UTENTE WHERE Tipo = 'admin' OR Tipo = 'editore' LIMIT $page, $per_page");
}

function getPostsByUser($user_id, $n = 3) { 
  return $GLOBALS['$connection']->instance->query("SELECT a.PreviewTitolo, a.LinkCopertina, a.LinkThumbail, a.Slug, a.Titolo, a.SottoTitolo, a.PreviewSottotitolo, b.path Thumbail, c.path Copertina, b.Titolo ThumbailAlt, c.Titolo CopertinaAlt FROM Post a LEFT JOIN Immagini b ON (a.Thumbail = b.ImageID) LEFT JOIN Immagini c ON (a.Copertina = c.ImageID) WHERE UserID = $user_id ORDER BY DataPubblicazione DESC LIMIT $n");
}


?>