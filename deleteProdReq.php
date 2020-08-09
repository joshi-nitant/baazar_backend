<?php

// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
// $cn = mysqli_connect($DB_SERVER,$DB_USERNAME,$DB_PASSWORD,$DB_NAME,$DB_PORT);
//
require 'connection.php';
$data = json_decode(file_get_contents('php://input'), true);
$id = $data['id'];
$isProduct = $data['isProduct'];

if($isProduct=="true"){

  $sql = "delete from product_bid where product_id =$id ";
  if ($conn->query($sql) === TRUE) {
    $sql="delete  from product where prod_id=$id";
    if ($conn->query($sql) === TRUE) {
        $response = array('response_code' => 100, );
        echo json_encode($response);
     }
  }
   else {
     $response = array('response_code' => 404, );
     echo json_encode($conn->error);
  }
}

else{
  $sql = "delete from requirement_bid where req_id=$id";
  if ($conn->query($sql) === TRUE) {
    $sql="delete  from requirement where req_id=$id";
    if ($cn->query($sql) === TRUE) {
        $response = array('response_code' => 100, );
        echo json_encode($response);
     }
   }
   else {
     $response = array('response_code' => 404, );
     echo json_encode($response);
  }
}



$conn->close();

?>
