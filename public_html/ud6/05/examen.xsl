<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : examen.xsl
    Created on : 9 de mayo de 2022, 8:55
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="solucion" select="no"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html lang="es">
            <head>
                <title>04 XSLT Victor Blanco Rodrigo</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Victor Blanco Rodrigo"/>
                <meta name="application-name" content="Examen tipo test"/>
                <meta name="description" content="Test de Desarrollo de Aplicaciones Web"/>
                <meta name="keywords" content="XSLT, XML, DTD, Enviar"/>
                <meta name="robots" content="index, follow"/>
                <link href="examen.css" rel="stylesheet" type="text/css"/> 
                <link href="../../images/favicon.ico" rel="icon" type="image/x-icon"/>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="examen/datos/nombreCiclo"/>
                </h1>
                <h2>
                    <xsl:value-of select="examen/datos/nombreModulo"/>
                </h2>
                <h3>
                    <xsl:value-of select="concat('Fecha: ',examen/datos/fecha/dia,' de ',document('meses.xml')/meses/mes[@id=current()/examen/datos/fecha/mes],' de ',examen/datos/fecha/anyo)"/>
                </h3>
                <form action="/action_page.php" method="post">
                    <xsl:for-each select="examen/preguntas/pregunta">
                        <fieldset>
                            <div>
                                <xsl:value-of select="concat(@id,'.-',enunciado)"/>
                                <xsl:for-each select="respuestas/respuesta">
                                    <div>
                                        <input type="radio" id="pregunta" name="pregunta">
                                            <xsl:attribute name="id">
                                                <xsl:value-of select="concat('pregunta',../../@id,position())"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="name">
                                                <xsl:value-of select="concat('pregunta',../../@id)"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="position()"/>
                                            </xsl:attribute>
                                            <xsl:if test="@correcta= 'correcta' and $solucion!='no'">
                                                <xsl:attribute name="">
                                                    <xsl:value-of/>
                                                </xsl:attribute>
                                                <xsl:attribute name="">
                                                    <xsl:value-of/>
                                                </xsl:attribute>
                                            </xsl:if>
                                        </input>
                                        <label>
                                            <xsl:value-of select="current()"/>
                                        </label>
                                    </div>
                                </xsl:for-each>
                            </div>
                        </fieldset>
                    </xsl:for-each>
                </form>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="">
        
    </xsl:template>
        
</xsl:stylesheet>
