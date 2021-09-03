<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" encoding="utf-8" indent="yes"/>

    <xsl:template match="/">
      Esimene eesnimi:
      <xsl:value-of select="/inimesed/inimene[1]/eesnimi"/>
      <br></br>
      Viimane eesnimi:
      <xsl:value-of select="/inimesed/inimene[last()]/eesnimi"/>
      <br />
      Esitäht 1. eesnimi:
      <xsl:value-of select="substring(/inimesed/inimene[1]/eesnimi,1,1)"/>

      <br /> Eesnimi, Perekonnanimi
      <xsl:value-of select="concat(/inimesed/inimene[1]/eesnimi, ', ',
                    /inimesed/inimene[1]/perenimi)"/>

      <br></br> 1. eesnimi Teksti pikkus:
      <xsl:value-of select="string-length(/inimesed/inimene[1]/eesnimi)" />

      <br />Loendame inimeste arv =
      <xsl:value-of select="count(/inimesed/inimene)"/>

      <br />Sündinute = 2003 inimeste arv
      <xsl:value-of select="count(/inimesed/inimene[synd=2003])"/>

      <br />Sündinute = 2003 inimeste arv
      <xsl:value-of select="count(/inimesed/inimene[synd&lt;2003])"/>
      
      <ul>
        <br />Kordused - kõik perenimed nimekirjast
        <br />
        <xsl:for-each select="inimesed/inimene">
          <li>
            <xsl:value-of select="perenimi"/>
          </li>
        </xsl:for-each>
      </ul>

      <ul>
        <br />Kordused - kõik perenimed nimekirjast - variant 2
        <br />
        <xsl:for-each select="inimesed/inimene/perenimi">
          <li>
            <xsl:value-of select="."/>
          </li>
        </xsl:for-each>
      </ul>
      <br />
      Leia kõik nimed, mis algavad M tähega
    <xsl:for-each select="/inimesed/inimene[starts-with(eesnimi, 'M')]">
      <xsl:sort select="synd" order="descending"/>
      <xsl:value-of select="concat(perenimi, ', ',synd)"/>
      <xsl:text></xsl:text>
    </xsl:for-each>
      
      
      
    </xsl:template>
</xsl:stylesheet>
