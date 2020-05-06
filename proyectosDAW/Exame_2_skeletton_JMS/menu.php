            <!-- Cabeza -->
			<div class="row align-items-center">
				<div class="col-sm-2">					
					<img src="imaxes/logo.png" alt="Logotipo">	
				</div>
				<?php 
				$numTroncos = 0;
				if (isset($_SESSION["troncos"])){
				    $numTroncos = count($_SESSION["troncos"]);
				}
				?>
				<div class="col-sm-7">
					<nav class="navbar navbar-expand-lg">
    					<ul  class="navbar-nav">
    						<li class="nav-item"><a class="nav-link" href="index.php">Inicio</a></li>
    						<li class="nav-item"><a class="nav-link" href="enunciado.php">Enunciado</a></li>
    						<li class="nav-item"><a class="nav-link" href="crearTroncosSesion.php">Crear valoración</a></li>
    						<li class="nav-item"><a class="nav-link" href="verValoracionsPendentes.php"><i class="fas fa-tree"></i><?= $numTroncos == 0 ? "" : " $numTroncos"?></a></li>
    						    <!-- <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href='#' data-toggle="dropdown">Valoración troncos</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                      <a class="dropdown-item" href="crearTroncos.php">Crear valoración</a>
                                      <a class="dropdown-item" href="verTroncosSesion.php">Ver valoracións sen confirmar</a>                                      
                                      <a class="dropdown-item" href="verTroncosBD.php">Ver troncos base de datos</a>
                                    </div>
                                </li>-->                                
    					</ul>    					
					</nav>
				</div>	
				<div class="col-sm-3">					
					   <span>Usuario público</span>					
				</div>			
			</div>