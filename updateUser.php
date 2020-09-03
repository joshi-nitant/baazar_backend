<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
//
// // Create connection
// $conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME,$DB_PORT);
//
// // Check connection
// if ($conn->connect_error) {
//   die("Connection failed: " . $conn->connect_error);
// }
require 'connection.php';
$username = $_POST['username'];
// $password = $_POST['password'];
$contact_number = $_POST['contact_number'];
$address = $_POST['address'];
$state = $_POST['state'];

if(isset($_POST['pincode'])){
    $pincode = $_POST['pincode'];
}else{
  $pincode = -1;
}
$id = $_POST['id'];
$city = $_POST['city'];
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];
$panCardStatus = $_POST['panCardStatus'];
// $aadharCard = $_FILES['aadharCard']['name'];
//$panCard = $_FILES['panCard']['name'];

$isPanChanged = $_POST['isPanChanged'];
if($isPanChanged=="true"){
  $panCard = $_FILES['panCard']['name'];
}else{
    $panCard = $_POST['panCard'];
}

$sql = "UPDATE `user`
 SET `name`='$username',
 `contact`='$contact_number',
 `address`='$address',
 `pan_card`='$panCard',
 `state`='$state',
 `city`='$city',
 `pincode`='$pincode',
 `latitude`='$latitude',
 `longitude`='$longitude',
 `pan_card_status`=$panCardStatus
 WHERE `user_id` = $id";


if ($conn->query($sql) === TRUE) {
			// $target_dir = "aadharCard/";
			// $target_file = $target_dir . basename($_FILES["aadharCard"]["name"]);
			// move_uploaded_file($_FILES["aadharCard"]["tmp_name"], $target_file);
      if($isPanChanged=="true"){
        $target_dir = "panCard/";
        $target_file = $target_dir . basename($_FILES["panCard"]["name"]);
        move_uploaded_file($_FILES["panCard"]["tmp_name"], $target_file);
      }

		//	$last_id = $conn->insert_id;

			$myArr = array("response_code"=>101);
			echo json_encode($myArr);
 } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
			$myArr = array("user_id"=>-1);
			echo json_encode($myArr);
}

$conn->close();
?>
