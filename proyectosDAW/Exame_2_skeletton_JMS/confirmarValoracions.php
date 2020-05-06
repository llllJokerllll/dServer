<?php
include_once 'top.php';
require_once 'menu.php';    
?>

    <!-- Medio -->
	<div class="row my-5">
    	<div class="col-md-9">
    		<h1>Confirmación de valoracións</h1>
    		<?php       		      
    		if (isset($_REQUEST["envio"]) && isset($_SESSION["troncos"])) {
    		    $tDAO = new ValoracionTroncosDAO();
    		    foreach ($_SESSION["troncos"] as $tr) {
    		        $tr = unserialize($tr);
    		        $tDAO->save($tr);
    		    }
    		    unset($_SESSION["troncos"]);
    		    echo "Valoracións perfectamente almacenadas na BD.";
    		}
            ?>            
    	</div>       
	</div>

<?php 
   require_once("bottom.php");
?>