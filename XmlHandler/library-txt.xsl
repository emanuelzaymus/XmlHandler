<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method='text' />


	<xsl:template match="/">
		Library Content
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="book">
		Book (id-<xsl:value-of select="@id"/>)
		<xsl:apply-templates select="title"/>
		<xsl:apply-templates select="author"/>
		<xsl:apply-templates select="language"/>
		<xsl:apply-templates select="publisher"/>
		<xsl:apply-templates select="year"/>
	</xsl:template>

	<xsl:template match="title">
		<xsl:text>Title:</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text>&#10;		</xsl:text>
	</xsl:template>

	<xsl:template match="author">
		<xsl:text>Author:</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text>&#10;		</xsl:text>
	</xsl:template>

	<xsl:template match="language">
		<xsl:text>Language:</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text>&#10;		</xsl:text>
	</xsl:template>

	<xsl:template match="publisher">
		<xsl:text>Publisher:</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text>&#10;		</xsl:text>
	</xsl:template>

	<xsl:template match="year">
		<xsl:text>Year:</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text>&#10;		</xsl:text>
	</xsl:template>

</xsl:stylesheet>
