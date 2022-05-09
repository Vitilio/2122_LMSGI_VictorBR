<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : pelis.xsl
    Created on : 21 de abril de 2022, 10:39
    Author     : daw1
    Description:
        Purpose of transformation follows.
        disable output escaping
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
         Nuevo
         <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
         <xsl:sort select="" data-type="" order=""/>
         no template si hay for each
    -->
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>
                <title>03 XSLT VictorBlancoRodrigo</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Victor Blanco Rodrigo"/>
                <meta name="application-name" content="Listado de peliculas"/>
                <meta name="description" content="Pagina web que muestra el nombre,puntuacion y publico de peliculas"/>
                <meta name="keywords" content="peliculas, informacion, puntuacion"/>
                <meta name="robots" content="index, follow"/>
                <link href="estilos.css" rel="stylesheet" type="text/css"/> 
                <link href="../../images/favicon.ico" rel="icon" type="image/x-icon"/>
            </head>
            <body>
                <header>
                    <h1>Informacion de peliculas</h1>
                </header>
                <main>
                    <xsl:for-each select="peliculas/pelicula">
                        <xsl:sort select="publico" data-type="text"/>
                        <xsl:sort select="puntuacion/@puntos" data-type="number"/>
                        <xsl:sort select="nombre" data-type="text"/>
                        <div>
                            <h3>
                                <xsl:value-of select="nombre"/>
                            </h3>
                            <xsl:choose>
                                <xsl:when test="puntos&gt;0 and puntos&lt;=2" >
                                    <p>
                                        <xsl:value-of select="concat('Puntuacion:',valoracion/@puntos)"/>
                                    </p>
                                </xsl:when>
                                <xsl:when test="puntos&gt;2 and puntos&lt;=4" >
                                    <p>
                                        <xsl:value-of select="concat('Puntuacion:',valoracion/@puntos)"/>
                                    </p>
                                    
                                </xsl:when>
                                <xsl:otherwise>
                                    <p>
                                        <xsl:value-of select="concat('Puntuacion:',valoracion/@puntos)"/>
                                    </p>
                                </xsl:otherwise>
                            </xsl:choose>
                            <p>
                                <xsl:value-of select="concat('Dirigida a:',publico)"/>
                            </p>
                            
                        </div>
                    </xsl:for-each>
                </main>
                <footer>
                    <p>
                        Numero total de peliculas: <xsl:value-of select="count(peliculas/pelicula)"/>
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="comment()">
        
    </xsl:template>
    
    <xsl:template match="peliculas/pelicula">
        <article>
            <header>
                <h4>
                    <xsl:value-of select="nombre"/>
                </h4>
            </header>
            <main>
                <div>
                    <xsl:value-of select="valoracion/@puntos"/>
                </div>
            </main>
            <footer>
                <p>Dirigida a: <xsl:value-of select="publico"/></p>
            </footer>
        </article>
    </xsl:template>

</xsl:stylesheet>
