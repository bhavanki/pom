<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:mvn="http://maven.apache.org/POM/4.0.0">
  <xsl:output method="text" media-type="text/plain" />
  <xsl:variable name="nl">
    <xsl:text>
</xsl:text>
  </xsl:variable>

  <xsl:template match="mvn:project">
    <xsl:apply-templates select="mvn:parent | mvn:groupId" />
    <xsl:apply-templates select="mvn:artifactId" />
    <xsl:apply-templates select="mvn:version" />
    <xsl:choose>
      <xsl:when test="mvn:packaging">
        <xsl:value-of select="mvn:packaging" />
      </xsl:when>
      <xsl:otherwise>jar</xsl:otherwise>
    </xsl:choose>
    <xsl:copy-of select="$nl" />
  </xsl:template>
  <xsl:template match="mvn:parent">
    <xsl:apply-templates select="mvn:groupId" />
  </xsl:template>
  <xsl:template match="mvn:groupId">
    <xsl:value-of select="." />:</xsl:template>
  <xsl:template match="mvn:artifactId">
    <xsl:value-of select="." />:</xsl:template>
  <xsl:template match="mvn:version">
    <xsl:value-of select="." />:</xsl:template>
</xsl:stylesheet>
