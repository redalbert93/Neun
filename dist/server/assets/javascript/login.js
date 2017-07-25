(function() {

	function end(ev) {
		ev.preventDefault();
	}


	document.getElementById('submitButtonLogin').addEventListener('click', function(ev) {

		var psw = document.getElementById('passwordLogin');
		var usr = document.getElementById('usernameLogin');
		var err = document.getElementById('errorLoginJs');

		document.getElementById('submitButtonLogin').setAttribute('aria-describedby', 'errorLoginJs');

		if (document.getElementById('errorLoginServer'))
			document.getElementById('errorLoginServer').style.display = 'none';

		
	
		if (!usr.value) {
			err.innerHTML = "Inserisci il tuo username per poter accedere.\n";
			err.style.display = 'block';
			usr.setAttribute('aria-invalid', true);
			return end(ev);
		}

		if (!psw.value) {
			err.innerHTML = "Inserisci la tua password per poter accedere.\n";
			err.style.display = 'block';
			psw.setAttribute('aria-invalid', true);
			return end(ev);
		}

		if (psw.value && psw.value.length < 4) {
			err.innerHTML = "La tua password è necessariamente più lunga di 4 caratteri. Correggila.\n";
			psw.setAttribute('aria-invalid', true);
			return end(ev);
		}

	});





})();


