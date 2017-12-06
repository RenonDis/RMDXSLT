<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" encoding="utf-8" indent="yes"/>

<xsl:variable name="couleurs" select="document('code-couleur-transilien.xml')"/>
<xsl:variable name="colignes" select="$couleurs/code-couleur-transilien"/>

<xsl:template match="@* | node()">
  <xsl:copy>
    <xsl:apply-templates select="@* | node()"/>
  </xsl:copy>
</xsl:template>


<xsl:template match="ponctualite-transilien">
  <xsl:copy>
    <xsl:copy-of select="$colignes"/>
    <xsl:apply-templates select="@* | node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>
