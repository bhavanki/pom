<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:mvn="http://maven.apache.org/POM/4.0.0">
  <xsl:output method="text" media-type="text/plain" />
  <xsl:variable name="nl">
    <xsl:text>
</xsl:text>
  </xsl:variable>

  <xsl:template match="mvn:project">
    <xsl:apply-templates select="mvn:profiles" />
  </xsl:template>
  <xsl:template match="mvn:profiles">
    <xsl:apply-templates select="mvn:profile" />
  </xsl:template>

  <xsl:template match="mvn:profile">
    <xsl:text>Profile: </xsl:text>
    <xsl:value-of select="mvn:id" /><xsl:copy-of select="$nl" />
    <xsl:apply-templates select="mvn:activation" />
    <xsl:copy-of select="$nl" />
  </xsl:template>
  <xsl:template match="mvn:activation">
    <xsl:if test="string(mvn:activeByDefault)='true'">
      <xsl:text>  active by default</xsl:text><xsl:copy-of select="$nl" />
    </xsl:if>
    <xsl:apply-templates select="mvn:jdk" />
    <xsl:apply-templates select="mvn:os" />
    <xsl:apply-templates select="mvn:property" />
    <xsl:apply-templates select="mvn:file" />
  </xsl:template>
  <xsl:template match="mvn:jdk">
    <xsl:text>  active for JDK </xsl:text><xsl:value-of select="." />
    <xsl:copy-of select="$nl" />
  </xsl:template>
  <xsl:template match="mvn:os">
    <xsl:text>  active for OS </xsl:text>
    <xsl:if test="count(mvn:name)>0">
      <xsl:text> name </xsl:text><xsl:value-of select="mvn:name" />
    </xsl:if>
    <xsl:if test="count(mvn:family)>0">
      <xsl:text> family </xsl:text><xsl:value-of select="mvn:family" />
    </xsl:if>
    <xsl:if test="count(mvn:arch)>0">
      <xsl:text> architecture </xsl:text><xsl:value-of select="mvn:arch" />
    </xsl:if>
    <xsl:if test="count(mvn:version)>0">
      <xsl:text> version </xsl:text><xsl:value-of select="mvn:version" />
    </xsl:if>
    <xsl:copy-of select="$nl" />
  </xsl:template>
  <xsl:template match="mvn:property">
    <xsl:text>  active for system property </xsl:text>
    <xsl:value-of select="mvn:name" />
    <xsl:if test="count(mvn:value)>0">
      <xsl:text> = </xsl:text><xsl:value-of select="mvn:value" />
    </xsl:if>
    <xsl:copy-of select="$nl" />
  </xsl:template>
  <xsl:template match="mvn:file">
    <xsl:text>  active when file </xsl:text>
    <xsl:if test="count(mvn:exists)>0">
      <xsl:value-of select="mvn:exists" />
      <xsl:text> exists</xsl:text>
    </xsl:if>
    <xsl:if test="count(mvn:missing)>0">
      <xsl:value-of select="mvn:missing" />
      <xsl:text> is missing</xsl:text>
    </xsl:if>
    <xsl:copy-of select="$nl" />
  </xsl:template>
</xsl:stylesheet>
