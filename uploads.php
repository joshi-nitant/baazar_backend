<?php
error_reporting(E_ERROR | E_PARSE);
$conn = mysqli_connect('localhost','root','','baazar');



//Response object structure
$response = new stdClass;
$response->status = null;
$response->message = null;

//Uploading File
$destination_dir = "uploads/";

$base_filename = basename($_FILES["file"]["name"]);
//new
$name = $_POST['name'];
$des = $_POST['des'];
$email=basename($_FILES["file"]["name"]);

//------
$temp = explode(".", $base_filename);
$target_file = $destination_dir .round(microtime(true)) . '.' . end($temp);
$path = "http://192.168.43.222/" . $target_file;
//$base_filename = basename($_FILES["file"]["name"]);
//$target_file = $destination_dir . $base_filename;

if (isset($_FILES["file"])) {
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)){
        $sql = "INSERT INTO pp (name, image) VALUES ('$name', '$path')";

        if ($conn->query($sql) === TRUE) {
              //echo json_encode('insert success');
            } else {
    //echo "Error: " . $sql . "<br>" . $conn->error;
}
        $response->status = false;
        $response->message = "file uploaded successfully";
    }

    else {
        $response->status = false;
        $response->message = "file uploadeda faild";
    }
}else{
    $response->status = false;
    $response->message = "file uploadedasdsad faild";
}

header('Content-type: application/json');
echo json_encode($response);
$conn->close();
?>
