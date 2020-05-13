<?php
require_once 'views/theme/top.php';
include_once 'views/theme/privado.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
    $xDao = new XogoDAO();
    $xogo = $xDao->get($_GET["id"]);

    if ($xogo != null) {
        $xDao->delete($xogo);
        header("location: listarXogos.php");
    } else {
        echo "Non existe o produto seleccionado";
        header("location: listarXogos.php");
    }
}
?>