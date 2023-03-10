<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-doctype"/>

<!-- Plantilla principal: intercalamos código HTML con datos XML -->
<xsl:variable name="nrest" select="'El clarete'"/>
<xsl:template match="/reservaeventos" >
	<html lang="es">
		<head>
			<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
			<meta charset="utf-8"/>
			<meta name="description" content="Página principal" />
			<title>titulo de la web</title>
		</head>
		<body>
			<header>
				<img src= "../img/logotipo.png" alt= "Reservas" />
				<a href="teatro.xml">Teatro</a>
				<a href="restaurante.xml">Restaurante</a>
				<a href="festival.xml">Festival</a>
			</header>
			
			<main>
				<xsl:apply-templates select="restaurante[nombrerestaurante=$nrest]"/>
			</main>

			<footer>
				<address>&#169; 2020 desarrollado por info@birt.eus</address>
			</footer>
		</body>
	</html>
</xsl:template>

<!-- Plantilla secundaria -->
<xsl:template match="restaurante">
	<h1><a href="{informacion}"><xsl:value-of select="nombrerestaurante"/> - <xsl:value-of select="ciudad"/></a></h1>
	<xsl:for-each select="menu">
		<article class="restaurante">
			<h3><xsl:value-of select="@tipo"/></h3>
			<xsl:for-each select="plato">
				<p><xsl:value-of select="."/></p>
			</xsl:for-each>
			<p></p>
		</article>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>