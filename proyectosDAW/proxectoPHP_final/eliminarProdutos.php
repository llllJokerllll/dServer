<?php
require_once 'views/theme/top.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
    $pDao = new ProdutoDAO();
    $produto = $pDao->get($_GET["id"]);

    if ($produto != null) {
        $pDao->delete($produto);
        header("location: listarProdutos.php");
    } else {
        echo "Non existe o produto seleccionado";
        header("location: listarProdutos.php");
    }
}
?>