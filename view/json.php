<?php
$json_pretty = json_encode($_GET, JSON_PRETTY_PRINT);
echo "<pre>".$json_pretty."<pre/>";