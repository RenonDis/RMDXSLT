<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:output method="html" encoding="utf-8"/>


<xsl:template match='ponctualite-transilien'>
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr" lang="fr">
		<head>
			<link rel="stylesheet" type="text/css" href="question-1.css"/>
		</head> 
		<body>
			<xsl:apply-templates></xsl:apply-templates>
		</body>
	</html>
</xsl:template>



<xsl:template match='ligne'>
	<table>
		<tr>
			<th>Date
			</th>

			<th>Mesure
			</th>

			<th>Satisfaction
			</th>
		</tr>
		<xsl:apply-templates></xsl:apply-templates>
	</table>
</xsl:template>

 <!--Choix ici : on ne met pas match = 'mesure|ponctualite' pour n'ajouter qu'une seule fois la date-->
<xsl:template match='mesure'>
	<tr>
		<xsl:apply-templates></xsl:apply-templates>
	</tr>
</xsl:template>


<xsl:template match='ponctualite'> 
	<td>
		<xsl:value-of select="../../@millesime"/>-<xsl:value-of select="../@mois"/>
	</td>

	<td>
		<xsl:value-of select="substring(.,1,4)"/>
	</td>
</xsl:template>


<xsl:template match='satisfaction'>
	<td>
			<xsl:apply-templates></xsl:apply-templates>
	</td>
</xsl:template>

</xsl:stylesheet>
