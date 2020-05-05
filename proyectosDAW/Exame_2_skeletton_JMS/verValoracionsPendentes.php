<?php
include_once 'top.php';
require_once 'menu.php';
?>
    <!-- Medio -->
	<div class="row my-5">
    	<div class="col-md-9">
    		<h1>Valoracións pendentes de confirmar na BD</h1>
    		<?php       		      
        		if(isset($_SESSION["troncos"])){
        		    $contador = 1;
        		    echo "<table class='table table-striped table-bordered'>";
        		    echo "<tr><th scope='col'>#</th><th scope='col'>Madeira</th><th scope='col'>Cantidade de troncos</th><th scope='col'>Desconto</th><th scope='col'>Volume</th><th>Acción</th></tr>";
        		  foreach ($_SESSION["troncos"] as $key => $tronco){
        		      $tronco = unserialize($tronco);
        		      $troncos[] = $tronco;
        		      echo "<tr>";
        		      echo "<td scope='col'>" . $contador++ . "</td>";
        		      echo "<td scope='col'>" . $tronco -> getMadeira() . "</td>";
        		      echo "<td scope='col'>" . $tronco -> getCantidade() . "</td>";
        		      echo "<td scope='col'>" . $tronco -> getDesconto() . "</td>";
        		      echo "<td scope='col'>" . $tronco -> getVolume() . " m<sup>3</sup></td>";
        		      echo "<td scope='col'><form action='eliminarTroncosSesion.php'><button type='submit' onclick='return confirm(\"¿Seguro que quieres borrar este pedido?\")' name='tronco' value='$key' class='fas fa-trash-alt' style='color:blue'/></form></td>";
        		      echo "</tr>";
        		  }
        		  echo "</table>";
        		  
        		} else {
        		    echo "Non existen valoracións pendentes de almacenar na base de datos.";
        		}
            ?>
    	</div>
        <div class="col-md-3">        	
        	<?php 
        	if (count($troncos) > 0){
        	?>
        	<form action="confirmarValoracions.php" method="POST">
       			<button type="submit" name="envio" class="btn btn-warning" style="width: 100%;">Confirmar valoracións</button>
        	</form>	
        	<hr>
        	<hr>
        	<hr>
        	<form action="confirmarValoracionsLote.php" method="POST">
        		<input type="text" name="nome" class="form-control" placeholder="Nome do lote" maxlength="50" required/><br>
       			<button type="submit" name="envio" class="btn btn-success" style="width: 100%;">Confirmar valoracións en lote</button>
        	</form>		
        	<?php 
        	}
        	?>
    	</div>
	</div>
<?php 
   require_once("bottom.php");
?>