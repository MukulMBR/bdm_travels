<?php
  $db = mysqli_connect('localhost', 'root', '', 'bdm');

  $username = $_POST['username'];
  $password = $_POST['password'];

  // Prepare the SQL statement using a parameterized query
  $stmt = mysqli_prepare($db, "SELECT * FROM login WHERE username = ?");

  // Bind the parameter to the statement
  mysqli_stmt_bind_param($stmt, "s", $username);

  // Execute the prepared statement
  mysqli_stmt_execute($stmt);

  // Get the result of the executed statement
  $result = mysqli_stmt_get_result($stmt);

  // Check if any rows are returned
  if ($row = mysqli_fetch_assoc($result)) {
    // Verify the hashed password
    if (password_verify($password, $row['password'])) {
      echo json_encode("Success");
    } else {
      echo json_encode("Error");
    }
  } else {
    echo json_encode("Error");
  }

  // Close the database connection
  mysqli_close($db);
?>
