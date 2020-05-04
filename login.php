<?php

//Connect to database
require('includes/db.php');

if (isset($_POST['submit'])) {
    if (empty($_POST['username']) || empty($_POST['password'])) {
        $error = "username or password is empty";
    } else {
      // Save username & password in a variable
        $username = $_POST['username'];
        $password = $_POST['password'];

        //Do query
        $query  = "SELECT username, password ";
        $query .= "FROM user ";
        $query .= "WHERE username = '$username' AND password = '$password' ";
        // Execute query
        $result = mysqli_query($connection, $query);

        if (!$result) {
            die ("query is wrong");
        }

        //check how many rows are selected
        $numrows = mysqli_num_rows($result);
        if ($numrows ==1) {
            //start to use sessions
            session_start();

            //create session variable
            $_SESSION['login_user'] = $username;
            $_SESSION['login_level'] = $row['level'];

            header('Location: dashboard.php');

        } else {
            echo "<script language='javascript'>alert('Login failed!');history.back();</script>";
        }

        //free results
        mysqli_free_result($result);

    }

}

//close database connection
mysqli_close($connection);

?>

<?php

if (isset ($error)) {
    echo "<span>" . $error . "</span>";
}

?>
