            <!-- Cabeza -->
  			<div class="row align-items-center">
  				<div class="col-sm-2">
  					<img alt="Logotipo" src="views/theme/imaxes/logo.png">
  				</div>
  				<div class="col-sm-7">
  					<ul id="menu">
      					<?php 
      					     $paxina = basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING']);
      					     $index = "";
      					     $produto = "";
      					     $categoria = "";
      					     if ($paxina == "index.php") {
      					         $index = "activo";
      					     } else if ($paxina == "listarProdutos.php") {
      					         $produto = "activo";
      					     } else if ($paxina == "listarCategoriaProdutos.php") {
      					         $categoria = "activo";
      					     }
      					     if ($paxina) {
      					         echo "<li class='$index'><a href='index.php'>INICIO</a></li>";
      					         echo "<li class='$produto'><a href='listarProdutos.php'>LISTAR PRODUTOS</a></li>";
      					         echo "<li class='$categoria'><a href='listarCategoriaProdutos.php'>LISTAR CATEGORÍA DE PRODUTOS</a></li>";
      					     }
      					?>
  					</ul>
  				</div>
  				<div class="col-sm-3">
  				<p>Usuario público</p>
  				</div>
  			</div>
  			<!-- Fin Cabeza -->