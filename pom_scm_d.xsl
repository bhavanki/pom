<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:mvn="http://maven.apache.org/POM/4.0.0">
  <xsl:output method="text" media-type="text/plain" />
  <xsl:variable name="nl">
    <xsl:text>
</xsl:text>
  </xsl:variable>

  <xsl:template match="mvn:project">
    <xsl:apply-templates select="mvn:scm" />
  </xsl:template>
  <xsl:template match="mvn:scm">
    <xsl:apply-templates select="mvn:developerConnection" />
  </xsl:template>
  <xsl:template match="mvn:developerConnection">
    <xsl:value-of select="." /><xsl:copy-of select="$nl" />
  </xsl:template>
</xsl:stylesheet>
