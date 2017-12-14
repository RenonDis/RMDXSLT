<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" encoding="utf-8" doctype-system="about:legacy-compat"/>


<xsl:template match="/ponctualite-transilien">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
  <script type="text/javascript" src="js/vivus.min.js"/>
  <script type="text/javascript" src="js/anim.js"/>
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


<!-- Graphique SVG -->
<xsl:variable name="globWidth" select="900"/>
<xsl:variable name="globHeight" select="400"/>

<xsl:variable name="maxsatisf">
  <xsl:for-each select="./annee/mesure">
    <xsl:sort select="satisfaction" data-type="number"/>
    <xsl:if test="position()=last()">
        <xsl:value-of select="satisfaction"/>
    </xsl:if>
  </xsl:for-each>
</xsl:variable>

<div class="graph">
<svg id="graphic" width="{$globWidth}" height="{$globHeight}" 
    xmlns="http://www.w3.org/2000/svg"
    version="2.0">
<g>

    <xsl:variable name="init-x" select="30"/>
    <xsl:variable name="init-y" select="30"/>
    <xsl:variable name="width"  select="$globWidth - 4*$init-x"/>
    <xsl:variable name="height" select="$globHeight - 4*$init-y"/>
    <xsl:variable name="min-value" select="0"/>
    <xsl:variable name="step-value" select="10"/>
    <xsl:variable name="step-number" select="10"/>
    <xsl:variable name="baseline"  select="$height + $init-y"/>

      <!-- the diagram's box -->
      <rect x="{ $init-x }" y="{ $init-y }"
                width="{ $width }" height="{ $height }"
                fill="#fff" stroke="#000"/>
      <!-- the Y axis's labels and their lines -->
      <!-- the plot line -->
      <path stroke="blue" stroke-width="1" fill="none">
      </path>

    <!-- Giving a title -->
    <text x="{$globWidth div 3}" y="{$init-y div 2}" font-size="20px">
    Satisfaction du
    <xsl:value-of select="@nom"/>
    </text>

    <!-- Build the X axis -->
    <xsl:variable name="nbMes" select="count(annee/mesure)"/>
    <xsl:for-each select=".//mesure">
   	<xsl:sort select="../@millesime"/>
  	<xsl:sort select="@mois"/>

      	<xsl:variable name="xpos" select="$init-x + position()*$width div $nbMes"/>
 	<text x="{$xpos}" y="{$baseline + 15}"
            transform="rotate(-45 {$xpos} {$baseline + 15})"
            font-size="10px" text-anchor="end">
       	    <xsl:value-of select="@mois"/>-<xsl:value-of select="../@millesime"/>
	</text>

      	<rect x="{$xpos - 10}" y="{$baseline}" width="1" height="6" stroke="#000" fill="none"/>
    </xsl:for-each>

    <!-- Build the Y axis -->
    <xsl:for-each select="(//node())[5 >= position()]">
    <xsl:variable name="ypos" select="$height+$init-y - position()*$height div 5"/>
    <text x="{$init-x - 5}" y="{$ypos + 3}"
        font-size="10px" text-anchor="end">
        <xsl:value-of select="substring((position()*2*$maxsatisf) div 10,1,4)"/>
    </text>

    <rect x="{$init-x}" y="{$ypos}" width="{$width}" height="1" stroke="#888" fill="none"/>
    </xsl:for-each>
    <text x="{$init-x - 5}" y="{$baseline}"
        font-size="10px" text-anchor="end">
        0
    </text>

    <!-- Get some default for line color -->
    <xsl:variable name="linecol">
        <xsl:choose>
        <xsl:when test="$hexcolor">
            <xsl:value-of select="$hexcolor"/>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>#000</xsl:text>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <!-- Plot the line -->
    <polyline id="plotsvg" style="fill:none; stroke:{$linecol};stroke-width:3; background-color:white">
        <xsl:attribute name="points">
            <xsl:for-each select=".//mesure">
   	        <xsl:sort select="../@millesime"/>
  	        <xsl:sort select="@mois"/>

                <xsl:value-of select="$init-x -10 + position()*$width div $nbMes"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$height+$init-y - satisfaction*$height*(10 div ($maxsatisf)) div 10"/>
                <xsl:text> </xsl:text>
            </xsl:for-each>
        </xsl:attribute>
    </polyline>

</g>
</svg>
</div>
<!-- fin graphique SVG -->


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
