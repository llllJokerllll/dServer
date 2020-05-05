<?php
include_once 'top.php';
require_once 'menu.php';

require_once 'includes/utilidades.php';

$tronco = recolle("tronco");
if(isset($_SESSION["troncos"][$tronco])){
    unset($_SESSION["troncos"][$tronco]);
    header("location: verValoracionsPendentes.php");
} else {
    echo "El tronco seleccionado no existe";
}
?>