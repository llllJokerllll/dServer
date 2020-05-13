<?php 
include_once("helpers/utilidades.php");
    if (!isset($_COOKIE["peticionIdioma"])) {
        setcookie("peticionIdioma", "1", time() + 3600 * 24);
    } else {
        setcookie("peticionIdioma", (int) $_COOKIE["peticionIdioma"] + 1, time() + 3600 * 24 * 60);
    }
    
    if (isset($_REQUEST["envio"]) && $_REQUEST["envio"] == "1") {
        $idioma = recolle("idioma");
        setcookie("idioma", $idioma, time() + 3600 * 24 * 60);
        Header("Location:index.php");
    }
?>
<div class= "modal fade" id="colorModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Seleccionar idioma</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
            	</button>
      		</div>
      		<div class="modal-body">
                    <form action="<?= $_SERVER["PHP_SELF"]?>" method="POST">
                    	<div class="form-group">					
                        	<label for="idioma">Idiomas: </label>
                        	<select class="form-control" name="idioma" required>
                            	<option value="Castellano">Castellano</option>
								<option value="Galego">Galego</option>
								<option value="English">English</option>                       
                            </select><br>
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