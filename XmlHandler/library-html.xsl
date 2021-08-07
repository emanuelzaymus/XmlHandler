<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes'/>
	<xsl:template match="/">
		<html>
			<body>
				<h2>Library Content</h2>
				<table border="1">
					<tr bgcolor="lightblue">
						<th align="left">Title</th>
						<th align="left">Author</th>
						<th align="left">Language</th>
						<th align="left">Publisher</th>
						<th align="left">Year</th>
						<th align="left">Available</th>
					</tr>
					<xsl:for-each select="library/book">
						<xsl:sort select="year"/>
						<tr>
							<td>
								<xsl:value-of select="title"/>
							</td>
							<td>
								<xsl:value-of select="author"/>
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="language = 'Slovak'">
										<strong>
											<xsl:value-of select="language"/>
										</strong>
									</xsl:when>
									<xsl:otherwise>
										<i>
											<xsl:value-of select="language"/>
										</i>
									</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
								<xsl:value-of select="publisher"/>
							</td>
							<xsl:choose>
								<xsl:when test="year &gt; 2000">
									<td bgcolor="lightgreen">
										<xsl:value-of select="year"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td>
										<xsl:value-of select="year"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
							<td>
								<xsl:value-of select="available"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
