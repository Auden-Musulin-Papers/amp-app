<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs xsl tei" version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <h1>Widget annotation options.</h1>
            <p>Contact person: daniel.stoxreiter@oeaw.ac.at</p>
            <p>Applied with call-templates in html:body.</p>
            <p>Custom template to create interactive options for text annoations.</p>
        </desc>    
    </doc>
    
    <xsl:template name="annotation-options">
        
                <!--<div class="navBarLetters text-center" id="aot-options">                                            
                    <table class="table" style="margin-bottom:0;">
                        <tbody>           
                            <tr>         
                                <td style="width:5%;border: 1px dashed #dedede;">
                                    <full-size opt="edition-fullsize"></full-size> 
                                </td>
                                <td style="text-align:center;width:5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;"> 
                                    <image-switch opt="edition-switch"></image-switch>
                                </td>
                                <td style="text-align:left;width:10%;border: 1px dashed #dedede;border-right: 1px dashed #dedede;"> 
                                    <font-size opt="select-fontsize"></font-size> 
                                </td>
                                <td style="text-align:left;width:15%;border: 1px dashed #dedede;border-right: 1px dashed #dedede;">
                                    <font-family opt="select-font"></font-family> 
                                </td>
                                <td style="text-align:center;width:15%;border-top: 1px dashed #dedede;border-right: 1px dashed #dedede;">   
                                    <annotation-slider opt="text-features"></annotation-slider> 
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">     
                                    <annotation-slider opt="deleted"></annotation-slider>  
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">   
                                    <annotation-slider opt="unclear"></annotation-slider>  
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">     
                                    <annotation-slider opt="underlined"></annotation-slider>      
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;border-right: 1px dashed #dedede;">  
                                    <annotation-slider opt="whitespace"></annotation-slider>   
                                </td>
                            </tr>
                            <tr>
                                <td style="border: 1px dashed #dedede;height:80px;"></td>
                                <td style="border: 1px dashed #dedede;"></td>
                                <td style="border: 1px dashed #dedede;"></td>
                                <td style="border: 1px dashed #dedede;"></td>
                                <td style="border-bottom: 1px dashed #dedede;border-right: 1px dashed #dedede;"></td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">
                                    <annotation-slider opt="persons"></annotation-slider>
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">
                                    <annotation-slider opt="places"></annotation-slider>
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;">
                                    <annotation-slider opt="orgs"></annotation-slider>
                                </td>
                                <td style="text-align:center;width:12.5%;border-top: 1px dashed #dedede;border-bottom: 1px dashed #dedede;border-right: 1px dashed #dedede;">
                                    <annotation-slider opt="works"></annotation-slider>
                                </td>
                            </tr> 
                        </tbody>
                    </table>   
                </div>-->
        <div id="aot-navbarNavDropdown" class="navBarLetters">
            <!-- Your menu goes here -->
            <ul id="aot-menu" class="navbar-nav">
                <li class="nav-item dropdown">
                    <a title="Settings" href="#" data-toggle="dropdown" class="nav-link dropdown-toggle">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="nav-item dropdown-submenu">
                            <full-size opt="edition-fullsize"></full-size>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <image-switch opt="edition-switch"></image-switch>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <font-size opt="select-fontsize"></font-size>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <font-family opt="select-font"></font-family>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="text-features"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="deleted"></annotation-slider>
                        </li> 
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="unclear"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="underlined"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="whitespace"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu" style="border-top: 2px dashed lightgrey !important;">
                            <annotation-slider opt="entities-features"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="persons"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="places"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="orgs"></annotation-slider>
                        </li>
                        <li class="nav-item dropdown-submenu">
                            <annotation-slider opt="works"></annotation-slider>
                        </li>
                    </ul>                                
                </li>
            </ul>                       
        </div>
        <script type="text/javascript">
            $('.dropdown-menu .nav-item').click(function(e) {
                e.stopPropagation();
            });
        </script>
        
    </xsl:template>
</xsl:stylesheet>