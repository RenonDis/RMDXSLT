<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:output method="html" encoding="utf-8"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>


<xsl:template match='ponctualite-transilien'>
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr" >
		<head>			
			<title>Retard des transiliens</title>
			<link rel="stylesheet" type="text/css" href="question-1.css"/>
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
		<xsl:value-of select="../../@millesime"/>-<xsl:value-of select="../@mois"/>
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
