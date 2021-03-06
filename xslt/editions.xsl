<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="no" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:import href="partials/html_title_navigation.xsl"/>
    <xsl:import href="partials/osd-container.xsl"/>
    <xsl:import href="partials/tei-facsimile.xsl"/>
    <xsl:import href="partials/view-pagination.xsl"/>
    <xsl:import href="partials/view-type.xsl"/>
    <xsl:import href="partials/annotation-options.xsl"/>
    <xsl:import href="partials/edition-metadata.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@level='a'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <xsl:call-template name="html_head">
                    <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
                </xsl:call-template>                
                <meta name="Date of publication" class="staticSearch_date">
                    <xsl:choose>
                        <xsl:when test="//tei:origin/tei:origDate/@notBefore">
                            <xsl:attribute name="content">
                                <xsl:value-of select="//tei:origin/tei:origDate/@notBefore"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:when test="//tei:origin/tei:origDate/@when-iso">
                            <xsl:attribute name="content">
                                <xsl:value-of select="//tei:origin/tei:origDate/@when-iso"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="content">
                                <xsl:value-of select="//tei:origin/tei:origDate"/>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>                    
                </meta>
                <meta name="docImage" class="staticSearch_docImage">
                    <xsl:attribute name="content">
                        <xsl:variable name="iiif-ext" select="'.jp2/full/,200/0/default.jpg'"/> 
                        <xsl:variable name="iiif-domain" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/amp/'"/>
                        <xsl:variable name="facs_id" select="concat(@type, '_img_', generate-id())"/>
                        <xsl:variable name="facs_item" select="tokenize(//tei:pb[1]/@facs, '/')[5]"/>                        
                        <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                    </xsl:attribute>
                </meta>
                <meta name="docTitle" class="staticSearch_docTitle">
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:titleStmt/tei:title[@level='a']"/>
                    </xsl:attribute>
                </meta>
                <style>
                    .transcript {
                        padding: 1em 0;
                    }
                    /*.text-re::before {
                        content: '';
                        background-color: #ccc;
                        right: .05em;
                        width: 10px;
                        height: 100%;
                        position:absolute;
                        border-top: 10px solid ccc;
                    }*/
                    .card-body {
                        padding: 4em 1em;
                    }
                    .container-fluid {
                        max-width: 100%;
                    }
                </style>
                               
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <div class="card">
                            <div class="card-body" style="padding: .5em 0 0 0 !important;">
                                
                                <xsl:call-template name="header-nav"/>
                                
                                <!--   adding arche metadata for each edition   -->
                                <xsl:call-template name="edition-md">
                                    <xsl:with-param name="doc_title" select="$doc_title"/>
                                </xsl:call-template>
                                
                                <!--   adding annotation view and options   -->
                                <xsl:call-template name="annotation-options"/>
                                
                            </div>
                            
                            <!--   add edition text and facsimile   -->
                             <xsl:for-each select="//tei:div[@xml:id='transcription']">                                             
                                 
                                 <xsl:call-template name="view-type-img"/>
    
                             </xsl:for-each>     
                            
                        </div><!-- .card -->
                    </div><!-- .container-fluid -->
                    <xsl:call-template name="html_footer"/>
                </div><!-- .site -->  
                <script type="text/javascript" src="js/pagination-sync.js"></script>
                <script type="text/javascript" src="js/edition-view-functions.js"></script> 
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.2/openseadragon.min.js"></script>
                <script type="text/javascript" src="js/osd_single.js"></script>
            </body>
        </html>
    </xsl:template>
                    
    <xsl:template match="tei:lb">
        <br/>        
    </xsl:template>
    <xsl:template match="tei:lg">
        <span style="display:block;margin: 1em 0;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:l">
        <xsl:apply-templates/><br />
    </xsl:template>
    <xsl:template match="tei:unclear">
        <span class="abbr" alt="unclear">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>
    <xsl:template match="tei:space">
        <span class="space">
            <xsl:value-of select="string-join((for $i in 1 to @quantity return '&#x00A0;'),'')"/>
        </span>
    </xsl:template>
    <xsl:template match="tei:del">
        <span class="del fade"><xsl:apply-templates/></span>      
    </xsl:template> 
    <xsl:template match="tei:gap">
        <xsl:choose>
            <xsl:when test="@reason='deleted'">
                <span class="del gap">
                    <xsl:attribute name="alt">
                        <xsl:value-of select="data(@reason)"/>
                    </xsl:attribute>
                    <xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
                </span>                
            </xsl:when>
            <xsl:when test="@reason='illegible'">
                <span class="gap">
                    <xsl:attribute name="alt">
                        <xsl:value-of select="data(@reason)"/>
                    </xsl:attribute>
                    <xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
                </span>
            </xsl:when>
        </xsl:choose> 
    </xsl:template>
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend='underline'">
                <span class="hi-underline italic">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:when test="@rend='italic'">
                <span class="italic">
                    <xsl:apply-templates/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
