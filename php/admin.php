<?php
  $db = mysqli_connect('localhost', 'root', '', 'bdm');
  if (!$db) {
    echo "Database connection failed";
    exit();
  }

  $busName = $_POST['busName'];
  $busNumber = $_POST['busNumber'];
  $busCapacity = $_POST['busCapacity'];
  $busDetails = $_POST['busDetails'];

  $insert = "INSERT INTO buses(busName, busNumber, busCapacity, busDetails) VALUES ('".$busName."', '".$busNumber."', '".$busCapacity."','".$busDetails"')";
  $query = mysqli_query($db, $insert);
  if ($query) {
    echo json_encode("Success");
  } else {
    echo json_encode("Error");
  }
?>
