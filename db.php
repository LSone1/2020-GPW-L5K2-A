<?php

// 1. Open database connection
$dbhost = "localhost";
$dbuser = "8108f22f1d2c";
$dbpass = "57b6f15075262f11";
$dbname = "l5k2a";

//connection to the database
$connection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
// Test if connection is ok
if (mysqli_connect_errno()) {
    die("Database connection failed: " .
        mysqli_connect_error() .
        " (" . mysqli_connect_errno() . ")"
    );
}

?>
