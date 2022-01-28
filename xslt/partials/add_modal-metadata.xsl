<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:foo="foo.com" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://test.org/" exclude-result-prefixes="tei my xs xlink foo" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="html" version="5.0" indent="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget add_modal-metadata.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with apply-templates in html:body.</p>
            <p>The template "add_modal-metadata" creates a modal window that uses bootstrap fade and show.</p> 
            <p>The modal window contant contains metadata from the teiHeader.</p> 
        </desc>    
    </doc>
    
    <xsl:template name="modal-metadata">
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content timeline-modal">
                    <button type="button" class="ml-2 mb-1 close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                    <div class="modal-body">                        
                        <div class="timeline-container timeline-theme-1">
                            <div class="js-timeline">  
                                <xsl:for-each select="//tei:event">  
                                    <xsl:variable name="img" select="concat(@facs, 'full/full/0/default.jpg')"/>
                                    <div data-time="{./tei:head/tei:date/@when}">
                                        <xsl:call-template name="bio-el">
                                            <xsl:with-param name="img" select="$img"/>
                                            <xsl:with-param name="location" select="'false'"/>
                                        </xsl:call-template>                                            
                                    </div>
                                </xsl:for-each>
                            </div>
                        </div>                                         
                    </div>                    
                </div>
            </div>
        </div>
        <script type="text/javascript">
            // created with https://ilkeryilmaz.github.io/timelinejs/
            $('.fa-play-circle').click(function () {
                if ($('.timeline-list').length == 0) {
                    $('.js-timeline').Timeline({
                        autoplay: true,
                    });
                }
            });            
        </script>
    </xsl:template>
    
</xsl:stylesheet>