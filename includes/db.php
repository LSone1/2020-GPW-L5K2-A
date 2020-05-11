<?php

// 1. Open database connection
$dbhost = "localhost";
$dbuser = "www_cdut_work";
$dbpass = "ead1230.";
$dbname = "www_cdut_work";

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
