<?php
include_once 'top.php';
require_once 'menu.php';

?>

    <!-- Medio -->
	<div class="row my-5">
    	<div class="col-md-9">
    		<h1>Confirmación de valoracións en lote</h1>
    		<?php       		      
    		if (isset($_REQUEST["envio"]) && isset($_SESSION["troncos"])){    		    
    		    $fecha = new DateTime();
    		    $lote = new LoteTroncos(recolle("nome"), $fecha->format("Y-m-d"));
    		    
    		    /*TODO*/
    		    
    		}
            ?>
            
    	</div>       
	</div>

<?php 
   require_once("bottom.php");
?>