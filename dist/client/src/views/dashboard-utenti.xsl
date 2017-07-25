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
                <li><a href="/">Sito internet</a></li>
                <li class="active"><a href="?p=/dashboard">Pannello di amministrazione</a></li>
              </ul>

            </div>

            <div class="section subnav dashboard">

                <div>Pannello di amministrazione / Gestione degli utenti</div>

                <h1>Gestisci utenti</h1>

                <xsl:if test="root/deleted">
                  <div class="alert success">L'utente è stato eliminato con successo.</div>
                </xsl:if>

                <xsl:if test="root/updated">
                  <div class="alert success">Il ruolo dell'utente è stato modificato con successo.</div>
                </xsl:if>

                <xsl:if test="root/session = 3">
                    <ul class="submenu">
                        <li><a href="?p=/dashboard">Amministra articoli</a> &#8226; </li>
                        <li><a href="?p=/users" class="active">Gestisci utenti</a></li>
                    </ul>
                </xsl:if>


                <xsl:for-each select="root/users/entry">
                    <div class="containerAltriPost">
                        <form action="/" method="post">
                            <dl>
                                <dt>UserID</dt>
                                <dd>
                                    <input type="hidden" name="p" value="/users" />
                                    <xsl:value-of select="UserID" />

                                    <input type="hidden" name="UserID">
                                        <xsl:attribute name="value">
                                          <xsl:value-of select="UserID" />
                                        </xsl:attribute>
                                    </input>
                                </dd>
                                <dt>Nome</dt>
                                <dd>
                                    <xsl:value-of select="Nome" />
                                </dd>
                                <dt>Cognome</dt>
                                <dd>
                                    <xsl:value-of select="Cognome" />
                                </dd>
                                <dt>Tipo</dt>
                                <dd>
                                    <xsl:value-of select="Tipo" />
                                </dd>
                                <dt>Nome Utente</dt>
                                <dd>
                                    <xsl:value-of select="Username" />
                                </dd>
                                <dt>Azioni</dt>
                                <dd>
                                    <xsl:if test="Tipo = 'user'">
                                         <input class="button success" type="submit" name="upgrade" value="Promuovi a editore"/>
                                    </xsl:if>

                                    <xsl:if test="Tipo = 'editore'">

                                         <input class="button" type="submit" name="downgrade" value="Retrocedi ad utente"/>
                                    </xsl:if>

                                    <xsl:if test="not(Tipo = 'admin')">

                                        <input class="button danger" type="submit" name="delete" value="Elimina utente"/>

                                    </xsl:if>

                                </dd>
                            </dl>
                        </form>
                    </div>
                </xsl:for-each>

                <div class="containerError">
                    <xsl:value-of select="root/error"/>
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
        </body>
</html>

</xsl:template>
</xsl:stylesheet>