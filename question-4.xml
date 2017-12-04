<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="utf-8"></xsl:output>

<xsl:template match="/ponctualite-transilien">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
  <head>
    <link rel="stylesheet" type="text/css" href="style_trains.css"/>
  </head>
  <body>

    <!-- Methode de calcul du min et max en dur -->
    <xsl:variable name="minmax">
      <xsl:for-each select="//mesure">
        <xsl:sort select="../@millesime"/>
        <xsl:sort select="@mois"/>
        <xsl:if test="position() = 1">
            <xsl:value-of select="@mois"/>-<xsl:value-of select="../@millesime"/>
        </xsl:if>
        <xsl:if test="position() = last()">
        au
            <xsl:value-of select="@mois"/>-<xsl:value-of select="../@millesime"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>

    <!-- Methode avec appel de template -->
    <xsl:variable name="minan">
    <xsl:call-template name="min">
    <xsl:with-param name="list" select="//annee/@millesime"/>
    </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="minmois">
    <xsl:call-template name="min">
    <xsl:with-param name="list" select="//annee[@millesime=$minan]/mesure/@mois"/>
    </xsl:call-template>
    </xsl:variable>
    
    <xsl:variable name="maxan">
    <xsl:call-template name="max">
    <xsl:with-param name="list" select="//annee/@millesime"/>
    </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="maxmois">
    <xsl:call-template name="max">
    <xsl:with-param name="list" select="//annee[@millesime=$maxan]/mesure/@mois"/>
    </xsl:call-template>
    </xsl:variable>
    
    <h1>Ponctualité du transilien du <xsl:value-of select="$minmois"/>-<xsl:value-of select="$minan"/>
    au <xsl:value-of select="$maxmois"/>-<xsl:value-of select="$maxan"/> </h1>
      
  <xsl:apply-templates/>

  </body>
</html>
</xsl:template>

<xsl:template match="service">
<div>
    <xsl:apply-templates/>
</div>
</xsl:template>

<xsl:template match="ligne">
<xsl:value-of select="@nom"/>
<table border="2">
    <tr>
        <th>Date</th>
        <th>Mesure</th>
        <th>Satisfaction</th>
    </tr>
    <xsl:for-each select="annee/mesure">
      <xsl:sort select="../@millesime"/>
      <xsl:sort select="@mois"/>
      <tr>
           <td><xsl:value-of select="../@millesime"/>-<xsl:value-of select="@mois"/></td> 
           <td><xsl:apply-templates select="ponctualite"></xsl:apply-templates></td> 
           <td><xsl:apply-templates select="satisfaction"></xsl:apply-templates></td>
      </tr>
     </xsl:for-each>
</table>
</xsl:template>

    <!-- Template param pour calcul du min -->
    <xsl:template name="min">
    <xsl:param name="list"/>
      <xsl:for-each select="$list">
        <xsl:sort select="."/>
        <xsl:if test="position() = 1">
            <xsl:value-of select="."/>
        </xsl:if>
      </xsl:for-each>
    </xsl:template>
    
    <!-- Template param pour calcul du max -->
    <xsl:template name="max">
    <xsl:param name="list"/>
      <xsl:for-each select="$list">
        <xsl:sort select="."/>
        <xsl:if test="position() = last()">
            <xsl:value-of select="."/>
        </xsl:if>
      </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
