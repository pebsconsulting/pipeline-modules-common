<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="#all" version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pf="http://www.daisy.org/ns/pipeline/functions"
    xmlns:d="http://www.daisy.org/ns/pipeline/data" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xsl:import href="http://www.daisy.org/pipeline/modules/file-utils/library.xsl"/>

    <xsl:param name="new-base" required="yes"/>

    <xsl:template match="/*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="xml:base" select="$new-base"/>
            <xsl:for-each select="d:file">
                <xsl:copy>
                    <xsl:copy-of select="@*[not(name()='xml:base')]"/>

                    <xsl:if test="@xml:base">
                        <!-- make sure that href is relative to the fileset base -->
                        <xsl:attribute name="href" select="pf:relativize-uri(resolve-uri(@href,base-uri(.)),base-uri(/*))"/>
                    </xsl:if>

                    <xsl:if test="@original-href">
                        <!-- make sure that original-href is absolute -->
                        <xsl:attribute name="original-href" select="resolve-uri(@original-href, base-uri(.))"/>
                    </xsl:if>

                    <xsl:copy-of select="node()"/>

                </xsl:copy>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
