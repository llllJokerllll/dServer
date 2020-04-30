<?php
    include_once 'top.php';
    include_once 'menu.php';
?>
            <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Eliminación dun País</h1>
        <?php
                
            if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
                $cDAO = new CountryDAO();       
                $pais = $cDAO->get($_GET["id"]);
                
                if ($pais != null) {
                    $cDAO->delete($pais);
                    echo "País eliminado con éxito"; 
                    // header("location: listarPaises");
                } else {
                    echo "Non hai país co id proporcionado";
                }
                
                
            }
        ?>
        		</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'bottom.php';
?>