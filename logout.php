<?php

//start sessions
session_start();
//destory the session and redirect to login.php
session_destroy();
    header('Location: index.html');
?>
