<?php
require_once 'views/theme/top.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
    $cDao = new CategoriaProdutoDAO();
    $categoria = $cDao->get($_GET["id"]);

    if ($categoria != null) {
        $cDao->delete($categoria);
        header("location: listarCategoriaProdutos.php");
    } else {
        echo "Non existe a categoría seleccionada";
        header("location: listarCategoriaProdutos.php");
    }
}
?>