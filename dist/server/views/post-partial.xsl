<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xml">
  <xsl:output method="html" />
  <xsl:template match="/">
	  <xsl:for-each select="root/posts/entry">
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
	  </xsl:for-each>
  </xsl:template>  
</xsl:stylesheet>
