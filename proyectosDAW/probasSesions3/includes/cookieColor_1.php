<?php include_once("includes/utilidades.php");
    if (!isset($_COOKIE["peticionColor"])) {
        setcookie("peticionColor", "1", time() + 3600 * 24);
    } else {
        setcookie("peticionColor", (int) $_COOKIE["peticionColor"] + 1, time() + 3600 * 24 * 20);
    }
    
    if (isset($_REQUEST["envio"]) && $_REQUEST["envio"] == "1") {
        $color = recolle("color");
        $visitas -= 2;
        setcookie("visitas", $visitas, time() + 3600 * 24 *15);
        setcookie("color", $color, time() + 3600 * 24);
        Header("Location:index.php");
    }
?>
<form action="<?= $_SERVER["PHP_SELF"]?>" method="POST">
	<div class="form-group">
		<label for="color">Cor preferido para o fondo da páxina</label>
		<input type="color" class="form-control" name="color" id="color" value="LightSkyBlue">
	</div>
	<input type="hidden" name="envio" value="1">
	<button type="submit" class="btn btn-success">Enviar</button>
	<button type="reset" class="btn btn-warning">Borrar</button>
</form>