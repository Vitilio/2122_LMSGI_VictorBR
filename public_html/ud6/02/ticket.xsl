<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : ticket.xsl
    Created on : 4 de abril de 2022, 9:10
    Author     : daw1
    Description:
         Información de los tickets de compra.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>02 XSLT VictorBlancoRodrigo</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Victor Blanco Rodrigo"/>
                <meta name="application-name" content="Listado de tickets"/>
                <meta name="description" content="Pagina web que almacena,cuenta y suma del precio de tickets de compra"/>
                <meta name="keywords" content="tickets, total, xslt, xml"/>
                <meta name="robots" content="index, follow"/>
                <link href="estilos.css" rel="stylesheet" type="text/css"/> 
                <link href="../../images/favicon.ico" rel="icon" type="image/x-icon"/>
            </head>
            <body>
                <head>
                    <h1>Informacion de tickets</h1>
                    <h2>Listado de tickets</h2>
                </head>
                <main>
                    <xsl:apply-templates select="listatickets/ticket"/> 
                </main>
                <footer>
                    <div>numero de tickets: <xsl:value-of select="count(/listatickets/ticket)"/></div>
                    <div>total de tickets: <xsl:value-of select="sum(/listatickets/ticket/total)"/></div>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="listatickets/ticket">
        <h3>
            <xsl:value-of select="concat('Tickets: ',numero)"/>
        </h3>
        <table>
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates select="producto"/>
            </tbody>
            <tfoot>
                <tr>
                    <th>Total</th>
                    <th>
                        <xsl:value-of select="total"/>
                    </th>
                </tr>
            </tfoot>
        </table>
        <p>
            <xsl:value-of select="concat('fecha del ticket ',fecha)"/>
        </p>
    </xsl:template>
    
    <xsl:template match="producto">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td> 
            <td>
                <xsl:value-of select="precio"/>
            </td>  
        </tr>           
    </xsl:template>
</xsl:stylesheet>
