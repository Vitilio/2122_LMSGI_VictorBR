<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : vivienda.xsl
    Created on : 28 de marzo de 2022, 9:55
    Author     : daw1
    Description:
        Purpose of transformation follows.
        
    . = current()
    div() no deja espacio entre lineas
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="utf-8"/>
                <title>01 XSLT VictorBlancoRodrigo</title>
            </head>
            <body>
                <h1>Informacion de las viviendas</h1>
                <xsl:apply-templates select="edificio/vivienda"/>
                <div>
                    Numero de viviendas: <xsl:value-of select="count(edificio/vivienda)"/>
                </div>
                <div>
                    Numero total de vecinos: <xsl:value-of select="count(edificio/vivienda/vecinos/nombre)"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="edificio/vivienda">
        <p>
            <xsl:value-of select="concat('Piso: ',piso,' Puerta: ',puerta)"/>
        </p>
        <ol>
            <xsl:apply-templates select="vecinos/nombre"/>
        </ol>
        
        
    </xsl:template>
    <xsl:template match="vecinos/nombre">
        <li>
            <xsl:value-of select="current()/text()"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
