<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
require 'connection.php';
$isSeller = $_POST['isSeller'];
$price = $_POST['price'];
$quantity = $_POST['quantity'];
$user_id = $_POST['user_id'];
$id = $_POST['id'];
$amount = $_POST['delivery_amount'];
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
    ////Check if the product is listed and has sufficent $amount
      $sql = "Select * from product where user_id=$user_id and category_id=$category";
      if($result = $conn->query($sql))
      {
        $list_of_products=array();

        while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
        {
          array_push($list_of_products,$row);
        }
        if(count($list_of_products)!=0){
          ////check if product has sufficent remaining_qty
          if($list_of_products[0]['remaining_qty']>=$quantity){
            $sql = "INSERT INTO `requirement_bid`(`user_id`, `req_id`, `bid_price`, `bid_quantity`)
            VALUES ($user_id,$id,$price,$quantity)";
            if ($conn->query($sql)) {
                  $response = array('response_code' => 100, );
                  echo json_encode($response);
             }
             else{
                  $response = array('response_code' => 404, );
                  echo json_encode($response);
              }
          }else{
            $response = array('response_code' => 406, );
            echo json_encode($response);
          }

        }else{
          $response = array('response_code' => 405, );
          echo json_encode($response);
        }
      }
      else {
           $response = array('response_code' => 404, );
           echo json_encode($response);
       }
	}
	catch(Exception $e) {
  	echo json_encode($e);
	}
}else{
	try{
		$sql = "INSERT INTO `product_bid`(`user_id`, `product_id`, `bid_price`, `bid_quantity`)
     VALUES ($user_id,$id,$price,$quantity)";


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
