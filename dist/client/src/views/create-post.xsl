<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xml">
  <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="no" />
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="it" xml:lang="it">
      <head>
        <title>NEUN WEBSITE</title>
        <link href="assets/css/common.css" rel="stylesheet" type="text/css" />
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
            <img src="assets/images/logo.png" alt="Logo Sito di Neun"/>
          </a>

          <ul>
            <li><a href="/">Sito internet</a></li>
            <li class="active"><a href="?p=/dashboard">Pannello di amministrazione</a></li>
          </ul>

        </div>

        <div class="section subnav post-content-form">

          <xsl:if test="root/post/PostID">
            Pannello di amministrazione / <a href="?p=/dashboard">Lista degli articoli</a> / Modifica articolo

            <h1>Modifica Articolo</h1>
          </xsl:if>

          <xsl:if test="not(root/post/PostID)">
            Pannello di amministrazione / <a href="?p=/dashboard">Lista degli articoli</a> / Crea articolo

            <h1>Crea un Articolo</h1>
          </xsl:if>


          <xsl:if test="root/preview">

            <div class="preview">

              <div class="alert danger">
                ATTENZIONE: Questa è un anteprima del tuo articolo. Ricorda che devi premere il tasto salva per salvare l'articolo. Rammenda inoltre che l'articolo ha bisogno dell'approvazione di un amministratore affinchè venga pubblicato.
              </div>

              <div class="post-content">
                <div class="post-metadata">
                  <p class="date"><xsl:value-of select="root/post/DataDisplay"/></p>
                  <p class="author"><xsl:value-of select="root/post/Autore"/></p>
                </div>
                <h1><xsl:value-of select="root/post/Titolo"/></h1>

                <div class="post"><xsl:value-of select='root/post/Contenuto' disable-output-escaping="yes"/></div>
              </div>

            </div>
            <h2>Modifica Articolo:</h2>
          </xsl:if>

          <form  method="post" action="">

            <xsl:if test="not(root/post/Contenuto)">
              <p>Neun si affida ai propri editori per la redazione dei contenuti. Gli editori sono incoraggiati a seguire le <a href="/?p=/norme#approvazione-contenuti">linee guida sull'approvazione dei contenuti</a>.</p>
            </xsl:if>

            <xsl:if test="root/updated">
              <div class="alert success">Il tuo articolo è stato aggiornaro con successo.</div>
            </xsl:if>

            <xsl:if test="root/error">
              <div class="alert danger" id="errorLoginServer">
                <xsl:value-of select="root/error"/>
              </div>
            </xsl:if>

            <fieldset>

              <label for="titlePost">Titolo*:</label>
              <input type="text" name="Titolo" id="titlePost" aria-describedby="titleMeaning">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/Titolo" />
                </xsl:attribute>
              </input>

               <label for="previewTitlePost">Preview Titolo*:</label>
              <input type="text" name="PreviewTitolo" id="previewTitlePost">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/PreviewTitolo" />
                </xsl:attribute>
              </input>

              <label for="previewsubtitlePost">Sottotitolo*:</label>
              <input type="text" name="PreviewSottotitolo" id="previewsubtitlePost">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/PreviewSottotitolo" />
                </xsl:attribute>
              </input>


              <label for="autorePost">Autore*:</label>
              <input type="text" name="Autore" id="autorePost">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/Autore" />
                </xsl:attribute>
              </input>

              <label for="displayDataPost">Data Mostrata*:</label>
              <input type="text" name="DataDisplay" id="displayDataPost">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/DataDisplay" />
                </xsl:attribute>
              </input>

              <label for="copertina">Link per immagine di copertina*:</label>
              <input type="text" name="LinkCopertina" id="copertina">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/LinkCopertina" />
                </xsl:attribute>
              </input>

              <label for="thumbail">Link per immagine di thumbail*:</label>
              <p>Tieni prese</p>
              <input type="text" name="LinkThumbail" id="thumbail">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/LinkThumbail" />
                </xsl:attribute>
              </input>

              <input type="hidden" name="PostID">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/PostID" />
                </xsl:attribute>
              </input>

              <label for="comment">Contenuto dell'articolo*:</label>
              <textarea rows="4" cols="50" name="ContenutoPlain" id="comment">
                  <xsl:value-of select="root/post/ContenutoPlain" />
              </textarea>

              <label for="slug">Slug (URL relativo dell'articolo)*</label>
              <input type="text" name="Slug" id="slug">
                <xsl:attribute name="value">
                  <xsl:value-of select="root/post/Slug" />
                </xsl:attribute>
              </input>

              <p id="meaning">Inviando il tuo articolo, accetti il <a href="/?p=/norme#approvazione-contenuti">Nostro regolamento sugli articoli</a>.</p>

              <div class="alert danger hidden" id="errorJs"></div>

              <input aria-describedby="meaning" type="submit" name="preview" value="Anteprima" class="button" />
         
              <input aria-describedby="meaning" type="submit" name="submit" value="Salva articolo" class="button" />          

            </fieldset>
          </form>

          <div class="help">
            <h2>Formattazzione dei post</h2>
            <div id="help">Neun propone una sintassi semplice e sicura per formattare gli articoli. Essa è una versione semplificata di <a href="https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet">Markdown</a>.  

            <div class="post-content">
              <ul class="post">
                <li><h2># Intestazione 1</h2></li>
                <li><h3>## Intestazione 2</h3></li>
                <li><i>_testo in corsivo_</i></li>
                <li><b>**testo in grassetto**</b></li>
                <li><strong>Immagine:</strong> <br/> {Logo di Neun}(assets/images/logo.png)</li>
                <li><strong>Link:</strong> <br/> [Sito internet di Neun](/)</li>
                <li><strong>Lista ordinata:</strong> <br/> 
                  1. Primo elemento <br/>
                  2. Secondo elemento <br/>
                </li>
                <li><strong>Lista non ordinata:</strong> <br/> 
                  * Primo elemento <br/>
                  * Secondo elemento <br/>
                </li>
              </ul>
            </div>

            </div>

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

        <script src="assets/javascript/main.js" type="text/javascript"></script>    

        <xsl:if test="root/livereloader">
          <script type="text/javascript">     
            <xsl:value-of select="root/livereloader"/>
          </script>
        </xsl:if>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
