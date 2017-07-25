(function() {

	function end(ev) {
		ev.preventDefault();
	}

	document.getElementById('submitButtonLogin').addEventListener('click', function(ev) {

		var psw = document.getElementById('passwordLogin');
		var psw2 = document.getElementById('passwordLogin2');
		var usr = document.getElementById('usernameLogin');
		var err = document.getElementById('errorLoginJs');

		document.getElementById('submitButtonLogin').setAttribute('aria-describedby', 'errorLoginJs');

		if (document.getElementById('errorLoginServer'))
			document.getElementById('errorLoginServer').style.display = 'none';
		
		usr.setAttribute('aria-invalid', false);
		psw.setAttribute('aria-invalid', false);
		psw2.setAttribute('aria-invalid', false);

	
		if (!usr.value) {
			err.innerHTML = "Inserisci un nome utente per registrarti.\n";
			err.style.display = 'block';
			usr.setAttribute('aria-invalid', true);
			return end(ev);
		}

		if (!psw.value) {
			err.innerHTML = "Inserisci una password valida per accedere.";
			err.style.display = 'block';
			psw.setAttribute('aria-invalid', true);
			return end(ev);
		}

		if (psw.value != psw2.value) {
			err.innerHTML = "Le password devono coincidere.\n";
			err.style.display = 'block';
			psw2.setAttribute('aria-invalid', true);
			return end(ev);
		}

		if (psw.value && psw.value.length < 4) {
			err.innerHTML = "La password deve essere più lunga di 4 caratteri. Correggila.\n";
			psw.setAttribute('aria-invalid', true);
			return end(ev);
		}

	});





})();


