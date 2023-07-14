<?php
$db = mysqli_connect('localhost', 'root', '', 'bdm');
if (!$db) {
  echo "Database connection failed";
  exit();
}

$busNumber = $_POST['busNumber'];

$deleteQuery = "DELETE FROM buses WHERE busNumber = ?";
$deleteStmt = mysqli_prepare($db, $deleteQuery);
mysqli_stmt_bind_param($deleteStmt, "s", $busNumber);
$deleteResult = mysqli_stmt_execute($deleteStmt);

if ($deleteResult) {
  echo json_encode("Success");
} else {
  echo json_encode("Error");
}
// Close the database connection
mysqli_close($db);
?>
