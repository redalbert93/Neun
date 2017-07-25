(function() {

	function end(ev) {
		ev.preventDefault();
	}

	function validateEmail(email) {
	    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	}

	document.getElementById('submitButton').addEventListener('click', function(ev) {

		var cnt = document.getElementById('content');
		var usr = document.getElementById('email');
		var err = document.getElementById('errorJs');

		document.getElementById('submitButton').setAttribute('aria-describedby', 'errorLoginJs');

		if (document.getElementById('errorServer'))
			document.getElementById('errorServer').style.display = 'none';

		if (!validateEmail(usr.value)) {
			err.innerHTML = "Inserisci un indirizzo email valido.\n";
			err.style.display = 'block';
			usr.setAttribute('aria-invalid', true);
			return end(ev);
		}

		if (cnt.value.length < 100) {
			err.innerHTML = "Inserisci un contenuto di almeno 100 caratteri.\n";
			err.style.display = 'block';
			cnt.setAttribute('aria-invalid', true);
			return end(ev);
		}


	});
})();


