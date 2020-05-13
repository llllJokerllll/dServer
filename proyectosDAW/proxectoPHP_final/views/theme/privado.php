<?php
if (empty($_SESSION['loged_user'])) {
    header("location: login.php");
}
?>
