<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>

  <xsl:template match="/">
    <ul>
      <br />Kordused - kõik perenimed nimekirjast
      <br />
      <xsl:for-each select="autoregistr/auto">
        <li>
          <xsl:value-of select="perenimi"/>
          <xsl:value-of select="regnumber"/>
        </li>
      </xsl:for-each>
    </ul>
    <br></br>
    auto registrinumber - 
    <xsl:value-of select="/autoregistr/auto[1]/regnumber"/>
    <br></br>

    registrinumbri numbrite osa -
    <xsl:value-of select="substring(/autoregistr/auto[1]/regnumber,1,4)"/>
    <br></br>

    registrinumbri tähtede osa -
    <xsl:value-of select="substring(/autoregistr/auto[1]/regnumber,5,4)"/>
    <br />
    <br />


    inimese perekonnanime esimene täht -
    <xsl:value-of select="substring(/autoregistr/auto[1]/perenimi,1,1)"/>

    <br /> 
    <br />
    inimese perekonnanime viimane täht -
    <xsl:value-of select="substring(/autoregistr/auto[1]/perenimi,5,1)"/>
    
    <br />
    <br />
    -------------------------------------------------------------------------
    <br />
    <br />
    Leia, mitme inimese perekonnanimi on Kaalikas
    <xsl:value-of select="count(/autoregistr/auto[perenimi='Lira'])"/>
    
    <br />
    <br />
    Leia, mitme inimese perekonnanimi algab M-tähega
    <xsl:value-of select="count(/autoregistr/auto[substring(perenimi,1,1)='M'])"/>


    <br />
    <br />
    Leia, mitme auto registrimärgi numbritest viimane on 2 -
    <xsl:value-of select="count(/autoregistr/auto[substring(regnumber,4,1)='2'])"/>

    <br />
    <br />
    Leia, mitme auto registrimärgi numbritest viimane on 1 või 2 -
    <xsl:value-of select="count(/autoregistr/auto[substring(regnumber, 4, 1)='1'
                  or substring(regnumber,3,1)='2'])"/>


  </xsl:template>
</xsl:stylesheet>
