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
            <img src="assets/images/logo.png" alt="Sito di Neun, Pagina principale"/>
          </a>

          <ul>
            <li><a href="?p=/articoli">Contenuti</a></li>
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

        <div class="section highlight">
          <img>
            <xsl:if test="root/highlight/Copertina">
              <xsl:attribute name="src">
              <xsl:value-of select='root/highlight/Copertina' />
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select='root/highlight/CopertinaAlt' />
            </xsl:attribute>
            </xsl:if>

            <xsl:if test="root/highlight/LinkCopertina">
              <xsl:attribute name="src">
              <xsl:value-of select='root/highlight/LinkCopertina' />
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select='root/highlight/title' />
            </xsl:attribute>
            </xsl:if>
            
          </img>
          <h1>In primo piano</h1>
          <a class="invisible" id="highlight" href="">Articolo in primo piano</a>
          <a>
            <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='root/highlight/Slug' /></xsl:attribute>
            <span class="heading-2"><span><xsl:value-of select="root/highlight/Titolo"/></span></span>
          </a>
        </div>

        <div class="section" id="articoli_anchor">

          <h1>
            <xsl:value-of select='root/constants/BenvenutoTitolo' /> 
          </h1>

          <p class="presentation">
            Neun è un'organizzazione che ragruppa <strong>scrittori</strong>, videomaker, <strong>musicisti</strong> e fotografi <strong>indipendenti</strong>. Lo scopo di Neun è quello di promuovere, supportare e divulgare gli artefatti di giovani artisti emergenti. Neun promuove iniziative culturali, eventi e dibattiti presso l'associazione 639.
          </p>

          <div class="main-articles">

            <h1>Articoli
              <xsl:if test="root/page &gt; 1">
                (Pagina <xsl:value-of select="root/page"/>)
              </xsl:if>

            </h1>
            <p class="left-text">Neun propone contenuti originali ogni settimana generati da più di 15 editori indipendenti.</p>

            <a class="invisible" id="feautured-articles" href="#articoli">Articoli. Lista degli ultimi articoli per data di pubblicazione.</a>

            <div id="articoli">
              <xsl:for-each select="root/posts/entry">

                  <div class="article article-square">

                    <a>
                      <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                      <span class="summary">
                          <span class="heading-3d"><xsl:value-of select="PreviewTitolo"/></span>
                          <span ><xsl:value-of select="PreviewSottotitolo"/></span>
                      </span>

                      <img aria-hidden="true">
                        <xsl:if test="Thumbail">
                          <xsl:attribute name="src">
                            <xsl:value-of select='Thumbail' />
                          </xsl:attribute>
                          <xsl:attribute name="alt">
                            <xsl:value-of select='ThumbailAlt' />
                          </xsl:attribute>
                        </xsl:if>

                        <xsl:if test="LinkThumbail">
                          <xsl:attribute name="src">
                            <xsl:value-of select='LinkThumbail' />
                          </xsl:attribute>
                          <xsl:attribute name="alt">
                            <xsl:value-of select='PreviewTitolo' />
                          </xsl:attribute>
                        </xsl:if>
                      </img>

                    </a>
                  </div> 

              </xsl:for-each>
            </div>

              <div id="pagination_nojs">
                <xsl:if test="root/page > 1">
                  <a class="button">
                  <xsl:attribute name="href">?page=<xsl:value-of select='root/p_page'/>&amp;per_page=15#articoli_anchor</xsl:attribute>
                  &#8668; Più recenti
                </a>
                </xsl:if>

                <xsl:if test="not(root/finish)">
                  <a class="button">
                     <xsl:attribute name="href">?page=<xsl:value-of select='root/page' />&amp;per_page=15#articoli_anchor</xsl:attribute>
                    Meno recenti &#8669;
                  </a>
                </xsl:if>
              </div>
            
            <a class="button" id="pagination" onclick="loadMorePosts()" href="javascript:void(0)">
              Carica altri articoli &#8675;
            </a>
          </div>


           <div class="featured-articles">
            <h1><xsl:value-of select='root/constants/MainDestraTitolo' /></h1>
            <a class="invisible" href="#categorie">Lista delle categorie discusse recentemente.</a>
            <p class="right-text"><xsl:value-of select='root/constants/MainDestraTesto' /></p>
            <ul id="categorie">
              <xsl:for-each select="root/categories/entry">
                <li>
                  <a>
                    <xsl:attribute name="href">?p=/articoli&amp;category=<xsl:value-of select='CategoryID' />#toRes</xsl:attribute>
                    <xsl:value-of select="Categoria"/>
                  </a>
                </li>
              </xsl:for-each>
            </ul>

            
            <h1><xsl:value-of select='root/constants/PopularTitolo'/></h1>
            <a class="invisible" href="#articoli_popolari">Post più popolari selezionati.</a>
            <div class="popular" id="articoli_popolari">
              <xsl:for-each select="root/popular/entry">
                <div class="article">
                  <a>

                    <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                    <img alt="popular item" aria-hidden="true">
                      <xsl:attribute name="src">
                        <xsl:value-of select='Copertina' />
                      </xsl:attribute>
                      <xsl:attribute name="alt">
                        <xsl:value-of select='CopertinaAlt' />
                      </xsl:attribute>
                    </img>
                    <span class="summary">
                      <span>
                        <xsl:value-of select="Titolo"/>
                      </span>
                    </span>
                  </a>
                </div>
              </xsl:for-each>

            </div> 

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
