<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
//
// $conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME, $DB_PORT);
//
// if ($conn->connect_error) {
//     die("Connection failed: " . $conn->connect_error);
// }
require 'connection.php';
$data = json_decode(file_get_contents('php://input'), true);

$transaction_id = $data['transaction_id'];
$delivery_address = $data['delivery_address'];
$total_amount =$data['total_amount'];
$product_amount = $data['product_amount'];
$transaction_charge = $data['transaction_charge'];
$packaging_charge = $data['packaging_charge'];
$delivery_charge = $data['delivery_charge'];
$razorpay_payment_id = $data['razorpay_payment_id'];
$razorpay_order_id = $data['razorpay_order_id'];
$razorpay_signature = $data['razorpay_signature'];
$date_accepted = date("Y-m-d H:i:s");


$sql = "UPDATE `transaction` SET
`is_completed`=0,
`delivery_status`=1,
`complete_date`='$date_accepted',
`razorpay_payment_id`='$razorpay_payment_id',
`razorpay_order_id`='$razorpay_order_id',
`razorpay_signature`='$razorpay_signature',
`delivery_amount`=$delivery_charge,
`transaction_amount`=$transaction_charge,
`packaging_amount`=$packaging_charge,
`total_amount`=$total_amount,
`delivery_address`='$delivery_address',
`product_charge`=$product_amount
WHERE transaction_id=$transaction_id";

if($conn->query($sql)){
  $response = "101";
  echo (json_encode($response));
}else{
  $response = "404";
  echo (json_encode($conn->error));
}
$conn->close();
?>
