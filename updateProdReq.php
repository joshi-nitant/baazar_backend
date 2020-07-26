<?php
$DB_SERVER = 'localhost';
$DB_USERNAME = 'root';
$DB_PASSWORD = '';
$DB_NAME = 'baazar';
$DB_PORT = 3307;

$isSeller = $_POST['isSeller'];
$price = $_POST['price'];
$breed = $_POST['breed'];
$quantity = $_POST['quantity'];
// $timestamp = strtotime($_POST['date']);
// $date = date("Y-m-d H:i:s", $timestamp);
$address = $_POST['address'];
$state = $_POST['state'];
$pincode = $_POST['pincode'];
$city = $_POST['city'];
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];
$user_id = $_POST['user_id'];
$category = $_POST['category'];
$id = $_POST['id'];
// Create connection
$conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME,$DB_PORT);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if($isSeller=="true"){
	try{
    if(isset($_FILES['qualityCertificate'])){
      		$qualityCertificate = $_FILES['qualityCertificate']['name'];
          $target_dir = "qualityCertificate/";
      		$target_file = $target_dir . basename($_FILES["qualityCertificate"]["name"]);
      		move_uploaded_file($_FILES["qualityCertificate"]["tmp_name"], $target_file);
          $sql = "UPDATE `product` SET
                  `quality_certificate`='$qualityCertificate'
                   WHERE prod_id=$id";
          $conn->query($sql);

    }
    if(isset($_FILES['productImage'])){
      $productImage = $_FILES['productImage']['name'];
      $target_dir = "productImage/";
      $target_file = $target_dir . basename($_FILES["productImage"]["name"]);
      move_uploaded_file($_FILES["productImage"]["tmp_name"], $target_file);
      $sql = "UPDATE `product` SET
              `image`='$productImage'
               WHERE prod_id=$id";
      $conn->query($sql);

    }
	   $sql = "UPDATE `product` SET
          `quantity`=$quantity,
          `price_expected`=$price,
          `breed`='$breed',
          `category_id`=$category,
          `latitude`='$latitude',
          `longitude`='$longitude',
          `address`='$address',
          `state`='$state',
          `city`='$city',
          `pincode`='$pincode'
           WHERE prod_id=$id";


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
		$sql = "UPDATE `requirement` SET
            `quantity`=$quantity,
            `price_expected`=$price,
            `breed`='$breed',
            `category`=$category,
            `latitude`='$latitude',
            `longitude`='$longitude',
            `address`='$address',
            `state`='$state',
            `city`='$city',
            `pincode`='$pincode'
             WHERE req_id=$id";


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
