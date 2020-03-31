<?php
// parse the xsl stylesheet

$xsty = new DOMDocument();
$xsty->load('countries.xsl');

// create the xslt tranformer object

$xslt = new XSLTProcessor(); 
$xslt->setSecurityPrefs(0);
$xslt->importStylesheet($xsty); 


// parse the source xml;
$xsource = new DOMDocument();
$xsource->load('countries.xml');

//transformation
$result = $xslt->transformToXML($xsource);     
echo $result;

?>
