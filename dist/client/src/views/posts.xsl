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

        <div class="section subnav searchpage">

          <div class="col-a">

            <div class="search" id="f">
              <h1>Ricerca Articoli</h1>

              <form method="post" action="/?p=/articoli#toRes">
                <div>
                  <label for="search" class="invisible">Ricerca articolo</label>
                  <input type="text" name="search" autofocus="true" id="search">
                    <xsl:attribute name="value"><xsl:value-of select='root/searchValue' /></xsl:attribute>
                  </input>
                  <div class="filters">
                    <input type="checkbox" class="toggle" id="searchfilters" />
                    <label for="searchfilters" class="underline">impostazioni ricerca</label>
                    <div>
                      <h2>Ricerca per:</h2>
                      <div><input type="radio" name="filter" value="Titolo" id="c1" checked="checked"/> <label for="c1">Titolo</label></div>
                      <div><input type="radio" name="filter" value="Autore" id="c2"/> <label for="c2">Autore</label></div>
                      <div><input type="radio" name="filter" value="Contenuto" id="c3"/> <label for="c3">Contenuto</label></div>
                      <h2>Cerca in categorie:</h2>
                      <xsl:for-each select="root/categories/entry">
                        <div>
                          <input type="radio" name="category">
                            <xsl:if test="root/category = Categoria">
                              <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="value"><xsl:value-of select='CategoryID' /></xsl:attribute>
                            <xsl:attribute name="id">cat-<xsl:value-of select='CategoryID' /></xsl:attribute>
                            
                          </input> 
                          <label>
                            <xsl:attribute name="for">cat-<xsl:value-of select='CategoryID' /></xsl:attribute>
                            <xsl:value-of select="Categoria"/>
                          </label>
                        </div>
                      </xsl:for-each>
                    </div>
                  </div>
                  <div><input type="submit" class="button" value="Ricerca" id="toRes"/></div>
                </div>
              </form>
            </div>

            <xsl:if test="root/searchValue or root/category">
              <div class="compress users_list">
                <div class="results">
                  <h2>Risultati per la tua ricerca</h2>
                  <p>Risultati per articoli <xsl:if test="root/searchParam">con <strong><xsl:value-of select='root/searchParam' /></strong> simile o uguale a <strong>"<xsl:value-of select='root/searchValue' />".</strong></xsl:if><xsl:if test="root/category"><br/> <strong>Categoria</strong>: "<xsl:value-of select='root/category' />"</xsl:if></p>

                  <xsl:if test="not(root/search/entry)">
                    <div class="alert danger">Non abbiamo trovato alcun risultato per questa ricerca. Scorri la pagina in su per eseguire una nuova ricerca.</div>
                  </xsl:if>

                  <xsl:for-each select="root/search/entry">
                    <div class="article article-square">

                      <a>
                        <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                        <span class="summary">
                            <span><xsl:value-of select="PreviewTitolo"/> <xsl:value-of select="PreviewSottotitolo"/></span>
                        </span>

                        <xsl:attribute name="src">
                          <xsl:value-of select='LinkThumbail' />
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                          <xsl:value-of select='PreviewTitolo' />
                        </xsl:attribute>

                      </a>
                    </div> 
                  </xsl:for-each>
                </div>
              </div>
            </xsl:if>
          </div>

          <div class="col-b">
            <div class="compress">
              <h1>In primo piano</h1>
              <p>Gli ultimi articoli pubblicati dai nostri editori</p>
              <div class="highlight">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select='root/highlight_s/LinkCopertina' />
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select='root/highlight_s/Titolo' />
                  </xsl:attribute>
                </img>
                <a class="reduced">
                  <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='root/highlight_s/Slug' /></xsl:attribute>
                  <span class="heading-2"><span><xsl:value-of select="root/highlight_s/Titolo"/></span></span>
                </a>
              </div>
            

              <div class="highlight">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select='root/highlight_d/LinkCopertina' />
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select='root/highlight_d/Titolo' />
                  </xsl:attribute>
                </img>
                <a>
                  <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='root/highlight_d/Slug' /></xsl:attribute>
                  <span class="heading-2"><span><xsl:value-of select="root/highlight_d/Titolo"/></span></span>
                </a>
              </div>
            </div>
          </div>

        </div>

        <!-- <xsl:if test="root/category">
          <div class="section compress users_list">
            <h1 class="center-text">Ricerca </h1>
        </xsl:if> -->


        


        


        <div class="section articles-popular">
          <h1>I più popolari</h1>
          <p class="center-text">Gli articoli più popolari selezionati dai nostri editori</p>
          <xsl:for-each select="root/popular/entry">
              <div class="article article-square">

                <a>
                  <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                  <span class="summary">
                      <span class="heading-3d"><xsl:value-of select="PreviewTitolo"/></span>
                      <span><xsl:value-of select="PreviewSottotitolo"/></span>
                  </span>

                  <img>
                    <xsl:attribute name="src">
                      <xsl:value-of select='LinkThumbail' />
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                      <xsl:value-of select='PreviewSottotitolo' />
                    </xsl:attribute>
                  </img>

                </a>
              </div> 

          </xsl:for-each>
        </div>

        <div class="section users_list" id="articoli_anchor">

          <h1 class="left-text">
            Dai nostri autori
          </h1>


          <p class="left-text">
            Naviga tra gli articoli scritti dai nostri autori
          </p>

          <div class="authors-wrapper">

            <ul class="authors">
              <xsl:for-each select="root/users/entry">
                <li>
                  <label>
                    <xsl:attribute name="for">user-<xsl:value-of select='Nome' /><xsl:value-of select='Cognome' /></xsl:attribute>
                    <xsl:value-of select='Nome' /><xsl:text> </xsl:text><xsl:value-of select='Cognome' />
                  </label>
                </li>
              </xsl:for-each>
            </ul>

            

            <!-- <div id="articoli">
              <xsl:for-each select="root/posts/entry">

                  <div class="article article-square">

                    <a>
                      <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                      <span class="summary">
                          <span class="heading-3d"><xsl:value-of select="PreviewTitolo"/></span>
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

              </xsl:for-each>
            </div> -->
          </div>


          <div class="authors-content">
            <xsl:for-each select="root/users/entry">
              <div>
                <input type="radio" class="toggle" id="user-1" name="aut">
                  <xsl:attribute name="checked">checked</xsl:attribute>
                  <xsl:attribute name="id">user-<xsl:value-of select='Nome' /> <xsl:value-of select='Cognome' /></xsl:attribute>
                </input>
                <div>
                  <h2>Gli ultimi articoli di <span><xsl:text> </xsl:text><xsl:value-of select='Nome' /><xsl:text> </xsl:text><xsl:value-of select='Cognome' /></span></h2>
                  <p class="center-text">
                    <a>
                      <xsl:attribute name="href"><xsl:value-of select='Facebook_link' /></xsl:attribute>
                      Visita il profilo Facebook di <xsl:value-of select='Nome' />
                    </a>

                  </p>
                  <xsl:for-each select="posts/entry">
                    <div class="article article-square byusers">
                      <a>
                        <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                        <span class="summary">
                            <span class="heading-3d"><xsl:value-of select="PreviewTitolo"/></span>
                            <span><xsl:value-of select="PreviewSottotitolo"/></span>
                        </span>

                        <img>
                          <xsl:attribute name="src">
                            <xsl:value-of select='LinkThumbail' />
                          </xsl:attribute>
                          <xsl:attribute name="alt">
                            <xsl:value-of select='Titoloc' />
                          </xsl:attribute>
                        </img>

                      </a>
                    </div> 
                  </xsl:for-each>

                </div>
              </div>
            </xsl:for-each>

            <!-- <h1><xsl:value-of select='root/constants/MainDestraTitolo' /></h1>
            <p class="right-text"><xsl:value-of select='root/constants/MainDestraTesto' /></p>
            <ul>
              <xsl:for-each select="root/categories/entry">
                <li>
                  <a>
                    <xsl:attribute name="href">?p=/categoria/<xsl:value-of select='Categoria' /></xsl:attribute>
                    <xsl:value-of select="Categoria"/>
                  </a>
                </li>
              </xsl:for-each>
            </ul> -->

            
            <!-- <h1><xsl:value-of select='root/constants/PopularTitolo'/></h1>
            <div class="popular">
              <xsl:for-each select="root/popular/entry">
                <div class="article">
                  <a>

                    <xsl:attribute name="href">?p=/articoli/<xsl:value-of select='Slug' /></xsl:attribute>

                    <img alt="popular item">
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
            </div>  -->

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

        <xsl:if test="main/livereloader">
          <script type="text/javascript">     
            <xsl:value-of select="main/livereloader"/>
          </script>
        </xsl:if>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
