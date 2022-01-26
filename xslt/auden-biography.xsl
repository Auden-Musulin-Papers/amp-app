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
    <xsl:import href="partials/biography-el.xsl"/>
    <xsl:import href="partials/biography-circle.xsl"/>
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
                
                <meta name="docImage" class="staticSearch_docImage">
                    <xsl:attribute name="content">
                        <xsl:value-of select="concat(//tei:pb[1]/@facs, 'full/full/0/default.jpg')"/>
                    </xsl:attribute>
                </meta>
                <meta name="docTitle" class="staticSearch_docTitle">
                    <xsl:attribute name="content">
                        <xsl:value-of select="//tei:titleStmt/tei:title[@level='a']"/>
                    </xsl:attribute>
                </meta>
                <style>

                </style>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <div class="card" style="margin-top:2em;">
                            <div class="card-body text-center">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                                <ul style="margin-top:1em;">
                                    <xsl:for-each-group select="//tei:event" group-by="tokenize(./tei:head/tei:date/@when, '-')[1]">                                    
                                        <li style="display:inline;list-style:none;margin-left:1em;">
                                            <a href="#{current-grouping-key()}" title="jump to date">
                                                <xsl:value-of select="current-grouping-key()"/>
                                            </a>
                                        </li>
                                    </xsl:for-each-group>
                                </ul>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">                                
                                <xsl:for-each-group select="//tei:event" group-by="tokenize(./tei:head/tei:date/@when, '-')[1]">                                    
                                    <xsl:variable name="panel-id" select="concat(generate-id(), '-', position())"/>
                                    <xsl:variable name="img" select="concat(@facs, 'full/full/0/default.jpg')"/>                                    
                                    <div class="timeline-wrapper" id="{current-grouping-key()}" style="padding-top:5em;">
                                        <div class="text-center">                                            
                                            <h2 id="timeline-heading">
                                                <a href="#page" title="jump to the top" style="color:#fff;">
                                                    <xsl:value-of select="current-grouping-key()"/>
                                                </a>                                                
                                            </h2>
                                        </div>   
                                        <xsl:for-each select="current-group()">
                                            <div class="row timeline">                                            
                                                <xsl:choose>
                                                    <xsl:when test="@type='correspondence'">                                                        
                                                        <div class="col-md-5">    
                                                            <xsl:call-template name="bio-el">
                                                                <xsl:with-param name="img" select="$img"/>
                                                                <xsl:with-param name="location" select="'left'"/>
                                                            </xsl:call-template>
                                                        </div>  
                                                        <div class="col-md-2">
                                                            <xsl:call-template name="bio-circle"/>
                                                        </div>                                                                
                                                        <div class="col-md-5">
                                                            <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                                <div class="card-body">
                                                                    
                                                                </div>                                                                    
                                                            </div>-->
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:when test="@type='additional-materials'">
                                                        <div class="col-md-5">
                                                            <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                                <div class="card-body">
                                                                    
                                                                </div>                                                                    
                                                            </div>-->
                                                        </div>                                                                
                                                        <div class="col-md-2">
                                                            <xsl:call-template name="bio-circle"/>
                                                        </div>                                                                
                                                        <div class="col-md-5">    
                                                            <xsl:call-template name="bio-el">
                                                                <xsl:with-param name="img" select="$img"/>
                                                                <xsl:with-param name="location" select="'right'"/>
                                                            </xsl:call-template>
                                                        </div>                                                                
                                                    </xsl:when>
                                                    <xsl:when test="@type='photos'">
                                                        <div class="col-md-5">
                                                            <!--<div class="card timeline-panel" style="border:1px solid #615a60;">
                                                                <div class="card-body">
                                                                    
                                                                </div>                                                                    
                                                            </div>-->
                                                        </div>
                                                        <div class="col-md-2">
                                                            <xsl:call-template name="bio-circle"/>
                                                        </div>
                                                        <div class="col-md-5">    
                                                            <xsl:call-template name="bio-el">
                                                                <xsl:with-param name="img" select="$img"/>
                                                                <xsl:with-param name="location" select="'right'"/>
                                                            </xsl:call-template>
                                                        </div>                                                            
                                                    </xsl:when>
                                                </xsl:choose>
                                            </div>  
                                        </xsl:for-each>
                                    </div>
                                </xsl:for-each-group> 
                                <script type="text/javascript">
                                    $('.timeline-circle').mouseover(function() {                                        
                                        var date = $(this).attr('data');
                                        $(this).html(date);                                        
                                    });
                                    $('.timeline-circle').mouseout(function() {
                                        $(this).html("");
                                    });
                                </script>
                                <script type="text/javascript">
                                    $(document).on('click', 'a[href^="#"]', function (event) {
                                        event.preventDefault();
                                    
                                        $('html, body').animate({
                                            scrollTop: $($.attr(this, 'href')).offset().top
                                        }, 500);
                                    });
                                </script>
                            </div>                                                                        
                        </div>
                                                        
                        
                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>                
            </body>
        </html>
    </xsl:template>
                    
    
</xsl:stylesheet>