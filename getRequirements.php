<?php
// $DB_SERVER = 'localhost';
// $DB_USERNAME = 'root';
// $DB_PASSWORD = '';
// $DB_NAME = 'baazar';
// $DB_PORT = 3307;
// $cn = mysqli_connect($DB_SERVER,$DB_USERNAME,$DB_PASSWORD,$DB_NAME,$DB_PORT);
require 'connection.php';
$data = json_decode(file_get_contents('php://input'), true);
$cat_id = $data['cat_id'];

$q="select * from requirement where is_accepted=1  and category = '$cat_id'";
$r=mysqli_query($conn,$q);

$in=array();

while($i=mysqli_fetch_array($r,MYSQLI_ASSOC))
{
	$in[]=$i;
}
$out=array();

if(count($in)==0){
	echo "404";
}else{
	echo json_encode($in);
}
$conn->close();

?>
