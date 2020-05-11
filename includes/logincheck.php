<?php

//start sessions
session_start();

//if the session variable is not set, redirect to login.php
if (!isset ($_SESSION['login_user'])) {
    header('Location: ../html/login.html');
}

//check the login level
if ($_SESSION['login_level'] < $pagelevel) {
  echo "<script>alert('No permission to access!');parent.location.href='../html/login.html';</script>";
}
?>
