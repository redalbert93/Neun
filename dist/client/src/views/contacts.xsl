<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xml">
  <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="no" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
      <head>
        <title>NEUN WEBSITE</title>
        <link href="assets/css/common.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/mobile.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/tablet.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/desktop.css" rel="stylesheet" type="text/css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      </head>  
      <body>
        <div class="section nav">
          <!-- <label for="menu-toggle"><img src="assets/images/menu.png" /></label> -->
          <label for="menu-toggle">&#9776;</label>
          <input type="checkbox" id="menu-toggle"/>

          <a href="/" class="logo">
            <img src="assets/images/logo.png" alt="Sito di Neun, Pagina principale"/>
          </a>

          <ul>
            <li><a href="?p=/articoli">Contenuti</a></li>
            <li><a href="?p=/norme">Regolamento</a></li>
            <li class="active"><a href="?p=/contatti">Contatti</a></li>
            <xsl:if test="root/session = 1">
              <li><a href="?p=/purpose">Proponi un articolo</a></li>
            </xsl:if>
            <xsl:if test="root/session = 2">
              <li><a href="?p=/dashboard">Il mio account editore</a></li>
            </xsl:if>
            <xsl:if test="root/session = 3">
              <li><a href="?p=/dashboard">Pannello di amministrazione</a></li>
            </xsl:if>                
          </ul>

        </div>

        <div class="section subnav">
          <h1>Contattaci</h1>
          
          <div class="contacts-left">
            <h2>Contatto Online</h2>
            <xsl:if test="root/success">
              <div class="alert success">
                <xsl:value-of select="root/success"/>
              </div>
            </xsl:if>
            <a href="#contatti" class="invisible">Modulo per contattare una persona fisica.</a>
            <p>Puoi utilizzare il modulo sottostante per contattarci direttamente attraverso il nostro sito internet</p>
            <form method="post" action="/?p=/contatti" id="contatti">
              <div>
                <label for="email">Indirizzo Email: </label>
                <input type="text" name="email" id="email"/>
              </div>
              <div>
                <label for="content">Messaggio: </label>
                <textarea name="content" cols="12" rows="4" id="content"></textarea>
              </div>
              <xsl:if test="root/error">
                <div class="alert danger" id="errorServer">
                  <xsl:value-of select="root/error"/>
                </div>
              </xsl:if>

              <div class="alert danger hidden" id="errorJs">
              </div>

              <xsl:if test="root/success">
                <div class="alert success">
                  <xsl:value-of select="root/success"/>
                </div>
              </xsl:if>
              <div>
                <input type="submit" class="button" name="submit" value="Invia modulo" id="submitButton"/>
              </div>
            </form>
          </div>

          <div class="contacts-right">
            <h2>Riferimenti</h2>
            <p>Puoi utilizzare i seguenti riferimenti per contattarci nel modo che ritieni più opprtuno.</p>
            <ul>
              <li><span>Telefono:</span> +39 049 5586 230</li>
              <li><span>Inidirzzo:</span> Via Milano 3, Brescia.</li>
              <li>Email:<xsl:text> </xsl:text> <a href="mailto:admin@neun.it">admin@neun.it</a></li>
              <li><a href="#">Pagina Facebook</a></li>
              <li><a href="#">Pagina Twitter</a></li>
              <li><a href="#">Pagina Instagram</a></li>
              <li><a href="#">Pagina Google+</a></li>
            </ul>
          </div>
        </div>


        <div class="footer">
          <a href="/" class="logo">
            <img src="assets/images/logo.png" alt="logo image"/>
          </a>

          <div class="wrapper">
            <ul>
              <li class="title">&#8226;Menu&#8226;</li>
              <li><a href="?p=/articoli">Articoli</a></li>
              <li><a href="?p=/norme">Regolamento</a></li>
              <li><a href="?p=/contatti">Contatti</a></li>
            </ul>
            <ul>
              <li class="title">&#8226;Social&#8226;</li>
              <li><a href="#">Facebook</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Instagram</a></li>
            </ul>
            <ul>
              <li class="title">&#8226;Area riservata&#8226;</li>

              <xsl:if test="root/user"> 
                <li class="userAuth">Benvenuto, <strong>
                  <xsl:value-of select="root/user"/>
                </strong></li>
                <li><a href="?p=/logout">Logout</a></li>
                <xsl:if test="root/session = 1">
                  <li><a href="?p=/purpose">Proponi un articolo</a></li>
                </xsl:if>
                <xsl:if test="root/session = 2">
                  <li><a href="?p=/dashboard">Il mio account editore</a></li>
                </xsl:if>
                <xsl:if test="root/session = 3">
                  <li><a href="?p=/dashboard">Pannello di amministrazione</a></li>
                </xsl:if>
                
              </xsl:if>
              <xsl:if test="not(root/user)">
                <li><a href="?p=/login">Accedi</a></li>
              <li><a href="?p=/signup">Registrati</a></li>
              <li><a href="?p=/norme">Regolamento utenti</a></li>
              </xsl:if>
            </ul>
          </div>


          <div class="copyright">Copyright NEUN &#xA9; 2017 &#8226; <a href="http://validator.w3.org/check?uri=referer">XHTML 1.0 Strict</a> &#8226; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS 3</a> &#8226; <a href="http://jigsaw.w3.org/css-validator/check/referer">Informativa sull'uso dei Cookies</a>
          </div>
        </div>

        <script src="assets/javascript/contact.js" type="text/javascript"></script>    

        <xsl:if test="main/livereloader">
          <script type="text/javascript">     
            <xsl:value-of select="main/livereloader"/>
          </script>
        </xsl:if>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
