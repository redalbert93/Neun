<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xml">
  <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="no" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
<head>
  <title>Registrazione - NEUN WEBSITE</title>
  <link href="assets/css/common.css" rel="stylesheet" type="text/css" />
  <link href="assets/css/mobile.css" rel="stylesheet" type="text/css" />
  <link href="assets/css/tablet.css" rel="stylesheet" type="text/css" />
  <link href="assets/css/desktop.css" rel="stylesheet" type="text/css" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
  <div class="login-box">
    
    <div class="login-form">

      <a href="/" class="logo">
        <img src="assets/images/logo.png" alt="Primo elemento della pagina: Logo di Neun"/>
      </a>

      <form id="signup" method="post" >
        <fieldset class="loginFieldSet">

          <a href="#usernameLogin" class="invisible">Modulo di registrazione al sito internet. Scegli le tue credenziali per registrarti. Gli utenti registrati possono inserire commenti e restare aggiornati sui contenuti più recenti.</a>

          <span id="loginInfo" class="invisible">Premi invio per inviare il modulo e registrarti.</span>

          <legend>Registrati a NEUN </legend>

          <label for="nameInput">Nome</label>
          <input type="text"  name="nome" title="username" id="nameInput"/>

          <label for="nameInput">Cognome</label>
          <input type="text" name="cognome" title="username" id="nameInput"/>

          <label id="usernameLabel" for="usernameLogin">Nome utente</label>
          <span id="usernameMeaning">Scegli un nome con cui utilizzerai NEUN. Puoi scegliere il tuo nome, un soprannome o un nickname.</span>

          <input type="text" name="username" title="username" id="usernameLogin" aria-describedby="usernameMeaning"/>

          <label for="passwordLogin">Password</label>

          <span id="passwordMeaning">La password deve essere lunga almeno 5 caratteri.</span>

          <input type="password" name="password" id="passwordLogin" aria-describedby="passwordMeaning"/>

          
          <label for="passwordLogin2">Ripeti password</label>

          <input type="password" name="password_repeat" id="passwordLogin2"/>

          <div class="alert danger hidden" id="errorLoginJs"></div>

          <xsl:if test="root/error">
            <div class="alert danger" id="errorLoginServer">
              <xsl:value-of select="root/error"/>
            </div>
          </xsl:if>

          <xsl:if test="root/success">
            <div class="alert success">Il tuo account è stato registrato con successo. Accedi dall'area di login</div>
          </xsl:if>

          <input id="submitButtonLogin" class="button" type="submit" value="Accedi in Neun" aria-describedby="loginInfo">Registrati</input>

        </fieldset>
      </form>

      <div class="small-footer">
          <a href="?p=/login">Accedi</a> &#8226;
          <a href="/"> Vai alla Home</a> &#8226;
          <a href="?p=/conttatti">Contattaci</a>
      </div>
    </div>

  </div>


  <xsl:if test="root/livereloader">
    <script type="text/javascript">     
      <xsl:value-of select="root/livereloader"/>
    </script>
  </xsl:if>

  <script src="assets/javascript/signup.js" type="text/javascript"></script>

</body>
</html>

 </xsl:template>
</xsl:stylesheet>