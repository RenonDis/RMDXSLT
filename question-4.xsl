<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat"/>

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

    <h1>Ponctualité du transilien (
        <xsl:value-of select="$minmois"/> /
        <xsl:value-of select="$minan"/> -
        <xsl:value-of select="$maxmois"/> /
        <xsl:value-of select="$maxan"/> )
    </h1>

    <div class="service">
        <xsl:apply-templates select="service"/>
    </div>

  </body>
</html>
</xsl:template>

<xsl:template match="service">
    <xsl:apply-templates select="ligne"/>
</xsl:template>

<xsl:template match="ligne">
<table>
    <tr>
        <td colspan="3">
            <xsl:value-of select="@nom"/>
        </td>
    </tr>
    <tr>
        <th>Date</th>
        <th>Mesure</th>
        <th>Satisfaction</th>
    </tr>
    <xsl:for-each select="annee/mesure">
      <xsl:sort select="../@millesime"/>
      <xsl:sort select="@mois"/>
      <tr class="donnee">
           <td>
                <xsl:choose>
                        <xsl:when test="@mois = '01'"> Janvier </xsl:when>
                        <xsl:when test="@mois = '02'"> Fevrier </xsl:when>
                        <xsl:when test="@mois = '03'"> Mars </xsl:when>
                        <xsl:when test="@mois = '04'"> Avril </xsl:when>
                        <xsl:when test="@mois = '05'"> Mai </xsl:when>
                        <xsl:when test="@mois = '06'"> Juin </xsl:when>
                        <xsl:when test="@mois = '07'"> Juillet </xsl:when>
                        <xsl:when test="@mois = '08'"> Août </xsl:when>
                        <xsl:when test="@mois = '09'"> Septembre </xsl:when>
                        <xsl:when test="@mois = '10'"> Octobre </xsl:when>
                        <xsl:when test="@mois = '11'"> Novembre </xsl:when>
                        <xsl:when test="@mois = '12'"> Décembre</xsl:when>
                </xsl:choose>
		<xsl:value-of select="../@millesime"/>
	   </td> 
           <td><xsl:value-of select="substring(ponctualite,1,4)"/></td> 
           <td><xsl:apply-templates select="satisfaction"/></td>
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
