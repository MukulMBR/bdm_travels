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

$updateQuery = "UPDATE buses SET busCapacity = ?, busDetails = ?, busName = ? WHERE busNumber = ?";
$updateStmt = mysqli_prepare($db, $updateQuery);

mysqli_stmt_bind_param($updateStmt, "ssss", $busCapacity, $busDetails, $busName, $busNumber);
$updateResult = mysqli_stmt_execute($updateStmt);

if ($updateResult) {
  echo json_encode("Success");
} else {
  echo json_encode("Error");
}
?>
