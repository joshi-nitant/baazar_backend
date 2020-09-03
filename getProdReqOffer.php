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
require 'charges_management.php';


$data = json_decode(file_get_contents('php://input'), true);
$isSeller = $data["isSeller"];
$user_id = $data["user_id"];


if($isSeller=="true"){
  $sql = "Select bid.*,prod.prod_id,prod.price_expected,prod.quantity,prod.remaining_qty,prod.breed,prod.category_id,prod.image from product as prod
  INNER JOIN product_bid as bid ON prod.prod_id=bid.product_id
  where  bid.is_accepted=0 and prod.user_id = $user_id";

  if ($result = $conn->query($sql)) {
        $list_of_requirements=array();

        while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
        {
          array_push($list_of_requirements,$row);
        }
        $response_transaction = array();
        $response_transaction['list'] = $list_of_requirements;
        $response_transaction['DELIVERY_CHARGE_PER_KM'] = DELIVERY_CHARGE_PER_KM;
        $response_transaction['TRANSACTION_CHARGE_PERCENTAGE'] = TRANSACTION_CHARGE_PERCENTAGE;
        echo json_encode($response_transaction);
   } else {
        $response = array('response_code' => 404, );
        echo json_encode($conn->error);
  }


}else{
  $sql = "Select bid.*,r.req_id,r.quantity,r.price_expected,r.breed,r.category,r.remaining_qty from requirement as r
  INNER JOIN requirement_bid as bid ON r.req_id=bid.req_id
  where bid.is_accepted=0 and r.user_id = $user_id";

  if ($result = $conn->query($sql)) {
        $list_of_requirements=array();
        //print("here");

        while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
        {
            //echo($row);
            array_push($list_of_requirements,$row);
        }
        $response_transaction = array();

        $response_transaction['list'] = $list_of_requirements;
        $response_transaction['DELIVERY_CHARGE_PER_KM'] = DELIVERY_CHARGE_PER_KM;
        $response_transaction['TRANSACTION_CHARGE_PERCENTAGE'] = TRANSACTION_CHARGE_PERCENTAGE;
        echo json_encode($response_transaction);
   } else {
        $response = array('response_code' => 404, );
        echo json_encode($conn->error);
  }


}

$conn->close();

?>
