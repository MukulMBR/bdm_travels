<?php
$db = mysqli_connect('localhost', 'root', '', 'bdm');
if (!$db) {
    echo json_encode("Database connection failed");
    exit();
}

$userInput = $_GET['userInput'];

$query = "SELECT * FROM buses";
if (!empty($userInput)) {
    $query .= " WHERE busNumber = ? OR busName LIKE ?";
    $stmt = mysqli_prepare($db, $query);
    mysqli_stmt_bind_param($stmt, "ss", $userInput, $userInput);
} else {
    $stmt = mysqli_prepare($db, $query);
}

mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

$busDetails = [];
while ($row = mysqli_fetch_assoc($result)) {
    $busDetails[] = $row;
}

echo json_encode($busDetails);
?>
