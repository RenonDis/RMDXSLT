<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:output method="html" encoding="utf-8"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


<xsl:template match='ponctualite-transilien'>
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr" >
		<head>			
			<title>Retard des transiliens</title>
		</head>
		<body>
			<xsl:apply-templates></xsl:apply-templates>
		</body>
	</html>
</xsl:template>



<xsl:template match='ligne'>
	<table xmlns="http://www.w3.org/1999/xhtml" >
		<tr xmlns="http://www.w3.org/1999/xhtml" >
			<th xmlns="http://www.w3.org/1999/xhtml" >Date
			</th>

			<th>Mesure
			</th>

			<th>Satisfaction
			</th>
		</tr>
		<xsl:apply-templates></xsl:apply-templates>
	</table>
</xsl:template>



<xsl:template match='mesure'>
	<tr xmlns="http://www.w3.org/1999/xhtml" >
		<xsl:apply-templates></xsl:apply-templates>
	</tr>
</xsl:template>


<xsl:template match='ponctualite'> 
	<td xmlns="http://www.w3.org/1999/xhtml" >
		<xsl:choose>
			<xsl:when test="../@mois = '01'"> Janvier </xsl:when>
			<xsl:when test="../@mois = '02'"> Fevrier </xsl:when>
			<xsl:when test="../@mois = '03'"> Mars </xsl:when>
			<xsl:when test="../@mois = '04'"> Avril </xsl:when>
			<xsl:when test="../@mois = '05'"> Mai </xsl:when>
			<xsl:when test="../@mois = '06'"> Juin </xsl:when>
			<xsl:when test="../@mois = '07'"> Juillet </xsl:when>
			<xsl:when test="../@mois = '08'"> Août </xsl:when>
			<xsl:when test="../@mois = '09'"> Septmbre </xsl:when>
			<xsl:when test="../@mois = '10'"> Octobre </xsl:when>
			<xsl:when test="../@mois = '11'"> Novembre </xsl:when>
			<xsl:when test="../@mois = '12'"> Décembre</xsl:when>
		</xsl:choose>

		<xsl:value-of select="../../@millesime"/>
	</td>

	<td xmlns="http://www.w3.org/1999/xhtml" >
		<xsl:value-of select="substring(.,1,4)"/>
	</td>
</xsl:template>


<xsl:template match='satisfaction'>
	<td xmlns="http://www.w3.org/1999/xhtml" >
			<xsl:apply-templates></xsl:apply-templates>
	</td>
</xsl:template>

</xsl:stylesheet>
