<?php
  $db = mysqli_connect('localhost', 'root', '', 'bdm');
  if (!$db) {
    echo "Database connection failed";
  }

  $username = $_POST['username'];
  $password = $_POST['password'];

  // Prepare the SQL statement to check if the username already exists
  $stmt = mysqli_prepare($db, "SELECT username FROM login WHERE username = ?");

  // Bind the parameter to the statement
  mysqli_stmt_bind_param($stmt, "s", $username);

  // Execute the prepared statement
  mysqli_stmt_execute($stmt);

  // Get the result of the executed statement
  $result = mysqli_stmt_get_result($stmt);

  // Check if any rows are returned
  if (mysqli_num_rows($result) > 0) {
    echo json_encode("Error");
  } else {
    // Hash the password
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Prepare the SQL statement to insert the new user
    $stmt = mysqli_prepare($db, "INSERT INTO login (username, password) VALUES (?, ?)");

    // Bind the parameters to the statement
    mysqli_stmt_bind_param($stmt, "ss", $username, $hashedPassword);

    // Execute the prepared statement
    $query = mysqli_stmt_execute($stmt);

    // Check if the insertion was successful
    if ($query) {
      echo json_encode("Success");
    } else {
      echo json_encode("Error");
    }
  }

  // Close the database connection
  mysqli_close($db);
?>
