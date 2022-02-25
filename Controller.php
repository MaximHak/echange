<?php
$servername = "localhost";
$username = "root";
$password = "";
$table = "exchange";

// Create connection
$conn = new mysqli($servername, $username, $password, $table);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}



//
$today_date = date("d.m.Y");
$prev_date = date('d.m.Y', strtotime($today_date .' -1 day'));
$xml = simplexml_load_file("https://www.bnm.md/ro/official_exchange_rates?get_xml=1&date=".$prev_date);
$json = json_encode($xml);
$array = (object)json_decode($json, TRUE);
$truncate_query = "TRUNCATE TABLE event_tabel";
$conn->query($truncate_query);
$sql = "CREATE EVENT copy_exchange
    ON SCHEDULE EVERY 1 DAY
     DO";

foreach ((object)$array->Valute as $item) {
    $ID = $item['@attributes']['ID'];
    $date = date("Y-m-d", strtotime($prev_date));
    $name = $item['Name'];
    $CharCode = $item['CharCode'];
    $Value = $item['Value'];
    $sql .= " INSERT INTO event_tabel (id, date, name, char_code, value) VALUES ('$ID','$date','$name','$CharCode','$Value');";
}
//print_r($sql);
if ($conn->multi_query($sql) === TRUE) {
   return true;
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

