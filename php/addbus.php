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

$selectQuery = "SELECT * FROM buses WHERE busName = ? OR busNumber = ?";
$insertQuery = "INSERT INTO buses (busName, busNumber, busCapacity, busDetails) VALUES (?, ?, ?, ?)";

$selectStmt = mysqli_prepare($db, $selectQuery);
$insertStmt = mysqli_prepare($db, $insertQuery);

mysqli_stmt_bind_param($selectStmt, "ss", $busName, $busNumber);
mysqli_stmt_execute($selectStmt);
$result = mysqli_stmt_get_result($selectStmt);

if (!$result) {
  echo json_encode("Error");
  exit();
}

$count = mysqli_num_rows($result);

if ($count == 0) {
  mysqli_stmt_bind_param($insertStmt, "ssss", $busName, $busNumber, $busCapacity, $busDetails);
  $insertResult = mysqli_stmt_execute($insertStmt);

  if ($insertResult) {
    echo json_encode("Success");
  } else {
    echo json_encode("Error");
  }
} else {
  echo json_encode("Error");
}
?>
