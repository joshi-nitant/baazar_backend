<?php

// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
// $cn = mysqli_connect($DB_SERVER,$DB_USERNAME,$DB_PASSWORD,$DB_NAME,$DB_PORT);

require 'connection.php';
require 'charges_management.php';

$data = json_decode(file_get_contents('php://input'), true);
$cat_id = $data['cat_id'];

$q="select * from product as prod,user as u where is_accepted=1 and category_id = '$cat_id' and prod.user_id = u.user_id";
$r=mysqli_query($conn,$q)   or die( mysqli_error($conn));


$in=array();

while($i=mysqli_fetch_array($r,MYSQLI_ASSOC))
{
	$in[]=$i;
}
$out=array();
$response_transaction = array();


if($conn->error){
	$response_transaction['response_code'] = 404;
	echo json_encode($response_transaction);
}else{
	$response_transaction['products'] = $in;
	$response_transaction['DELIVERY_CHARGE_PER_KM'] = DELIVERY_CHARGE_PER_KM;
	$response_transaction['TRANSACTION_CHARGE_PERCENTAGE'] = TRANSACTION_CHARGE_PERCENTAGE;
	$response_transaction['response_code'] = 101;
	echo json_encode($response_transaction);
}
$conn->close();
?>
