<?php
$DB_SERVER = 'localhost';
$DB_USERNAME = 'root';
$DB_PASSWORD = '';
$DB_NAME = 'baazar';
$DB_PORT = 3307;

$isSeller = $_POST['isSeller'];
$price = $_POST['price'];
$quantity = $_POST['quantity'];
$user_id = $_POST['user_id'];
$id = $_POST['id'];
$amount = $_POST['delivery_amount'];
// Create connection
$conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME,$DB_PORT);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

if($isSeller=="true"){
	try{
		$sql = "INSERT INTO `requirement_bid`(`user_id`, `req_id`, `bid_price`, `bid_quantity`,`delivery_amount`)
    VALUES ($user_id,$id,$price,$quantity,$amount)";


		if ($conn->query($sql)) {
          $response = array('response_code' => 100, );
  				echo json_encode($response);
	   } else {
          $response = array('response_code' => 404, );
          echo json_encode($response);
		}

	}
	catch(Exception $e) {
  	echo json_encode($e);
	}
}else{
	try{
		$sql = "INSERT INTO `product_bid`(`user_id`, `product_id`, `bid_price`, `bid_quantity`, `delivery_amount`)
     VALUES ($user_id,$id,$price,$quantity,$amount)";


		if ($conn->query($sql) === TRUE) {
        $response = array('response_code' => 100, );
        echo json_encode($response);
	   } else {
       $response = array('response_code' => 404, );
       echo json_encode($response);
		}

	}
	catch(Exception $e) {
    $response = array('response_code' => 404, );
    echo json_encode($response);
	}

}

$conn->close();
?>
