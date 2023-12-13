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
    <xsl:import href="partials/correspDesc.xsl"/>

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
                    mark{
                        background: orange;
                        color: black;
                    }
                </style>
            </head>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    
                    <div class="container-fluid">  
                        <div class="card">
                            <div class="editor-options">
                                <div class="card-footer editor-back-link">
                                    <a alt="Internal Link to the Table of Contents" class="btn-back-link">
                                        <xsl:variable name="doc_type" select="//tei:text/@type"/>
                                        <xsl:variable name="max_date" select="xs:date('1973-12-31')"></xsl:variable>
                                        <xsl:variable name="low_date" select="xs:date('1958-12-31')"></xsl:variable>
                                        <xsl:variable name="max_date_am" select="xs:date('1996-01-01')"/>
                                        <xsl:variable name="low_date_am" select="xs:date('1975-12-31')"/>
                                        <xsl:variable name="doc_date" 
                                            as="xs:date" 
                                            select="xs:date(if(substring-before(//tei:origDate/@notBefore-iso, 'T')) then(substring-before(//tei:origDate/@notBefore-iso, 'T')) else ('1996-12-31'))"/>
                                        <xsl:attribute name="href">
                                            <xsl:if test="$doc_date lt $max_date_am and $doc_date gt $low_date_am and $doc_type != 'photograph'">
                                                <xsl:text>toc_m.html</xsl:text>
                                            </xsl:if>
                                            <xsl:if test="$doc_date lt $max_date and $doc_date gt $low_date and $doc_type != 'photograph'">
                                                <xsl:text>toc.html</xsl:text>
                                            </xsl:if>
                                            <xsl:if test="$doc_type = 'photograph'">
                                                <xsl:text>photos.html</xsl:text>
                                            </xsl:if>
                                            
                                        </xsl:attribute>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
                                            <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1"/>
                                        </svg>
                                    </a>
                                </div>
                                <div class="card-footer editor-btns-wrapper">
                                    <ul class="editor-btns">
                                        <li class="edition-doc-search">
                                            <input type="checkbox" name="opt[]" value="separateWordSearch" checked="checked"/> separate word search
                                            <input type="text" name="keyword" placeholder="enter keyword..."/>
                                        </li>
                                        <li >
                                            <font-size opt="fos"></font-size>
                                        </li>
                                        <li >
                                            <font-family opt="ff"></font-family>
                                        </li>
                                        <li>
                                            <image-switch opt="es"></image-switch>
                                        </li>
                                        <li>
                                            <full-size opt="fs"></full-size>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body" style="padding: .5em 0 0 0 !important;">
                                
                                <xsl:call-template name="header-nav"/>
                                
                            </div>
                            <div class="card-body" style="padding: 1em;">
                                <div class="accordion accordion-flush" id="accordionFlushAot">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button show" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                                Additional Text Information
                                            </button>
                                        </h2>
                                        <div id="flush-collapseOne" class="accordion-collapse show" data-bs-parent="#accordionFlush">
                                            <div class="accordion-body">
                                                <xsl:call-template name="annotation-options"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                                Metadata
                                            </button>
                                        </h2>
                                        <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlush">
                                            <div class="accordion-body">
                                                <xsl:call-template name="edition-md">
                                                    <xsl:with-param name="doc_title" select="$doc_title"/>
                                                </xsl:call-template>
                                            </div>
                                        </div>
                                    </div>
                                    <xsl:if test="//tei:correspDesc">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                                    Correspondence Description
                                                </button>
                                            </h2>
                                            <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlush">
                                                <div class="accordion-body">
                                                    <xsl:call-template name="correspDesc"/>
                                                </div>
                                            </div>
                                        </div>
                                    </xsl:if>
                                </div>
                                
                            </div>
                            <!--   add edition text and facsimile   -->
                            <xsl:for-each select="//tei:body/tei:div[@type='transcription' or @xml:id='transcription']">                           
                                 <xsl:call-template name="view-type-img"/>
                            </xsl:for-each>
                        </div><!-- .card -->
                        <xsl:for-each select="//tei:back">
                            <div class="tei-back">
                                <xsl:apply-templates/>
                                <xsl:call-template name="interp"/>
                            </div>
                        </xsl:for-each>
                    </div><!-- .container-fluid -->
                    <xsl:call-template name="html_footer"/>
                </div><!-- .site -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/4.1.0/openseadragon.min.js"></script>
                <script src="https://unpkg.com/de-micro-editor@0.3.0/dist/de-editor.min.js"></script>
                <!--<script src="js/dist/de-editor.min.js"></script> -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/mark.js/8.11.1/mark.min.js"></script>
                <script type="text/javascript" src="js/run.js"></script>
                <!--<script type="text/javascript" src="js/hide-md.js"></script>-->
                <script type="text/javascript" src="js/mark.js"></script>
                <script type="text/javascript" src="js/prev-next-urlupdate.js"></script>
                <script type="text/javascript" src="js/commentary.js"></script>
            </body>
        </html>
    </xsl:template>
    
    <!--<xsl:template match="tei:note">
        <xsl:choose>
            <xsl:when test="@type='footnote'">
                <!-\-<span class="footnote_anchor" id="{@xml:id}_inline"></span>-\->
                <sup><a href="#{@xml:id}_inline" id="{@xml:id}" title="footnote {@n}"><xsl:value-of select="@n"/></a></sup>
            </xsl:when>
            <xsl:when test="@type='endnote'">
                <xsl:variable name="place" select="7"/>
                <!-\-<xsl:variable name="place" select="tokenize(@place, '\s')[last()]"/>-\->
                <sup><a href="?tab={$place}#{@xml:id}_inline" id="{@xml:id}" title="endnote {@n}"><xsl:value-of select="@n"/></a></sup>
            </xsl:when>
            <xsl:otherwise>
                <sup><a href="#{@xml:id}_inline" id="{@xml:id}" title="note {@n}"><xsl:value-of select="@n"/></a></sup>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
    <xsl:template match="tei:head">
        <xsl:variable name="hand" select="@hand"/>
        <h5 class="yes-index {
            if ($hand = '#handwritten') then
            ('handwritten') else if ($hand = '#typed') then
            ('typed') else if ($hand = '#printed') then
            ('printed') else if ($hand = '#stamp') then
            ('text-align:center;font-weight:bold;letter-spacing:.2em;') else ()
            }"><xsl:apply-templates/></h5>
    </xsl:template>
    
    <xsl:template match="tei:address">
        <span class="p-like">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:seg">
        <xsl:choose>
            <xsl:when test="@hand">
                <span class="segment {substring-after(@hand, '#')}"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:otherwise>
                <span class="segment"><xsl:apply-templates/></span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:placeName[parent::tei:dateline]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:persName[parent::tei:dateline]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:ab">
        <xsl:variable name="hand" select="@hand"/>
        <p class="yes-index {
            if ($hand = '#handwritten') then
            ('handwritten') else if ($hand = '#typed') then
            ('typed') else if ($hand = '#printed') then
            ('printed') else if ($hand = '#stamp') then
            ('text-align:center;font-weight:bold;letter-spacing:.2em;') else ()
            }"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:p[@prev]">
        <!-- do not render handled in view-type.xsl -->
    </xsl:template>
    
    <xsl:template match="tei:p[not(@prev)]">
        <xsl:variable name="hand" select="@hand"/>
        <p class="yes-index {
            if ($hand = '#handwritten') then
            ('handwritten') else if ($hand = '#typed') then
            ('typed') else if ($hand = '#printed') then
            ('printed') else if ($hand = '#stamp') then
            ('text-align:center;font-weight:bold;letter-spacing:.2em;') else ()
            }"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:salute[parent::tei:opener]">
        <!--<span class="p-like">
            <xsl:apply-templates/>
        </span>-->
        <br/><br/><xsl:apply-templates/><br/>
    </xsl:template>
    
    <xsl:template match="tei:salute[parent::tei:closer]">
        <!--<span class="p-like">
            <xsl:apply-templates/>
        </span>-->
        <xsl:apply-templates/><br/><br/>
    </xsl:template>
    
    <xsl:template match="tei:opener">
        <p class="yes-index"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:closer[not(preceding-sibling::tei:p[@prev])]">
        <p class="yes-index"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:closer[preceding-sibling::tei:p[@prev]]">
        <!-- do not render handled in view-type.xsl -->
    </xsl:template>
    
    <xsl:template match="tei:signed">
        <!--<span class="p-like">
            <xsl:apply-templates/>
        </span>-->
        <xsl:apply-templates/><br/><br/>
    </xsl:template>
    
    <xsl:template match="tei:date[parent::tei:dateline]">
        <xsl:choose>
            <xsl:when test="@rend = '#block'">
                <span class="block"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:when test="@rend = '#inline'">
                <span class="inline"><xsl:apply-templates/></span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:unclear">
        <span class="abbr" alt="unclear">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>
    <xsl:template match="tei:space">
        <xsl:choose>
            <xsl:when test="@min">
                <span class="space">
                    <xsl:value-of select="string-join((for $i in 1 to @min return '&#x00A0;'),'')"/>
                </span>
            </xsl:when>
            <xsl:when test="@quantity">
                <span class="space">
                    <xsl:value-of select="string-join((for $i in 1 to @quantity return '&#x00A0;'),'')"/>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="tei:del">
        <span class="del" style="display:none;"><xsl:apply-templates/></span>      
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
    <xsl:template match="tei:rs">
        <xsl:choose>
            <xsl:when test="count(tokenize(@ref, ' ')) > 1">
                <xsl:call-template name="entity">
                    <xsl:with-param name="name" select="@type"/>
                    <xsl:with-param name="plural" select="'true'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="entity">
                    <xsl:with-param name="name" select="@type"/>
                    <xsl:with-param name="plural" select="'false'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@ana">
            <span class="interp ent" ref="{@ana}">
            </span>
        </xsl:if>
    </xsl:template>
    <xsl:template name="entity">
        <xsl:param name="name"/>
        <xsl:param name="plural"/>
        <xsl:choose>
            <xsl:when test="$plural='true'">
                <xsl:apply-templates/>
                <xsl:for-each select="tokenize(@ref, ' ')">
                    <sup class="{$name} entity" data-bs-toggle="modal" data-bs-target="{.}">
                    </sup>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <span class="{$name} ent" data-bs-toggle="modal" data-bs-target="{@ref}">
                </span>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="interp">
        <div id="commentary">
            <xsl:for-each select="//tei:interpGrp[ancestor::tei:editionStmt]/tei:interp">
                <xsl:variable name="id" select="@xml:id"/>
                <div class="fade-all interpComment" id="{$id}">
                    <div class="comment-header">
                        <button id="{$id}-button" type="button" class="btn-close btn-commentary" aria-label="Close"></button>
                    </div>
                    <div class="comment-body">
                        <h5><xsl:value-of select="ancestor::tei:TEI//node()[@ana=concat('#', $id)]/text()"/></h5>
                        <xsl:for-each select="./tei:desc">
                            <p><xsl:apply-templates/></p>
                        </xsl:for-each>
                        <ul>
                            <xsl:if test="./tei:respons">
                                <label>Uncertainty:</label>
                                <li>
                                    <label>Responsibility: <xsl:value-of select="./tei:respons/@resp"/></label>
                                </li>
                            </xsl:if>
                            <xsl:if test="./tei:certainty">
                                 <li>
                                    <label>Locus: <xsl:value-of select="./tei:certainty/@locus"/></label>
                                </li>
                                <li>
                                    <label>Confidence: <xsl:value-of select="./tei:certainty/@cert"/></label>
                                </li>
                            </xsl:if>
                        </ul>
                        <xsl:if test="@source">
                            <p style="margin-top: 1em;">External Evidence: <xsl:value-of select="@source"/></p>
                        </xsl:if>
                        
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="tei:listEvent[parent::tei:back]">
        <xsl:for-each select="./tei:event">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{./tei:label}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="./tei:label"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:ab[@type='participants']/tei:persName">
                                    <tr>
                                        <th>
                                            Participants
                                        </th>
                                        <td>
                                            <ul>
                                                <xsl:for-each select="./tei:ab[@type='participants']/tei:persName">
                                                    <li>
                                                        <a href="{@key}.html">
                                                            <xsl:value-of select="."/>
                                                        </a>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:ab/tei:placeName[@type='located_in_place']">
                                    <tr>
                                        <th>
                                            Located in
                                        </th>
                                        <td>
                                            <a href="{./tei:ab/tei:placeName[@type='located_in_place']/@key}.html">
                                                <xsl:value-of select="./tei:ab/tei:placeName[@type='located_in_place']"/>
                                            </a>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{@xml:id}.html">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listPlace[parent::tei:desc]">
        <ul>
            <xsl:for-each select="./tei:place">
                <li>
                    <a href="{@source}" target="_blank" alt="External Link to Geonames">
                        <xsl:value-of select="@source"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="tei:listEvent[parent::tei:desc]">
        <ul>
            <xsl:for-each select="./tei:event">
                <xsl:apply-templates/>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="tei:listBibl[parent::tei:desc]">
        <ul>
            <xsl:for-each select="./tei:bibl">
                <xsl:variable name="id" select="substring-after(@sameAs, '#')"/>
                <li>
                    <a href="{concat($id, '.html')}" alt="Internal Link to Literary Works">
                        <xsl:value-of select="//id(data($id))/tei:title"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="tei:listPerson[parent::tei:desc]">
        <ul>
            <xsl:for-each select="./tei:person">
                <xsl:variable name="id" select="substring-after(./tei:persName/@ref, '#')"/>
                <li>
                    <a href="{concat($id, '.html')}" alt="Internal Link to Persons">
                        <xsl:value-of select="//id(data($id))/tei:persName/tei:surname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="//id(data($id))/tei:persName/tei:forename"/>
                    </a>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="tei:listPerson[parent::tei:back]">
        <xsl:for-each select="./tei:person">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{concat(./tei:persName/tei:surname, ', ', ./tei:persName/tei:forename)}" aria-hidden="true">
                 <div class="modal-dialog modal-dialog-centered">
                     <div class="modal-content">
                         <div class="modal-header">
                             <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="concat(./tei:persName/tei:surname, ', ', ./tei:persName/tei:forename)"/></h1>
                             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                         </div>
                         <div class="modal-body">
                             <table>
                                 <tbody>
                                     <xsl:if test="./tei:birth/tei:date">
                                     <tr>
                                         <th>
                                             Birth
                                         </th>
                                         <td>
                                             <xsl:value-of select="./tei:birth/tei:date/@when-iso"/>
                                         </td>
                                     </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:death/tei:date">
                                     <tr>
                                         <th>
                                             Death
                                         </th>
                                         <td>
                                             <xsl:value-of select="./tei:death/tei:date/@when-iso"/>
                                         </td>
                                     </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:idno[@type='GND']/text()">
                                         <tr>
                                             <th>
                                                 GND
                                             </th>
                                             <td>
                                                 <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                     <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                 </a>
                                             </td>
                                         </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                         <tr>
                                             <th>
                                                 Wikidata
                                             </th>
                                             <td>
                                                 <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                     <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                 </a>
                                             </td>
                                         </tr>
                                     </xsl:if>
                                     <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                         <tr>
                                             <th>
                                                 Geonames
                                             </th>
                                             <td>
                                                 <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                     <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                 </a>
                                             </td>
                                         </tr>
                                     </xsl:if>
                                     <tr>
                                         <th>
                                             Read more
                                         </th>
                                         <td>
                                             <a href="{concat(@xml:id, '.html')}">
                                                 Detail Page
                                             </a>
                                         </td>
                                     </tr>
                                 </tbody>
                             </table>
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listPlace[parent::tei:back]">
        <xsl:for-each select="./tei:place">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="if(./tei:settlement) then(./tei:settlement/tei:placeName) else (./tei:placeName)"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:country">
                                    <tr>
                                        <th>
                                            Country
                                        </th>
                                        <td>
                                            <xsl:value-of select="./tei:country"/>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listOrg[parent::tei:back]">
        <xsl:for-each select="./tei:org">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{./tei:orgName}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="./tei:orgName"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:listBibl[parent::tei:back]">
        <xsl:for-each select="./tei:bibl">
            <div class="modal fade" id="{@xml:id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="{./tei:title}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel"><xsl:value-of select="./tei:title"/></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <table>
                                <tbody>
                                    <xsl:if test="./tei:author">
                                    <tr>
                                        <th>
                                            Author(s)
                                        </th>
                                        <td>
                                            <ul>
                                                <xsl:for-each select="./tei:author">
                                                    <li>
                                                        <a href="{@xml:id}.html">
                                                            <xsl:value-of select="./tei:persName"/>
                                                        </a>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </td>
                                    </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:date">
                                        <tr>
                                            <th>
                                                Date
                                            </th>
                                            <td>
                                                <xsl:value-of select="./tei:date/@when"/>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GND']/text()">
                                        <tr>
                                            <th>
                                                GND
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GND']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GND'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='WIKIDATA']/text()">
                                        <tr>
                                            <th>
                                                Wikidata
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='WIKIDATA']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='WIKIDATA'], '/')[last()]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="./tei:idno[@type='GEONAMES']/text()">
                                        <tr>
                                            <th>
                                                Geonames
                                            </th>
                                            <td>
                                                <a href="{./tei:idno[@type='GEONAMES']}" target="_blank">
                                                    <xsl:value-of select="tokenize(./tei:idno[@type='GEONAMES'], '/')[4]"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                    <tr>
                                        <th>
                                            Read more
                                        </th>
                                        <td>
                                            <a href="{concat(@xml:id, '.html')}">
                                                Detail Page
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:for-each>
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
    
    <xsl:template match="tei:handShift">
        <xsl:variable name="hand" select="'font-family: Times New Roman, serif; font-size: 22px;'"/>
        <xsl:variable name="typed" select="'font-family: Courier New, monospace; font-size: 18px;'"/>
        <xsl:variable name="printed" select="'font-family: Arial, serif; font-size: 18px;'"/>
        <xsl:choose>
            <xsl:when test="@new = '#handwritten'">
                <span class="handShift" style="{$hand}"/>
            </xsl:when>
            <xsl:when test="@new = '#typed'">
                <span class="handShift" style="{$typed}"/>
            </xsl:when>
            <xsl:when test="@new = '#printed'">
                <span class="handShift" style="{$printed}"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <br/>
        <!--<xsl:if test="not(ancestor::tei:note[@type='footnote'])">
            <xsl:if test="ancestor::tei:p[not(@hand='#stamp')]">
                <a>
                    <xsl:variable name="para" as="xs:int">
                        <xsl:number level="any" from="tei:body" count="tei:p"/>
                    </xsl:variable>
                    <xsl:variable name="lines" as="xs:int">
                        <xsl:number level="any" from="tei:body"/>
                    </xsl:variable>
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text><xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__p</xsl:text><xsl:value-of select="$para"/><xsl:text>__lb</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="name">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__p</xsl:text><xsl:value-of select="$para"/><xsl:text>__lb</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__p</xsl:text><xsl:value-of select="$para"/><xsl:text>__lb</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="($lines mod 5) = 0">
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersVisible linenumbers yes-index</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="data-lbnr">
                                <xsl:value-of select="$lines"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersTransparent linenumbers yes-index</xsl:text>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of select="format-number($lines, '0000')"/>
                </a>  
            </xsl:if>
        </xsl:if>-->
        
    </xsl:template>
    
    <xsl:template match="tei:lg">
        <xsl:variable name="hand" select="@hand"/>
        <xsl:variable name="hand2" select="parent::tei:div[@hand]/@hand"/>
        <xsl:choose>
            <xsl:when test="string-length($hand) > 0">
                <p class="yes-index {
                    if ($hand = '#handwritten') then
                    ('handwritten') else if ($hand = '#typed') then
                    ('typed') else if ($hand = '#printed') then
                    ('printed') else if ($hand = '#stamp') then
                    ('text-align:center;font-weight:bold;letter-spacing:.2em;') else ()
                    }" style="display:block;margin: 1em 0;">
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p class="yes-index {
                    if ($hand2 = '#handwritten') then
                    ('handwritten') else if ($hand2 = '#typed') then
                    ('typed') else if ($hand2 = '#printed') then
                    ('printed') else if ($hand2 = '#stamp') then
                    ('text-align:center;font-weight:bold;letter-spacing:.2em;') else ()
                    }" style="display:block;margin: 1em 0;">
                    <xsl:apply-templates/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="tei:l">
        <xsl:apply-templates/>
        <!--
        <xsl:choose>
            <xsl:when test="parent::tei:lg">
                <a>
                    <xsl:variable name="para" as="xs:int">
                        <xsl:number level="any" from="tei:div" count="tei:lg"/>
                    </xsl:variable>
                    <xsl:variable name="lines" as="xs:int">
                        <xsl:number level="any" from="tei:div" count="tei:l"/>
                    </xsl:variable>
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text><xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__lg</xsl:text><xsl:value-of select="$para"/><xsl:text>__vl</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="name">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__lg</xsl:text><xsl:value-of select="$para"/><xsl:text>__vl</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:attribute name="id">
                        <xsl:value-of select="ancestor::tei:div/@xml:id"/><xsl:text>__lg</xsl:text><xsl:value-of select="$para"/><xsl:text>__vl</xsl:text><xsl:value-of select="$lines"/>
                    </xsl:attribute>
                    <xsl:choose>
                        <xsl:when test="($lines mod 5) = 0">
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersVisible linenumbers verseline yes-index</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="data-lbnr">
                                <xsl:value-of select="$lines"/>
                            </xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="class">
                                <xsl:text>linenumbersTransparent linenumbers verseline yes-index</xsl:text>
                            </xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of select="concat('(vl) ', format-number($lines, '0000'))"/>
                </a>
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
        -->
    </xsl:template>
    
</xsl:stylesheet>
