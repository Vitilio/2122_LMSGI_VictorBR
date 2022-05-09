<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : garaje.xsl
    Created on : 28 de abril de 2022, 11:35
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes" version="html"/>
    <xsl:template match="/">
    <xsl:text disable-output-escaping="yes"> &lt;!DOCTYPE html&gt; </xsl:text>
    <xsl:apply-templates select="comment()"/>
        <html lang="es">
            <head>
                <title>04 XSLT Victor Blanco Rodrigo</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Victor Blanco Rodrigo"/>
                <meta name="application-name" content="Informacion de garajes"/>
                <meta name="description" content="Pagina web que muestra la informacion de las reparaciones realizadas en un garaje"/>
                <meta name="keywords" content="garajes, reparaciones, matricula,informacion"/>
                <meta name="robots" content="index, follow"/>
                <link href="estilos.css" rel="stylesheet" type="text/css"/> 
                <link href="../../images/favicon.ico" rel="icon" type="image/x-icon"/>
            </head>
            <body>
                <h1>Practica 4 <br/>Informacion de garajes</h1>
                <xsl:apply-templates select="garaje/coches/coche"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="garaje/coches/coche">
        <table>
            <thead>
                <tr>
                    <th>Matricula</th>
                    <th>Reparaciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <xsl:value-of select="matricula"/>
                    </td>
                    <td>
                        <xsl:apply-templates select="//reparacion[current()/matricula=matricula]"/>
                        <div>
                            <div>
                                Numero de reparaciones: <xsl:value-of select="count(//reparacion[current()/matricula=matricula])"/>
                            </div>
                            <div>
                                Total Horas: <xsl:value-of select="count(//reparacion[current()/matricula=matricula]/horas)"/>
                            </div>
                            <div>
                                Total a pagar: <xsl:value-of select="(count(//reparacion[current()/matricula=matricula]/horas))*12"/>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="//reparacion[current()/matricula=matricula]">
        <div>
            <p>
                <xsl:value-of select="current()/@codigo"/>
            </p>
            <ul>
                <li>
                    <xsl:value-of select="descripcion"/>
                </li>
                <li>
                    <xsl:value-of select="concat('Fecha de entrada:',fecha_entrada)"/>
                </li>
                <li>
                    <xsl:value-of select="concat('Fecha de salida:',fecha_salida)"/>
                </li>
                <li>
                    <xsl:value-of select="concat(horas,' horas')"/>
                </li>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
            <xsl:comment>
                <xsl:value-of select="."/>
            </xsl:comment>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>

