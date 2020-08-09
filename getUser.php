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
$user_id = $data["id"];
//echo($user_id);
$sql = "Select * from user where user_id = $user_id";
  if ($result = $conn->query($sql)) {
        $user=array();

        while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
        {

          array_push($user,$row);
        }

        echo json_encode($user);
   } else {
        $response = array('response_code' => 404, );
        echo json_encode($conn->error);
   }
$conn->close();

?>
