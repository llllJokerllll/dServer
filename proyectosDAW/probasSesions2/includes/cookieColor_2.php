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
<div class= "modal fade" id="colorModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Seleccionar cor de fondo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
            	</button>
      		</div>
      		<div class="modal-body">
                    <form action="<?= $_SERVER["PHP_SELF"]?>" method="POST">
                    	<div class="form-group">					
                        	<label for="color">Cor de fondo: </label>
                        	<input class="form-control" type="color" name="color"  value="LightSkyBlue" id="color"/>
                    	</div>		
                    	<input type="hidden" name="envio" value="1"/>		
                        <button type="submit" class="btn btn-success" >Enviar</button>
                    	<button type="reset" class="btn btn-warning" >Borrar</button>
                    </form>
           </div>
        </div>
    </div>    
</div>
<?php 
    echo "<script type='text/javascript'>
        $(window).on('load', function() {
            $('#colorModal').modal('show');
        });
        </script>";
?>