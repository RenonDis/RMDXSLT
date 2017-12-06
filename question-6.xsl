<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat"/>

<xsl:template match="/ponctualite-transilien">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
  <head>
    <link rel="stylesheet" type="text/css" href="style_trains.css"/>
  </head>
  <body>

    <h1>Ponctualité du transilien</h1>

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
<xsl:variable name="hexcolor" select="@hex"/>
<table>
    <tr>
        <td colspan="3">
            <xsl:value-of select="@nom"/>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="background-color:{$hexcolor}"/>
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
           <td><xsl:value-of select="../@millesime"/>-<xsl:value-of select="@mois"/></td> 
           <td><xsl:value-of select="substring(ponctualite,1,4)"/></td> 
           <td><xsl:apply-templates select="satisfaction"/></td>
      </tr>
     </xsl:for-each>
</table>
</xsl:template>

</xsl:stylesheet>
