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
            <li class="active"><a href="?p=/norme">Regolamento</a></li>
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

        <div class="section subnav" id="content">

          <div class="post-content">
            <!-- <h1><xsl:value-of select='root/constants/MainSinistraTitolo'/></h1>
            <p class="left-text"><xsl:value-of select='root/constants/MainSinistraTesto' /></p> -->

            <div class="post">
              <h1>Regolamenti NEUN</h1>

              <ul class="table">
                <li><a href="#introduzione">Introduzione</a></li>
                <li><a href="#approvazione-contenuti">Linee guida per l'approvazione dei contenuti</a></li>
                <li><a href="#commenti">Linee guida per l'approvazione dei commenti</a></li>
                <li><a href="#cookies">Informativa sull'utilizzo dei cookies</a></li>
              </ul>

              <h2 id="introduzione">Introduzione</h2>
              <p>NEUN è un organizzazione indipendente che si propone l'obbiettivo di raggruppare giovani artisti emergenti. NEUN mette a disposizione un canale comunicativo per permettere a questi soggetti di avere un canale di pubblicazione e maggiore visibilità. </p>

              <p>Gli utenti possono commentare contenuti e proporne di nuovi. Al fine di preservare le caratteristiche fondamentali del progetto NEUN queste attività sono state regolamentate. In questa pagina puoi trovare tutte le informazioni utili per poter contribuire in maniera corretta ed efficace.</p>

              <h2 id="approvazione-contenuti">Linee guida per l'approvazione dei contenuti</h2>

              <h3>Termini e condizioni</h3>
              <p>Gli utenti registrati possono proporre contenuti. Questi contenuti sono poi valutati dagli amministratori del sito NEUN che possono decidere o meno di pubblicarli. Tieni presente i seguenti punti quando proponi un contenuto come utente:
              </p>
                
                <ul>
                  <li>I post devono essere scritti in lingua Italiana corretta.</li>
                  <li>Gli amministratori possono modificare il tuo contenuto in qualsiasi modo e in qualsiasi momento, senza richiederti l'autorizzazione.</li>
                  <li>Nel momento in cui un tuo contenuto viene pubblicato, nè perderai la potestà e non sarai più in grado di modificarlo.</li>
                  <li>NEUN potrebbe integrare il tuo contenuto con contenuti di terze parti.</li>
                  <li>NEUN potrebbe non attribuirti la firma dell'articolo</li>
                  <li>I tuoi contenuti diventano di proprietà di NEUN al momento in cui vengono caricati</li>
                </ul>  

              <p>
                Neun supporta la possibilità di registrarsi in qualità di "editori". Questa categoria di utenti può pubblicare contenuti integrali e mantenere un attribuzione totale.
              </p>

              <h3>Criteri di qualifica</h3>
              <p>Vista la mole di contenuti proposti dagli utenti, sono stati definiti degli obbiettivi di qualifica per selezionare i contenuti migliori che vengono proposti.</p>

              <ul>
                <li>Il tuo articolo dovrebbe essere tra le 400 e le 900 parole.</li>
                <li>Il tuo articolo dovrebbe includere tra le 2 e le 4 immagini</li>
                <li>La dimensione delle immagini non deve superare i 500X500 pixels</li>
                <li>Il tuo articolo dovrebbe essere scritto con un tono giovanile così come proposto da NEUN, per esempio utilizzando parole dello slung giovanile.</li>
                <li>Il tuo articolo dovrebbe trattare di temi recentemente discussi nei canali NEUN.</li>
                <li>Il tuo articolo deve essere originale e non deve contenere materiale protetto da copyright di cui non detieni i diritti.</li>
              </ul>

              


              <h2 id="commenti">Linee guida per l'approvazione dei commenti</h2>
              <p>Gli utenti non devono:</p>
              <ul>
                <li>Inserire immagini o altri contenuti a sfondo sessuale.</li>
                <li>Insultare più o meno velatamente altri utenti o lo Staff di NEUN.</li>
                <li>Il razzismo ed ogni apologia dell'inferiorità o superiorità di una razza rispetto alle altre.</li>
                <li>Offendere le istituzioni o una qualsiasi confessione religiosa.</li>
                <li>Trattare argomenti ritenuti non idonei allo spirito del sito, contrari al buon gusto o comunque in grado di offendere la sensibilità di altri utenti.</li>
                <li>Inserire codici seriali di software commerciali.</li>
                <li>Inserire collegamenti a siti esterni contenenti materiale che violi le leggi sul copyright e sul diritto d'autore.</li>
                <li>Promuovere un qualsiasi atteggiamento illegale, quali l'uso di droghe o la pirateria.</li>
                <li>Richiedere informazioni relative alla reperibilità di modifiche, crack, copie di giochi e quant'altro.</li>
                <li>L'uso e l'abuso di volgarità, in special modo quelle gratuite.</li>
                <li>I flame</li>
                <li>Lo spam</li>
              </ul>

              <h2 id="cookies">Informativa sull'utilizzo dei cookies</h2>
              
                <p>Il sito &#8221;<strong>Neun</strong>&#8221; utilizza i Cookie per rendere i propri servizi semplici e efficienti per l&#8217;utenza che visiona le pagine di NEUN.</p>
                <p>Gli utenti che visionano Neun, vedranno inserite delle <strong>quantità minime di informazioni</strong> nei dispositivi in uso, che siano computer e periferiche mobili, in piccoli file di testo denominati &#8220;cookie&#8221; salvati nelle directory utilizzate dal browser web dell&#8217;Utente.</p>
                <p>Disabilitando i cookie alcuni dei nostri servizi potrebbero non funzionare correttamente e alcune pagine non le visualizzerai correttamente.</p>
                <p>Vi sono <strong>vari tipi di cookie</strong>, alcuni per rendere più efficace l&#8217;uso del Sito, altri per abilitare determinate funzionalità.</p>
                <p>Analizzandoli in maniera particolareggiata i nostri cookie permettono di:</p>
                <ul>
                <li>memorizzare le preferenze inserite</li>
                <li>evitare di reinserire le stesse informazioni più volte durante la visita quali ad esempio nome utente e password</li>
                <li>analizzare l&#8217;utilizzo dei servizi e dei contenuti forniti da NEUN per ottimizzarne l&#8217;esperienza di navigazione e i servizi offerti</li>
                </ul>
                <h3>Tipologie di Cookie utilizzati da NEUN</h3>
                <p>A seguire i vari tipi di cookie utilizzati da NEUN in funzione delle finalità d&#8217;uso</p>
                <h4>Cookie Tecnici</h4>
                <p>Questa tipologia di cookie è strettamente necessaria al <strong>corretto funzionamento di alcune sezioni del Sito</strong>. Sono di due categorie: persistenti e di sessione:</p>
                <ul>
                <li><strong>persistenti</strong>: una volta chiuso il browser non vengono distrutti ma rimangono fino ad una data di scadenza preimpostata</li>
                <li><strong>di sessioni</strong>: vengono distrutti ogni volta che il browser viene chiuso</li>
                </ul>
                <p>Questi cookie, inviati sempre dal nostro dominio, <strong>sono necessari a visualizzare correttamente il sito</strong> e in relazione ai servizi tecnici offerti, verranno quindi <strong>sempre utilizzati e inviati</strong>, a meno che l&#8217;utenza non modifichi le impostazioni nel proprio browser (inficiando così la visualizzazione delle pagine del sito).</p>
                <h4>Cookie analitici</h4>
                <p>I cookie in questa categoria vengono utilizzati per <strong>collezionare informazioni sull&#8217;uso del sito</strong>. NEUN userà queste informazioni in merito ad <strong>analisi statistiche anonime</strong> al fine di migliorare l&#8217;utilizzo del Sito e per rendere i contenuti più interessanti e attinenti ai desideri dell&#8217;utenza. Questa tipologia di cookie raccoglie dati in <strong>forma anonima</strong> sull&#8217;attività dell&#8217;utenza e su come è arrivata sul Sito. I cookie analitici sono inviati dal Sito Stesso o da domini di terze parti.</p>
                <h4>Cookie di analisi di servizi di terze parti</h4>
                <p>Questi cookie sono utilizzati al fine di raccogliere informazioni sull&#8217;<strong>uso del Sito</strong> da parte degli utenti in <strong>forma anonima</strong> quali: pagine visitate, tempo di permanenza, origini del traffico di provenienza, provenienza geografica, età, genere e interessi ai fini di campagne di marketing. Questi cookie sono inviati da domini di terze parti esterni al Sito, nel nostro caso da Google Analytics.</p>
                <h4>Cookie per integrare prodotti e funzioni di software di terze parti</h4>
                <p>Questa tipologia di cookie <strong>integra funzionalità sviluppate da terzi</strong> all&#8217;interno delle pagine del Sito come le icone e le preferenze espresse nei social network al fine di condivisione dei contenuti del sito o per l&#8217;uso di servizi software di terze parti (come i software per generare le mappe e ulteriori software che offrono servizi aggiuntivi). Questi cookie sono inviati da <strong>domini di terze parti</strong> e da <strong>siti partner</strong> che offrono le loro funzionalità tra le pagine del Sito.</p>
                <h4>Cookie di profilazione</h4>
                <p>Sono quei cookie necessari a creare profili utenti al fine di inviare messaggi pubblicitari in linea con le preferenze manifestate dall&#8217;utente all&#8217;interno delle pagine del Sito.</p>
                <p>Nel nostro Sito non utilizziamo cookie di profilazione.</p>
                <p>NEUN, secondo la normativa vigente, non è tenuto a chiedere consenso per i <strong>cookie tecnici</strong>, in quanto necessari a fornire i servizi richiesti.</p>
                <p>Per tutte le altre tipologie di cookie il consenso può essere espresso dall&#8217;Utente con una o più di una delle seguenti modalità:</p>
                <ul>
                <li><strong>Mediante specifiche configurazioni del browser</strong> utilizzato o dei relativi programmi informatici utilizzati per navigare le pagine che compongono il Sito.</li>
                <li><strong>Mediante modifica delle impostazioni</strong> nell&#8217;uso dei servizi di terze parti</li>
                </ul>
                <p>Entrambe queste soluzioni potrebbero impedire all&#8217;utente di utilizzare o visualizzare parti del Sito.</p>
                <p><strong>Siti Web e servizi di terze parti</strong></p>
                <p>Il Sito potrebbe contenere collegamenti ad altri siti Web che dispongono di una propria informativa sulla privacy che può essere diverse da quella adottata da NEUN e che che quindi <strong>non risponde</strong> di questi siti.</p>


                <p><a href="#introduzione">Torna su</a></p>
            </div>

          </div>


          <div class="post-aside">

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

        <script src="assets/javascript/post.js" type="text/javascript"></script>    

        <script type="text/javascript">     
          <xsl:value-of select="main/livereloader"/>
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
