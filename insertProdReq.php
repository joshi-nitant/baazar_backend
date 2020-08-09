<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
require 'connection.php';
$isSeller = $_POST['isSeller'];
$price = $_POST['price'];
$breed = $_POST['breed'];
$quantity = $_POST['quantity'];
// $timestamp = strtotime($_POST['date']);
// $date = date("Y-m-d H:i:s", $timestamp);
// $address = $_POST['address'];
// $state = $_POST['state'];
// $pincode = -1;
// if(isset($_POST['pincode'])){
//     $pincode = $_POST['pincode'];
// }
//
//
// $city = $_POST['city'];
// $latitude = $_POST['latitude'];
// $longitude = $_POST['longitude'];

$user_id = $_POST['user_id'];
$category = $_POST['category'];
// // Create connection
// $conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME,$DB_PORT);
//
// // Check connection
// if ($conn->connect_error) {
//   die("Connection failed: " . $conn->connect_error);
// }

if($isSeller=="true"){
	try{
		// $qualityCertificate = $_FILES['qualityCertificate']['name'];
    // $target_dir = "qualityCertificate/";
		// $target_file = $target_dir . basename($_FILES["qualityCertificate"]["name"]);
		// move_uploaded_file($_FILES["qualityCertificate"]["tmp_name"], $target_file);

    $productImage = $_FILES['productImage']['name'];
    $target_dir = "productImage/";
    $target_file = $target_dir . basename($_FILES["productImage"]["name"]);
    move_uploaded_file($_FILES["productImage"]["tmp_name"], $target_file);
    //print($productImage);
		$sql = "INSERT INTO `product`(`quantity`, `remaining_qty`,`price_expected`,`breed`,`user_id`, `category_id`,`image`)
		VALUES ($quantity,$quantity,$price,'$breed',$user_id,$category,'$productImage')";




		if ($conn->query($sql) === TRUE) {
          $response = array('response_code' => 100, );
  				echo json_encode($response);
	   } else {
          $response = array('response_code' => 404, );
          echo json_encode($conn->error);
		}

	}
	catch(Exception $e) {
  	echo json_encode($e);
	}
}else{
	try{
    //echo var_dump($_POST);
		$sql ="INSERT INTO `requirement`(`user_id`, `quantity`, `price_expected`, `breed`, `category`,`remaining_qty`)
    VALUES ($user_id,$quantity,$price,'$breed',$category,$quantity)";

		if ($conn->query($sql) === TRUE) {
        $response = array('response_code' => 100, );
        echo json_encode($response);
	   } else {
       $response = array('response_code' => 404, );
       echo json_encode($conn->error);
		}

	}
	catch(Exception $e) {
    $response = array('response_code' => 404, );
    echo json_encode($response);
	}

}

$conn->close();
?>
