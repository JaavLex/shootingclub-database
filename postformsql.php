<?php
$servername = "db";
$username = "root";
$password = "Pomme";

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
  die("Connection to SQL database has failed : " . $conn->connect_error);
}
echo "Connected";
?>
