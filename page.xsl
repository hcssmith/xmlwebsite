<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />
  <xsl:template match="footnote">
    <sup><a href="#{@id}"><xsl:value-of select="@id" /></a></sup>
  </xsl:template>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:for-each select="page/includes/include">
          <xsl:choose>
            <xsl:when test="@type='css'">
              <link rel="stylesheet" href="{@url}"/>
            </xsl:when>
            <xsl:when test="@type='js'">
              <script src="{@url}"></script>
            </xsl:when>
          </xsl:choose>
        </xsl:for-each>
      </head>
      <body>
        <header>
          <h1><xsl:value-of select="page/@title" /></h1>
          <nav>
            <ul>
              <xsl:for-each select="page/content/menu/menuitem">
                <li><a href="{@destination}"><xsl:value-of select="@text" /></a></li>
              </xsl:for-each>
            </ul>
          </nav>
        </header>
        <main>
          <h1><xsl:value-of select="page/content/body/body_title" /></h1>
          <h3><xsl:value-of select="page/content/body/subtitle" /></h3>
          <xsl:for-each select="page/content/body/text/*">
            <xsl:choose>
              <xsl:when test="name() = 'para'">
                  <p>
                    <xsl:apply-templates />
                  </p>
              </xsl:when>
              <xsl:when test="name() = 'image'">
                <img src="{@url}" />
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
          -----------------------------------------------------
          <xsl:for-each select ="//footnote">
            <p><span><sup><a id="{@id}"><xsl:value-of select="@id" />: </a></sup></span><xsl:value-of select="@description" /></p>
          </xsl:for-each>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
