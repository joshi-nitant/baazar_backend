<?php
$DB_SERVER = 'localhost';
$DB_USERNAME = 'root';
$DB_PASSWORD = 'Demsa@2000';
$DB_NAME = 'baazar';

$conn = new mysqli($DB_SERVER, $DB_USERNAME, $DB_PASSWORD, $DB_NAME);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>
