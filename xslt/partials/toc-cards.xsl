<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>

    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-cards.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "toc-cards" creats a card view of items from a collection</p>
            <p>Bootstrap is required.</p>
        </desc>
    </doc>
    
    <xsl:include href="toc-cards-content.xsl"/>

    <xsl:template name="toc-cards">
        <xsl:param name="category"></xsl:param>
        <xsl:param name="max_date"></xsl:param>
        <xsl:param name="low_date"></xsl:param>
        <xsl:variable name="cat-norm" select="if($category = 'correspondence-cvl') 
                                              then(substring-before($category, '-cvl')) 
                                              else($category)"/>
        
        <xsl:for-each select="collection(concat('../../data/editions/', $cat-norm))//tei:TEI">
            <xsl:sort select="//tei:origDate/@notBefore"/>
            <xsl:variable name="doc_date" 
                          as="xs:date" 
                          select="xs:date(if(//tei:origDate/@notBefore) then(//tei:origDate/@notBefore) else ('1996-12-31'))"/>
            <xsl:variable name="doc_date_cvl" 
                as="xs:date" 
                select="xs:date(if(//tei:origDate/@notAfter) then(//tei:origDate/@notAfter) else ('1996-12-31'))"/>
            <xsl:if test="$doc_date lt $max_date and $doc_date gt $low_date and $category != 'correspondence-cvl'">
                <xsl:call-template name="toc-cards-content"/>
            </xsl:if>
            <xsl:if test="$doc_date_cvl = $max_date or $doc_date_cvl = $low_date and $category = 'correspondence-cvl'">
                <xsl:call-template name="toc-cards-content"/>
            </xsl:if>
        </xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>