<?php 
    session_start();
    
    if ($_SERVER["REQUEST_METHOD"] == 'GET' && isset($_GET["id"])) {
        unset($_SESSION["arbore"][$_GET["id"]]);
    }
    header("location: arbores.php?mensaxe=Arbore eliminada correctamente!");
?>