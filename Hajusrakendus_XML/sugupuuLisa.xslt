<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
      
      
      
      
      <ul>
        <xsl:for-each select="//inimene">
          <xsl:sort select="@synd"/>
          <li>
            <xsl:value-of select="nimi"/>,
            <xsl:value-of select="@synd"/>
          </li>
          
        </xsl:for-each>
      </ul>
      
      
      <strong>Tingimuslause if kasutamine - 
      näitame ainult need inimesi, kellel esivanema andmed on teada</strong>
      <br></br>

      <ul>
        <xsl:for-each select="//inimene">
          <xsl:sort select="@synd"/>
          <li>
            <xsl:value-of select="nimi"/>,
            <xsl:value-of select="@synd"/>
            <xsl:if test="../..">
              - lapsevanem <xsl:value-of select="../../nimi"/>
            </xsl:if>
          </li>

        </xsl:for-each>
      </ul>
      <strong>
        Tingimuslause if kasutamine - Mitu last kellelgi on?
      </strong>

      <ul>
        <xsl:for-each select="//inimene[lapsed]">
          <xsl:sort select="@synd"/>
          <li>
            <xsl:value-of select="nimi"/>,
            <xsl:value-of select="count(lapsed/inimene)"/>
            <xsl:if test="count(lapsed/inimene)=1">
              laps
            </xsl:if>
            <xsl:if test="not(count(lapsed/inimene)=1)">
              last
            </xsl:if>
          </li>
        </xsl:for-each>
      </ul>
      
      <strong>Iga inimese kohta kirjuta kõik tema järglased!</strong>

      <ul>
        <xsl:for-each select="//inimene[lapsed]">
          <xsl:sort select="@synd"/>
          <li>
            <xsl:value-of select="nimi"/>:
              <xsl:for-each select="lapsed//inimene">
                <xsl:value-of select="nimi"/>
                <xsl:if test="not(position()=last())">,</xsl:if>
              </xsl:for-each>
            
          </li>
        </xsl:for-each>
      </ul>


      <br></br>
      <br></br>
      ------------------------------------------------------------------------------------------------------------------------------------------------
      <br></br>
      <br></br>
      
      <strong>Trüki välja kõikide inimeste sünniaastad</strong>
      <br></br>
      Kasvamine:
        <xsl:for-each select="//inimene">
          <xsl:sort select="@synd"/>
          
            <xsl:value-of select="@synd"/>,
         <!-- <xsl:if test="not(position()=last())">,</xsl:if>-->
        </xsl:for-each>
      <br></br>
      Kahanemine:
      <xsl:for-each select="//inimene">
        <xsl:sort select="@synd" order="descending"/>

        <xsl:value-of select="@synd"/>,
      </xsl:for-each>

      <br></br>
      <strong>Väljastatakse nimed, kel on vähemalt kaks last</strong>
      <br></br>

      <ul>
        <xsl:for-each select="//inimene">
          <xsl:if test="count(lapsed/inimene) >= 2">
            
            <li>
              <xsl:value-of select="nimi"/>
            </li>
            
          </xsl:if>
        </xsl:for-each>
      </ul>

      <br></br>
      <strong>Väljasta sugupuus leiduvad andmed tabelina</strong>
      <br></br>
      <strong> Kus võimalik, seal väljasta tabelis iga inimese vanema nimi </strong>
      <br></br>
      <strong>Väljasta tabelis ka vanavanema nimi</strong>
      <br></br>
      <strong>Выводить в таблице возраст каждого ребенка</strong>
      <br></br>
      <strong>Väljasta iga inimese juures, mitmendal oma vanema sünniaastal ta sündis</strong>
      <br></br>

      <table border="1">
        <tr>
          <th>Nimi</th>
          <th>Synnyaasta</th>
          <th>Vana</th>
          <th>Vanavana</th>
          <th>Vanema vanus</th>
          <th>Lapse vanema vanus</th>
        </tr>

        <xsl:for-each select="//inimene">
        
        <tr>
          <td>
            <xsl:value-of select="nimi"/>
          </td>
          <td>
            <xsl:value-of select="@synd"/>
          </td>
          <td>
            <xsl:if test="../..">
              <xsl:value-of select="../../nimi"/>
            </xsl:if>
          </td>
          <td>
            <xsl:if test="../..">
              <xsl:value-of select="../../../../nimi"/>
            </xsl:if>
          </td>

          <td>
            <xsl:value-of select="2021 - @synd"/>
          </td>

          <td>
            <xsl:if test="../..">
              <xsl:value-of select="@synd - ../../@synd"/>
            </xsl:if>
          </td>
          
        </tr>
        </xsl:for-each>
      </table>
        

      <br></br>
      <strong>Искать в дереве все имена, содержащие определенное количество символов плюсом к поиску по буквам.</strong>
      <br></br>
      
      

      <br></br>
      <strong>Andmepuus muudetakse sünniaasta atribuudiks.</strong>
      <br></br>

      <xsl:for-each select="//inimene">
        <xsl:if test="starts-with(nimi, 'A') or string-length(nimi) = 6">
          <xsl:value-of select="nimi"/>
        </xsl:if>    
      </xsl:for-each>

      <xsl:for-each select="//inimene">
        <xsl:if test="starts-with(nimi, 'a') or string-length(nimi) = 6">
          <xsl:value-of select="nimi"/>
        </xsl:if>
      </xsl:for-each>

      <br></br>      
      <br></br>



      <strong>Andmepuus lisatakse igale inimesele element, mille sisu koosneb eesnime tähest, punktist ja perekonnanimest</strong>
      <br></br>
      <br></br>
      <strong>1) У кого имя короче 7 букв подсветить зелёным</strong>
      <br></br>
      <strong>2) У кого имя длиннее 10 букв подсветить красным</strong>
      <br></br>

      <ul>
        <xsl:for-each select="//inimene">
          <xsl:if test="string-length(nimi) &lt;= 7">
            <li style="background-color: green">
              <xsl:value-of select="nimi"/>
            </li>
          </xsl:if>

          <xsl:if test="string-length(nimi) &gt;= 10">
            <li style="background-color: red">
              <xsl:value-of select="nimi"/>
            </li>

            <xsl:if test="string-length(nimi) &lt; 7 and string-length(nimi) &lt; 10">
              <li>
                <xsl:value-of select="nimi"/>
              </li>
            </xsl:if>
          </xsl:if>
          
        </xsl:for-each>
      </ul>








    </xsl:template>
</xsl:stylesheet>
