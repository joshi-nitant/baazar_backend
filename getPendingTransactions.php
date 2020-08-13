<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
//
// $conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME, $DB_PORT);
require 'connection.php';
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$data = json_decode(file_get_contents('php://input'), true);
$isSeller = $data['isSeller'];
$user_id = $data['user_id'];

if($isSeller=='true'){
      $sql = "Select tn.*,prod.*,bid.prod_bid_id,bid.bid_price,bid.bid_quantity,bid.product_id,bid.user_id as bid_user_id from
      transaction as tn INNER JOIN product_bid as bid ON tn.bid_id = bid.prod_bid_id
      INNER JOIN product as prod ON prod.prod_id = bid.product_id
      where is_completed = 0 and seller_id = $user_id and is_product_bid=1";

      if ($result = $conn->query($sql)) {
          $list_of_transaction_product = array();
          while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
              array_push($list_of_transaction_product, $row);
          }
      }else{
        $list_of_transaction_product = false;
        echo($conn->connect_error);
      }

      $sql = "Select tn.*,req.*,bid.req_bid_id,bid.bid_price,bid.bid_quantity,bid.req_id,bid.user_id as bid_user_id from
      transaction as tn INNER JOIN requirement_bid as bid ON tn.bid_id = bid.req_bid_id
      INNER JOIN requirement as req ON req.req_id = bid.req_id
      where tn.is_completed = 0 and tn.seller_id = $user_id and tn.is_product_bid=0";

      $list_of_transaction_requirement = array();
      if ($result = $conn->query($sql)) {
          while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
              array_push($list_of_transaction_requirement, $row);
          }
      }else{
        $list_of_transaction_requirement = false;
        echo($conn->connect_error);
      }
      $response_transaction = array();
      if($list_of_transaction_requirement){
        $response_transaction['transaction_requirement'] = $list_of_transaction_requirement;
      }
      if($list_of_transaction_product){
          $response_transaction['transaction_product'] = $list_of_transaction_product;
      }
      echo(json_encode($response_transaction));

}else{
  $sql = "Select tn.*,req.*,bid.req_bid_id,bid.bid_price,bid.bid_quantity,bid.req_id,bid.user_id as bid_user_id from
  transaction as tn INNER JOIN requirement_bid as bid ON tn.bid_id = bid.req_bid_id
  INNER JOIN requirement as req ON req.req_id = bid.req_id
  where tn.is_completed = 0 and tn.buyer_id = $user_id and tn.is_product_bid=0 ";

  $list_of_transaction_requirement = array();
  if ($result = $conn->query($sql)) {
      while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
          array_push($list_of_transaction_requirement, $row);
      }
  }else{
    $list_of_transaction_requirement = false;
    echo json_encode($conn->error);
  }
  $sql = "Select tn.*,prod.*,bid.prod_bid_id,bid.bid_price,bid.bid_quantity,bid.product_id,bid.user_id as bid_user_id from
  transaction as tn INNER JOIN product_bid as bid ON tn.bid_id = bid.prod_bid_id
  INNER JOIN product as prod ON prod.prod_id = bid.product_id
  where tn.is_completed = 0 and tn.buyer_id = $user_id and tn.is_product_bid=1";
  $list_of_transaction_product = array();
  if ($result = $conn->query($sql)) {
      while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
          array_push($list_of_transaction_product, $row);
      }
  }else{
      $list_of_transaction_product = false;
        echo json_encode($conn->error);
  }
  $response_transaction = array();
  if($list_of_transaction_requirement){
    $response_transaction['transaction_requirement'] = $list_of_transaction_requirement;
  }
  if($list_of_transaction_product){
      $response_transaction['transaction_product'] = $list_of_transaction_product;
  }
  echo(json_encode($response_transaction));
}
$conn->close();
?>
