<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget tei-facsimile.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>The template "view-pagination" creates a pagintion based on items position.</p> 
            <p>Bootstrap is required.</p>
        </desc>    
    </doc>
    
    <xsl:template name="view-pagination">
        <xsl:variable 
            name="vseq" 
            select="//tei:pb"
            as="item()*"/>
        
        <div class="text-center pagination">
            <ul class="nav nav-tabs">
                <xsl:for-each select="$vseq">
                    <!--  var to create container ids to insert facsimiles to one individual container each   -->
                    <xsl:variable name="osd_container_id" select="concat(@type, '_container_', position())"/>
                    <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', position())"/>
                    <xsl:variable name="iiif-ext" select="'.jp2/full/full/0/default.jpg'"/> 
                    <xsl:variable name="iiif-domain" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/amp/'"/>
                    <xsl:variable name="facs_id" select="concat(@type, '_img_', position())"/>
                    <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/>   
                    <xsl:choose>
                        <xsl:when test="position() = 1">
                            <li class="nav-item">
                                <a                                   
                                    title="{position()}"
                                    class="nav-link active sync"
                                    data-toggle="tab"
                                    data-tab="paginate"
                                    href="#paginate-{position()}"
                                    style="border-radius:30px;">
                                    <xsl:value-of select="position()"/> 
                                </a>                                                    
                            </li>
                        </xsl:when>
                        <xsl:when test="position() = [1,2,3,4,5,6,7,8,9]">
                            <li class="nav-item">
                                <a
                                    onclick="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'),$( document ).ready(resize('{position()}'))]"
                                    title="{position()}"
                                    class="nav-link sync"
                                    data-toggle="tab"
                                    data-tab="paginate"
                                    href="#paginate-{position()}"
                                    style="border-radius:30px;">
                                    <xsl:value-of select="position()"/> 
                                </a>                                                    
                            </li>
                        </xsl:when>
                        <xsl:when test="position() = 10">
                            <li class="nav-item dropdown">
                                <a
                                    title="more"
                                    href="#"
                                    data-toggle="dropdown"
                                    data-tab="paginate"
                                    class="nav-link dropdown-toggle"
                                    style="border-radius:30px;"
                                    >
                                    more <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <xsl:for-each select="$vseq">
                                        <xsl:variable name="osd_container_id" select="concat(@type, '_container_', position())"/>
                                        <xsl:variable name="osd_container_id2" select="concat(@type, '_container2_', position())"/>
                                        <xsl:variable name="facs_id" select="concat(@type, '_img_', position())"/>
                                        <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/> 
                                        <xsl:choose>
                                            <xsl:when test="position() > 9">
                                                <li
                                                    class="nav-item dropdown-submenu"
                                                    style="display:inline-block;">
                                                    <a
                                                        onclick="[load_image('{$facs_id}','{$osd_container_id}','{$osd_container_id2}'),$( document ).ready(resize('{position()}'))]"
                                                        title="{position()}"
                                                        href="#paginate-{position()}"
                                                        class="nav-link sync"
                                                        data-tab="paginate"
                                                        data-toggle="tab"
                                                        style="border-radius:30px;">
                                                        <xsl:value-of select="position()"/>
                                                    </a>
                                                </li>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>                                                                                                                
                                </ul>                                
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--<li class="nav-item" style="display:none;">
                                <a
                                    title="{position()}"
                                    class="nav-link btn btn-round btn-backlink"
                                    data-toggle="tab"
                                    href="#diplomatic-paginate-{position()}"
                                    ><xsl:value-of select="position()"/> 
                                </a>                                                    
                            </li>-->
                        </xsl:otherwise>
                    </xsl:choose>                                                                                                        
                </xsl:for-each>                                                                                                
            </ul>            
        </div>
        
    </xsl:template> 
</xsl:stylesheet>