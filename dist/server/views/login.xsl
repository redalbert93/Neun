<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xml">
  <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="no" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
<head>
  <title>Login - NEUN WEBSITE</title>
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

      <form id="login" method="post" >
        <fieldset class="loginFieldSet">

          <a href="#usernameLogin" class="invisible">Modulo di accesso al sito internet. Inserisci le tue credenziali per continuare. Gli utenti registrati possono inserire commenti e restare aggiornati sui contenuti più recenti.</a>

          <p>Accedi a NEUN per inserire commenti e restare aggiornato sui contenuti più recenti.</p>

          <legend>Acceso a NEUN</legend>

          <label id="usernameLabel" for="usernameLogin">Username</label>

          <input type="text" name="username" title="username" aria-labelledby="usernameLabel" id="usernameLogin">

          </input>

          <label for="passwordLogin">Password</label>

          <input type="password"  name="password" id="passwordLogin">

          </input>

          <div class="alert danger hidden" id="errorLoginJs"></div>

          <xsl:if test="root/error">
            <div class="alert danger" id="errorLoginServer">
              <xsl:value-of select="root/error"/>
            </div>
          </xsl:if>

          <input id="submitButtonLogin" class="button" type="submit" value="Accedi in Neun" aria-describedby="loginInfo"/>

          <span id="loginInfo" class="invisible">Premi invio per inviare il modulo.</span>

        </fieldset>
      </form>

      <div class="small-footer">
          <a href="?p=/signup">Crea un account</a> &#8226;
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

  <script src="assets/javascript/login.js" type="text/javascript"></script>

</body>
</html>

 </xsl:template>
</xsl:stylesheet>