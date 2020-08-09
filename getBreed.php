<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
//
// $conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME,$DB_PORT);
// //echo("here1");
require 'connection.php';
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
$data = json_decode(file_get_contents('php://input'), true);
$categoryId = $data['cat_id'];
//echo($categoryId);
$sql = "Select * from category_breed where cat_id = $categoryId";

if ($result = $conn->query($sql)) {
  //echo("here3");
    $response = array('response_code' => 101);
    $list_of_breed = array();

    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        array_push($list_of_breed, $row);
    }
    $response['breed_list'] = $list_of_breed;
    if(count($list_of_breed)!=0){
        echo(json_encode($response));
    }else{
      $response = array('response_code' => 404);
      echo(json_encode($response));
    }

}else{
  echo($conn->error);
}
$conn->close();
?>
