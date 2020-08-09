<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
//
// $conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME,$DB_PORT);
//
// if ($conn->connect_error) {
//   die("Connection failed: " . $conn->connect_error);
// }
require 'connection.php';
$data = json_decode(file_get_contents('php://input'), true);
$isSeller = $data['isSeller'];
$id = $data ['id'];
if($isSeller=="true"){
  $sql = "Delete from product_bid where prod_bid_id=$id";
  if ($result = $conn->query($sql)) {
        $response = array('response_code' => 101, );
        echo  json_encode($response);
   } else {
        $response = array('response_code' => 404, );
        echo json_encode($response);
  }


}else{
  $sql = "Delete from requirement_bid where req_bid_id=$id";
  if ($result = $conn->query($sql)) {
        $response = array('response_code' => 101, );
        echo  json_encode($response);
   } else {
        $response = array('response_code' => 404, );
        echo json_encode($response);
  }


}

$conn->close();

?>
