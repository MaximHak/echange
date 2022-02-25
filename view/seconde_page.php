<?php
$final_array = array();
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

$xml = simplexml_load_file("https://www.bnm.md/ro/official_exchange_rates?get_xml=1&date=" . $_POST['date']);
$json = json_encode($xml);
$array = (object)json_decode($json, TRUE);
$truncate_query = "TRUNCATE TABLE exch_tabel";
$conn->query($truncate_query);
foreach ((object)$array->Valute as $item) {

    $ID = $item['@attributes']['ID'];
    $date = date("Y-m-d", strtotime($_POST['date']));

    $name = $item['Name'];
    $CharCode = $item['CharCode'];
    $Value = $item['Value'];
//print_r($name);
    $sql = "INSERT INTO exch_tabel (id, date, name, char_code, value)
                VALUES ('$ID', '$date', '$name','$CharCode','$Value')";
    if ($conn->query($sql) === TRUE) {
        echo "";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

}

$sql = "SELECT * FROM exch_tabel where char_code in ('RON','RUB','USD','EUR') ";
$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    $final_array[] = $row;
}

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
</head>
<body>



<div style="height: 500px;
    padding: 50px;" class="container">
    <div class="form-group">
        <label for="exampleFormControlSelect1">Selectati valuta dorita:</label>
        <select style="margin-bottom: 20px;" class="form-control" id="exampleFormControlSelect1">

        <option value="0" selected>Toate</option>
        <?php for ($i = 0; $i < count($final_array); $i++) { ?>
            <option value="<?php echo $final_array[$i]['id']; ?>"><?php echo $final_array[$i]['char_code']; ?></option>
        <?php } ?>

    </select>
    </div>
    <?php include_once '../Create_repo.php' ?>
    <p id="report">Raport in format pdf: </p>
    <div id="iframid">

    <iframe src="../exch.pdf" type="application/pdf" width="100%"  height="600px"></iframe>

    </div>


</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
<script>
    $('#exampleFormControlSelect1').change(function() {
        var id = $(this).val();
        $.ajax({
            type: "POST",
            url: "../Create_repo.php",
            data: {id: id},
            dataType: "html",
            success: function (response) {
console.log(response);
                $('#iframid,#formats').empty();
$('#formats').append(response);

                $('<iframe src="../exch.pdf" type="application/pdf" width="100%"  height="600px"></iframe>').appendTo('#iframid');
            },
            error: function (data) {
                console.log(data);
            },
        });
    });
</script>
</html>
