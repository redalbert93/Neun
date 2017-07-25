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
            <li class="active"><a href="?p=/articoli">Contenuti</a></li>
            <li><a href="?p=/norme">Regolamento</a></li>
            <li><a href="?p=/contatti">Contatti</a></li>
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

        <div class="section heading-article">
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select='root/post/LinkCopertina' />
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select='root/post/Titolo' />
            </xsl:attribute>
          </img>
          <!-- <h1>In primo piano</h1> -->
          <div class="summary">
            <div class="wrap">
              <div class="valign">
                <h1><a href="#content">&#8659; <xsl:value-of select="root/post/PreviewTitolo"/> &#8659;</a></h1>
              </div>
            </div>
          </div>
        </div>

        <div class="section" id="content">

          <div class="post-content">
            <div class="post-metadata">
              <p class="date"><xsl:value-of select="root/post/DataDisplay"/></p>
              <p class="author"><xsl:value-of select="root/post/Autore"/></p>
            </div>
            <h1><xsl:value-of select="root/post/Titolo"/></h1>
            <h2><xsl:value-of select="root/post/SottoTitolo"/></h2>

            <p class="post-info">Gli utenti hanno commentato questo articolo <xsl:value-of select="count(root/comment/entry)" /> volte</p>
             
            <!-- <h1><xsl:value-of select='root/constants/MainSinistraTitolo'/></h1>
            <p class="left-text"><xsl:value-of select='root/constants/MainSinistraTesto' /></p> -->

            <div class="post"><xsl:value-of select='root/post/Contenuto' disable-output-escaping="yes"/></div>

            <div class="container comments">
              <h2>I Commenti degli utenti</h2>

              <p>I commenti vengono inseriti dagli utenti per discutere degli argomenti e dei temi trattati nell'articolo. </p>

              <xsl:for-each select="root/comment/entry">
                <ul id="comments">
                  <li>
                    <div class="heading">
                      <span class="author"><xsl:value-of select="Username"/></span>
                      <span class="date">23 dicembre</span>
                    </div>
                    <div class="content"><xsl:value-of select="Content"/></div>
                    
                    <xsl:value-of select="Contenuto"/>
                  </li>
                </ul>
              </xsl:for-each>

              <xsl:if test="not(root/session)">
                <div class="alert danger">
                  Per inserire il tuo commento devi essere registrato. <a href="/?p=/signup">Registrati.</a>
                </div>
              </xsl:if>

              <xsl:if test="root/session">
                <form  method="post" action="#comment">
                  <fieldset>
                   
                    <label for="comment">Inserisci il tuo commento</label>
                    <textarea name="Contenuto" id="comment"></textarea>

                    <p id="commentMeaning">Pubblicando il commento, accetti il <a href="/?p=/norme#commenti">Nostro regolamento sui commenti</a>.</p>

                    <div class="alert danger hidden" id="errorJs"></div>

                    <xsl:if test="root/success">
                      <div class="alert success" id="successError">Il tuo commento è stato aggiunto con successo e potrà essere visto dagli altri utenti.</div>
                    </xsl:if>

                    <xsl:if test="root/error">
                      <div class="alert danger" id="errorLoginServer">
                        <xsl:value-of select="root/error"/>
                      </div>
                    </xsl:if>
               
                    <input aria-describedby="commentMeaning" type="submit" name="submit" value="Pubblica il tuo commento" class="button" id="submitButtonComment"/>          

                  </fieldset>
                </form>
              </xsl:if>
              
            </div>


          </div>


          <div class="post-aside">
            <!-- <xsl:for-each select="root/posts/entry">

                <div class="article article-square">

                  <a>

                    <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                    <span class="summary">
                        <span class="heading-3"><xsl:value-of select="PreviewTitolo"/></span>
                        <span><xsl:value-of select="PreviewSottotitolo"/></span>
                    </span>

                    <img>
                      <xsl:attribute name="src">
                        <xsl:value-of select='Thumbail' />
                      </xsl:attribute>
                      <xsl:attribute name="alt">
                        <xsl:value-of select='ThumbailAlt' />
                      </xsl:attribute>
                    </img>

                  </a>
                </div> 
            </xsl:for-each> -->
            

          </div>
        </div>

        <!-- <div class="section advices">
          <h1>Consigli agili&#x2122;</h1>
          <h2>Collegamenti a siti esterni guggeriti dai nostri editori</h2>
          <xsl:for-each select="main/catalog/cd">
            <div>
              <a href="#">
                <img src="https://ddtyjnztd6zgj.cloudfront.net/1486033237261.jpeg" class="lazyLoad" width="100%" alt="caspita"/>
                <span class="category">Musica</span>
                <span>Consiglio Agile 1</span>
              </a>
            </div>
          </xsl:for-each>
        </div> -->


        <!-- <div class="section media">
          <h1>Multimedia</h1>
          <h2>Contenuti multimediali originali NEUN</h2>
          <div>
            <h3 class="right">Gli Album fotografici</h3>
            <xsl:for-each select="main/catalog/cd">
              <div class="article">
                <a href="#">
                  <img src="https://ddtyjnztd6zgj.cloudfront.net/1484038173521.jpeg" class="lazyLoad" width="100%" alt="caspita"/>
                  <span class="summary">
                    <span class="title">Visuali contrappose <br/>
                      <span class="small">Di: Chiara Novali</span> <br/>
                      <span class="see-more">clicca per visitare</span>
                    </span>
                    
                    <span class="date">Agosto<br/>2016</span>
                  </span>
                </a>
              </div>
            </xsl:for-each>
          </div>
          <div>
            <h3>I Video di Neun</h3>
            <xsl:for-each select="main/catalog/cd">
              <div class="article">
                <a href="#">
                  <img src="https://ddtyjnztd6zgj.cloudfront.net/1484650182596.jpeg" class="lazyLoad" width="100%" alt="caspita"/>
                  <span class="summary">
                    <span class="title">Trump dice due cazzate <br/>
                      <span class="small">Di: Stufo Ermellini</span> <br/>
                      <span class="see-more">clicca per visitare</span>
                    </span>
                    
                    <span class="date">Agosto<br/>2016</span>
                  </span>
                </a>
              </div>
            </xsl:for-each>
          </div>

        </div>
 -->


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

        <script src="assets/javascript/post.js" type="text/javascript"></script>    

        <script type="text/javascript">     
          <xsl:value-of select="main/livereloader"/>
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
