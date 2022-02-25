<?php
unset($_GET['format']);
$xml = new SimpleXMLElement('<xml/>');

for ($i = 0; $i < count($_GET); $i++) {
    $track = $xml->addChild('Exchange');
    $track->addChild('ID', $_GET[$i]['id']);
    $track->addChild('Name', $_GET[$i]['name']);
    $track->addChild('Char_code', $_GET[$i]['char_code']);
    $track->addChild('Value', $_GET[$i]['value']);
}

Header('Content-type: text/xml');
print($xml->asXML());

?>
