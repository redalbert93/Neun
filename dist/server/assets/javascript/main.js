//Manage pagination
if (document.getElementById('pagination') && typeof XSLTProcessor != 'undefined') {

	document.getElementById('pagination').style.display = 'inline-block';

	//remove non ajax button
	if (document.getElementById('pagination_nojs'))
		document.getElementById('pagination_nojs').parentNode.removeChild(document.getElementById('pagination_nojs'));

	//AJAX IMPLEMENTATION FOR DEVICE THAT SUPPORT JAVASCRIPT

	//Declare application configuration
	var NEUN = {
		articles_page: 1,
		articles_per_page: 15
	};


	function load(filename) {

	if (window.ActiveXObject)
	  xhttp = new ActiveXObject("Msxml2.XMLHTTP");
	else
	  xhttp = new XMLHttpRequest();

		xhttp.open("GET", filename, false);
		try {
			xhttp.responseType = "msxml-document";
		} catch(err) {} // Helping IE11
		
		xhttp.send("");
		return xhttp.responseXML;
	}

	function loadMorePosts() {

		//backup original text;
		var b = document.getElementById('pagination').innerHTML;
		document.getElementById('pagination').innerHTML = 'Caricamento..';

		xml = load("/api.php?p=/articoli&page="+NEUN.articles_page+"&per_page="+NEUN.articles_per_page);
		xsl = load("/views/post-partial.xsl");

		//move cursor to next page
		NEUN.articles_page++;

		var targetElement = document.getElementById("articoli");

		//Fix for internet explorer (as recommended by w3c)
		if (window.ActiveXObject || xhttp.responseType == "msxml-document") {
			a = xml.transformNode(xsl);
			targetElement.innerHTML = targetElement.innerHTML + a;
		} 
		else if (document.implementation && document.implementation.createDocument) {
			//this avoid also MXSS
			xsltProcessor = new XSLTProcessor();
			xsltProcessor.importStylesheet(xsl);
			resultDocument = xsltProcessor.transformToFragment(xml, document);
			targetElement.appendChild(resultDocument);
		}

		//reset original text
		document.getElementById('pagination').innerHTML =  b;

		//if there are no more posts
		if (xml.getElementsByTagName('entry').length < NEUN.articles_per_page) {
			document.getElementById('pagination').style.display = 'none';
			return;
		}
	}

}




