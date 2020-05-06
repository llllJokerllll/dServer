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
    		    $loteDAO = new LoteTroncosDAO();
    		    $loteDAO->save($lote);
    		    
    		    $tDAO = new ValoracionTroncosDAO();
    		    foreach ($_SESSION["troncos"] as $tr) {
    		        $tr = unserialize($tr);
    		        $tr->setIdLote($lote->getId());
    		        $tDAO->save($tr);
    		    }
    		    unset($_SESSION["troncos"]);
    		    echo "Valoracións perfectamente almacenadas na BD en forma de lote co id:" . $lote->getId();
    		}
            ?>
            
    	</div>       
	</div>

<?php 
   require_once("bottom.php");
?>