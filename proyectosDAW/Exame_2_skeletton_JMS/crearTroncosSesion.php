<?php
    include_once 'top.php';
    require_once 'menu.php';
?>

            <!-- Medio -->
			<div class="row my-5">
				<div class="col-md-12">
					<h1>Crear valoracion de troncos</h1>

                    
        <?php                    
            if (isset($_REQUEST["envio"])) {        
                require_once 'includes/utilidades.php';
                $tronco = null;
                $madeira = recolle("madeira");
                $cantidade = recolle("cantidade");
                $altura = recolle("altura");
                $radio = recolle("radio");
                $desconto = recolle("desconto");
                
                if (!isset($_SESSION["troncos"])) {
                    $_SESSION["troncos"] = [];
                }
                
                $tronco = new ValoracionTroncos($madeira, $cantidade, $altura, $radio, $desconto, ValoracionTroncos::calcularVolume($cantidade, $radio, $altura, $desconto));
                $_SESSION["troncos"][] = serialize($tronco);
                
                header("location: verValoracionsPendentes.php");                
            }                       
        ?>
			<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">                                                
                <div class="form-group">
                	<label for="madeira">Madeira</label>
                	<select name="madeira" id="madeira" class="form-control" required>
                		<option value="Piñeiro">Piñeiro</option>
                		<option value="Castiñeiro">Castiñeiro</option>
                		<option value="Carballo">Carballo</option>
                	</select>
                </div>   
                <div class="form-row">                        	
                    <div class="form-group col-sm-6">
                    	<label for="cantidade">Cantidade</label>
                    	<input class="form-control" type="number" name="cantidade" min="1" max="999999" value="0" required>
                    </div>
                    <div class="form-group col-sm-6">
                    	<label for="altura">Altura en m.</label>
                    	<input class="form-control" type="number" name="altura" step="0.01" min="0.01" max="999999.99" value="0" required>
                    </div>
				</div>    
				<div class="form-row">                                          
                    <div class="form-group col-sm-6">
                    	<label for="radio">Radio en m.</label>
                    	<input class="form-control" type="number" name="radio" step="0.01" min="0.01" max="999999.99" value="0" required>
                    </div>
                    <div class="form-group col-sm-6">
                    	<label for="desconto">Desconto (%)</label>
                    	<input class="form-control" type="number" name="desconto" min="0" max="100" value="0" required>
                    </div>
                </div>
                <hr>
                
                <button type="submit" class="btn btn-success" name="envio" value="enviar">Enviar</button>
                <button type="reset" class="btn btn-warning">Borrar</button>
            </form>
        
        		</div>				
			</div>
<?php
    include_once 'bottom.php';
?>