<?php
unset($final_array);
if (isset($_POST['id']) && $_POST['id'] != 0){
    $id = $_POST['id'];
    $sql = "SELECT * FROM exch_tabel where id = '$id' ";

}else{
    $sql = "SELECT * FROM exch_tabel where char_code in ('RON','RUB','USD','EUR') ";

}

include 'database.php';

$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    $final_array[] = $row;
}

// Include the main TCPDF library (search for installation path).
require_once('tcpdf_min/tcpdf.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);



// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH);
$pdf->setFooterData(array(0,64,0), array(0,64,128));

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)


// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('', '', 14, '', true);

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage();


// Set some content to print

$html = <<<EOD

<h1>Exchange</h1>
<table cellspacing="0" cellpadding="1" border="1" style="border-color:gray;">
<tr style="background-color:green;color:white;">
        <td>ID</td>
        <td>Name</td>
        <td>Char Code</td>
		<td>Value</td>
    </tr>
EOD;
foreach($final_array as $key=>$value){

    $html.=<<<EOD
    
     <tr>
        <td>{$value['id']}</td>
        <td>{$value['name']}</td>
		<td>{$value['char_code']}</td>
		<td>{$value['value']}</td>
    </tr>
EOD;
}
$html.=<<<EOD
</table>
EOD;
// Print text using writeHTMLCell()
$pdf->writeHTMLCell(0, 0, '', '', $html, 0, 1, 0, true, '', true);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output(__DIR__ . '/exch.pdf', 'F');
echo '<div>';
$new_url = http_build_query($final_array);
echo "<p>JSON: <a href='json.php?format=json&".$new_url."' target='_blank'> Pagina pentru vizionarea formatului json </a></p>";
echo "<p>XML: <a href='xml.php?format=xml&".$new_url."' target='_blank'> Pagina pentru vizionarea formatului xml </a></p>";
echo '</div>';
//============================================================+
// END OF FILE
//============================================================+