<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

<xsl:output method="html" encoding="utf-8"/>

<xsl:template match='ponctualite-transilien'>
	'&lt;?xml-stylesheet href="style_trains.css" type="text/css"?&gt;'
	<xsl:apply-templates></xsl:apply-templates>
</xsl:template>


<xsl:template match='ponctualite-transilien'>
	<html>
		<body>
			<xsl:apply-templates></xsl:apply-templates>
		</body>
	</html>
</xsl:template>



<xsl:template match='ligne'>
	<table>
		<tr>
			<th>Mesure
			</th>
			<th>Satisfaction
			</th>
		</tr>
		<xsl:apply-templates></xsl:apply-templates>
	</table>
</xsl:template>


<xsl:template match='mesure'>
	<tr>
			<xsl:apply-templates></xsl:apply-templates>
	</tr>
</xsl:template>

<xsl:template match='ponctualite|satisfaction'>
	<td>
			<xsl:apply-templates></xsl:apply-templates>
	</td>
</xsl:template>

</xsl:stylesheet>
