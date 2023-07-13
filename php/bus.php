<?php
$db = mysqli_connect('localhost', 'root', '', 'bdm');
if (!$db) {
  echo "Database connection failed";
  exit();
}

$query = "SELECT * FROM buses";
$result = mysqli_query($db, $query);
$rows = array();
while ($row = mysqli_fetch_assoc($result)) {
  $rows[] = $row;
}

header('Content-Type: application/json');
echo json_encode($rows);
?>
