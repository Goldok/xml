<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                    version="1.0"
                    xmlns:c="urn:countries">
<xsl:output
     method="xml"
     doctype-system="about:legacy-compat"
     omit-xml-declaration = "yes"
     encoding="UTF-8"
     indent="yes" />

    <xsl:template match="c:countries">
        <html lang="en">
            <head>

                <!-- Required meta tags -->
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <title>JAIME LE XML</title>
                                <link rel="stylesheet" href="./global.scss" />
<!-- 

                 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
                                <!-- Bootstrap CSS -->
                <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/> -->
            </head>
            <body>
               
<div class="navbar">
  <div style="color:white">Triéer par</div>
  <a href="#alphabetique">Alphabétique</a>
  <a href="#population">Population</a>
  <a href="#superficie">Superficie</a>
</div>

<div class="main">

 <section >
 <div class="article" id="alphabetique" >
               <article   >
                <div >
                  <h1 >Liste des pays par ordre croissant des noms</h1>
                </div>
                <div >
                  <div class="accordion-content">
                    <xsl:apply-templates select="c:country"> 
                        <xsl:sort select="@name" order="ascending"></xsl:sort>
         
                      </xsl:apply-templates>
                    <!-- <xsl:for-each select="/c:countries/c:country">
                      <xsl:sort select="@name" order="ascending"></xsl:sort>
                      <p><xsl:value-of select="@name"/></p>
                    </xsl:for-each> -->
                  </div>
                </div>
              </article></div>
<div class="article" id="population">               <article >
                <div >
                  <h1>Liste des pays par ordre croissant des populations</h1>
                </div>
                <div >
                  <div >
                              <xsl:apply-templates select="c:country">                    
                                <xsl:sort select="@population" order="ascending" data-type="number"></xsl:sort>
                                </xsl:apply-templates>

                    <!-- <xsl:for-each select="/c:countries/c:country">
                      <xsl:sort select="@population" order="ascending"></xsl:sort>
                      <p><xsl:value-of select="@name"/></p>
                    </xsl:for-each> -->
                  </div>
                </div>
              </article></div>

              <div  class="article" id="superficie">
                            <article>
                <div >
                  <h1>Liste des pays par ordre croissant des superficies</h1>
                </div>
                <div >
                  <div >
                                                <xsl:apply-templates select="c:country">                    
                      <xsl:sort select="@area" order="ascending"></xsl:sort>
                                </xsl:apply-templates>
                    <!-- <xsl:for-each select="/c:countries/c:country">
                      <xsl:sort select="@area" order="ascending"></xsl:sort>
                      <p><xsl:value-of select="@name"/></p>
                    </xsl:for-each> -->
                  </div>
                </div>
              </article>
              </div>

            </section>




        <h1>LISTE DES PAYS</h1>

        TODO :

        Faire un template pour affichage
        → Une partie navigation avec la liste des pays triés par :
        • ordre alphabétique
        • population
        • superficie

            <xsl:apply-templates select="c:country"/>

        <!-- <xsl:apply-templates /> -->
</div>

           


   </body>
  </html>
</xsl:template>


    <xsl:template match="c:country">


            <h3>
                <xsl:value-of select="@name"/>
            </h3>
  <table>
    <thead>
      <tr>
        <th >
          superficie
        </th>
        <th >
          population
        </th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <xsl:value-of select="@area"/>
        </td>
        <td>
          <xsl:value-of select="@population"/>
        </td>
      </tr>
    </tbody>
  </table>

        <!-- <ul>
            <li>
                Population :
                <xsl:value-of select="@population"/>
            </li>
            <li>
                Superficie :
                <xsl:value-of select="@area"/>
            </li>
        </ul> -->
        <xsl:if test="c:city">
            <h3>Villes principales</h3>
            <xsl:apply-templates select="c:city"/>
 <xsl:for-each select="c:population">

 HAHAHA
    <rect x="{10*position()}" y="{100- .}" width="10" height="{.}" 
          fill="red" stroke="black"/>            
  </xsl:for-each>

        </xsl:if>
        <xsl:if test="c:language">

        <h3>Langue parlée</h3>
        <xsl:apply-templates select="c:language"/>
        </xsl:if>

        <hr></hr>
    </xsl:template>


    <xsl:template match="c:city">





        <ul>
            <li>
        <xsl:value-of select="c:name"/>
            (<xsl:value-of select="c:population"/> hab, soit 
             <xsl:value-of select="ceiling(c:population div ../@population * 100)"/> % de la population totale.
            )
            </li>
        </ul>

    </xsl:template>

    <xsl:template match="c:language">
            <xsl:apply-templates/> (<xsl:value-of select="@percentage"/>%),
    </xsl:template>

    <xsl:template match="c:language[last()]">
        <xsl:apply-templates/> (<xsl:value-of select="@percentage"/>%).
    </xsl:template>

</xsl:stylesheet>
