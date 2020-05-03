<?php

$usuario = $_POST['nnombre'];
$pass = $_POST['npassword'];
define("USER", "admin");
define("PASS", "1234");

if (empty($usuario) || empty($pass)){
    header("Location: index.php");
    exit();
}

if (USER == $usuario && PASS == $pass) {
        session_start();
        $_SESSION['usuario'] = $usuario;
        header("Location: privado.php");
} else {
    header("Location: index.php");
    exit();
}


?>