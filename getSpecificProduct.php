<?php

// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
// $cn = mysqli_connect($DB_SERVER,$DB_USERNAME,$DB_PASSWORD,$DB_NAME,$DB_PORT);
//
//
require 'connection.php';
$data = json_decode(file_get_contents('php://input'), true);
$user_id = $data['user_id'];



$q="select * from product where user_id = $user_id";
$r=mysqli_query($conn,$q)   or die( mysqli_error($conn));


$in=array();

while($i=mysqli_fetch_array($r,MYSQLI_ASSOC))
{
	$in[]=$i;
}
$out=array();


if(count($in)==0){
  $response = array('data' => 404);
	echo json_encode($in);
}else{
  $response = array('data' => $in);
	echo json_encode($in);
}
$conn->close();
?>
