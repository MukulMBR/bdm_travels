<?php
$db = mysqli_connect('localhost', 'root', '', 'bdm');
if (!$db) {
  echo "Database connection failed";
  exit();
}

$busNumber = $_POST['busNumber'];
$seats = $_POST['seats'];

// Check if the bus exists
$checkQuery = "SELECT * FROM buses WHERE busNumber = ?";
$checkStmt = mysqli_prepare($db, $checkQuery);
mysqli_stmt_bind_param($checkStmt, "s", $busNumber);
mysqli_stmt_execute($checkStmt);
$result = mysqli_stmt_get_result($checkStmt);

if (!$result) {
  echo json_encode("Error");
  exit();
}

$count = mysqli_num_rows($result);

if ($count == 1) {
  // Update the bus seat availability
  $updateQuery = "UPDATE buses SET availableSeats = availableSeats - ? WHERE busNumber = ?";
  $updateStmt = mysqli_prepare($db, $updateQuery);
  mysqli_stmt_bind_param($updateStmt, "is", $seats, $busNumber);
  $updateResult = mysqli_stmt_execute($updateStmt);

  if ($updateResult) {
    echo json_encode("Success");
  } else {
    echo json_encode("Error");
  }
} else {
  echo json_encode("Error");
}
?>
