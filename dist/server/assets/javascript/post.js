(function() {

	function end(ev) {
		ev.preventDefault();
	}

	document.getElementById('submitButtonComment').addEventListener('click', function(ev) {

		var content = document.getElementById('comment');
		var err = document.getElementById('errorJs');

		document.getElementById('submitButtonComment').setAttribute('aria-describedby', 'errorJs');

		if (document.getElementById('errorLoginServer'))
			document.getElementById('errorLoginServer').style.display = 'none';

		if (document.getElementById('successError'))
			document.getElementById('successError').style.display = 'none';

		if (content.value.length < 140) {
			err.innerHTML = "Inserisci almeno 140 caratteri.\n";
			err.style.display = 'block';
			content.setAttribute('aria-invalid', true);
			return end(ev);
		}
	});

})();


