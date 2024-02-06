<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:_="urn:acdh" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget edition-md</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
        </desc>
    </doc>
    
    <xsl:template name="edition-md">
        <xsl:param name="doc_title"/>
        <div class="row"> 
            <div class="col-md-8">
                <div>
                    
                    <table class="table edition-md">
                      <tr>
                          <th>PID</th>
                          <td>
                              <a target="_blank"
                                  title="archived source file"
                                  href="{//tei:publicationStmt/tei:idno[@type='handle']}">
                                  <xsl:value-of select="//tei:publicationStmt/tei:idno[@type='handle']"/>
                              </a>
                          </td>
                      </tr>
                      <tr>
                          <th>Author</th>
                          <td><xsl:value-of select="//tei:titleStmt/tei:author"/></td>
                      </tr>  
                       <tr>
                           <th>Editor(s)</th>
                           <td>
                               <ul style="list-style:none; padding-left:0;margin-bottom:0;">
                                   <xsl:for-each select="//tei:titleStmt/tei:editor/tei:name">
                                       <li>
                                           <xsl:value-of select="."/>
                                       </li>
                                   </xsl:for-each>                                                               
                               </ul>
                           </td> 
                       </tr> 
                       <tr>
                           <th>Publisher</th>
                           <td>
                               <a href="https://acdh.oeaw.ac.at" target="_blank"
                                   alt="External link to Austrian Academy of Sciences - Institute Austrian Centre for Digital Humanities">
                                   <xsl:value-of select="concat(
                                       //tei:publicationStmt/tei:publisher,
                                       ', ',
                                       //tei:publicationStmt/tei:pubPlace,
                                       ' ' ,
                                       //tei:publicationStmt/tei:date)"/>
                               </a>
                           </td>
                       </tr>
                        <tr>
                            <th>Licence(s)</th>
                            <td>
                                <ul>
                                    <xsl:for-each select="//tei:publicationStmt/tei:availability">
                                        <li style="font-weight: bold;"><xsl:value-of select="position()"/>. licence status: <xsl:value-of select="@status"/></li>
                                        <li>
                                            <a href="{./tei:licence/@target}" target="_blank"
                                                alt="{if(./tei:licence[@facs]) then('External link to licence description') else(./tei:licence//text())}">
                                                <xsl:value-of select="./tei:licence/@target"/>
                                            </a>
                                        </li>
                                        <xsl:if test="./tei:licence[@facs]">
                                            <xsl:variable name="iiif-ext" select="'.jpg?format=iiif&amp;param=info.json'"/> 
                                            <xsl:variable name="iiif-domain" select="'https://id.acdh.oeaw.ac.at/auden-musulin-papers/'"/>
                                            <xsl:variable name="facs_item" select="tokenize(./tei:licence/@facs, '/')[5]"/>
                                            <li>
                                                About facsimile: <a href="{concat($iiif-domain, $facs_item, $iiif-ext)}">
                                                    <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                                </a>
                                            </li>
                                            <li>
                                                <xsl:value-of select="./tei:licence//text()"/>
                                            </li>
                                        </xsl:if>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th>Source Information</th>
                            <td>
                                <ul>
                                    <li>
                                        <xsl:value-of select="//tei:sourceDesc//tei:msIdentifier/tei:repository"/>
                                    </li>
                                    <li>
                                        <xsl:value-of select="//tei:sourceDesc//tei:msIdentifier/tei:collection"/>
                                    </li>
                                    <li>
                                        <xsl:value-of select="//tei:sourceDesc//tei:msIdentifier/tei:settlement"/>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <xsl:if test="//tei:sourceDesc//tei:origin">
                            <tr>
                                <th>Origin</th>
                                <td>
                                    <ul>
                                        <li>
                                            <xsl:apply-templates select="substring-before(//tei:sourceDesc//tei:history//tei:origDate/@notBefore-iso, 'T')"/>
                                            <xsl:if test="//tei:sourceDesc//tei:history//tei:origDate[@ana]">
                                                <span class="interp ent" ref="{//tei:sourceDesc//tei:history//tei:origDate/@ana}">
                                                </span>
                                            </xsl:if>
                                        </li>
                                        <xsl:if test="//tei:sourceDesc//tei:history//tei:origPlace">
                                            <li>
                                                <xsl:apply-templates select="//tei:sourceDesc//tei:history//tei:origPlace"/>
                                                <xsl:if test="//tei:sourceDesc//tei:history//tei:origPlace[@ana]">
                                                    <span class="interp ent" ref="{//tei:sourceDesc//tei:history//tei:origPlace/@ana}">
                                                    </span>
                                                </xsl:if>
                                            </li>
                                        </xsl:if>
                                    </ul>
                                </td>
                            </tr>
                        </xsl:if>
                       <tr>
                           <th>Download</th>
                           <td>
                               <ul style="list-style:none;padding-left:0;margin-bottom:0;">
                                   <li style="display:inline;margin-right:1em;">
                                       <a href="{concat('https://id.acdh.oeaw.ac.at/auden-musulin-papers/', //tei:TEI/@xml:id, '?format=raw')}" title="TEI">
                                           <img alt="TEI Logo" src="images/TEI_Logo_36px.png"/>
                                       </a>
                                   </li>
                                   <li style="display:inline;margin-right:1em;">
                                       <a href="{concat('https://id.acdh.oeaw.ac.at/auden-musulin-papers/', //tei:TEI/@xml:id, '?format=metadata')}" title="RDF metadata">
                                           <img border="0" src="http://www.w3.org/RDF/icons/rdf_w3c_icon.48"
                                               alt="RDF metadata"/>
                                       </a>
                                   </li>
                               </ul>                                                            
                           </td>  
                       </tr>   
                       <tr>
                           <th>IIIF Endpoint(s)</th>
                           <td>
                               <ul style="list-style:none;margin-bottom:0;padding-left:0;">
                                   <xsl:variable name="iiif-ext" select="'.jpg?format=iiif&amp;param=info.json'"/> 
                                   <xsl:variable name="iiif-domain" select="'https://id.acdh.oeaw.ac.at/auden-musulin-papers/'"/>                                                            
                                   <xsl:for-each select="//tei:pb">
                                       <xsl:variable name="facs_item" select="tokenize(@facs, '/')[5]"/>
                                       <li>
                                           <a href="{concat($iiif-domain, $facs_item, $iiif-ext)}">
                                               <xsl:value-of select="concat($iiif-domain, $facs_item, $iiif-ext)"/>
                                           </a>
                                       </li>                                                                    
                                   </xsl:for-each>   
                               </ul>                                                                                                                     
                           </td> 
                       </tr> 
                       <tr>
                           <th>Cite this Source (MLA 9th Edition)</th>
                           <td style="text-align:left !important;">
                               <xsl:value-of select="concat(
                                   'Andorfer Peter, ',
                                   'Elsner Daniel, ',
                                   'Frühwirth Timo, ',
                                   'Grigoriou Dimitra, ',
                                   'Mayer Sandra, ',
                                   ', Mendelson Edward and Neundlinger Helmut')"/>
                               <xsl:text>. Auden Musulin Papers: A Digital Edition of W. H. Auden's Letters to Stella Musulin. Austrian Centre for Digital Humanities and Cultural Heritage, Austrian Academy of Sciences, 2022, </xsl:text>
                               <a href="https://amp.acdh.oeaw.ac.at" id="citation-url">
                                   amp.acdh.oeaw.ac.at
                               </a><xsl:text>.</xsl:text>                                                         
                           </td> 
                       </tr>
                    </table>
                    
                </div>
                
            </div>
        </div>
        
    </xsl:template>
</xsl:stylesheet>