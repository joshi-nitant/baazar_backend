<?php
$DB_SERVER = 'localhost';
$DB_USERNAME = 'root';
$DB_PASSWORD = '';
$DB_NAME = 'baazar';
$DB_PORT = 3307;

// Create connection
$conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME,$DB_PORT);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$username = $_POST['username'];
// $password = $_POST['password'];
$contact_number = $_POST['contact_number'];
$address = $_POST['address'];
// $aadharCard = $_FILES['aadharCard']['name'];
$panCard = $_FILES['panCard']['name'];
$isSeller = $_POST['isSeller'];

if($isSeller=="true"){
  $isSeller=1;
}else{
  $isSeller=0;
}

$sql = "INSERT INTO `user`(`name`, `contact`, `address`,`is_seller`,`pan_card`)
VALUES ('$username','$contact_number','$address',$isSeller,'$panCard')";


if ($conn->query($sql) === TRUE) {
			// $target_dir = "aadharCard/";
			// $target_file = $target_dir . basename($_FILES["aadharCard"]["name"]);
			// move_uploaded_file($_FILES["aadharCard"]["tmp_name"], $target_file);

			$target_dir = "panCard/";
			$target_file = $target_dir . basename($_FILES["panCard"]["name"]);
			move_uploaded_file($_FILES["panCard"]["tmp_name"], $target_file);
			$last_id = $conn->insert_id;

			$myArr = array("user_id"=>$last_id);
			echo json_encode($myArr);
 } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
			$myArr = array("user_id"=>-1);
			echo json_encode($myArr);
}

$conn->close();
?>
