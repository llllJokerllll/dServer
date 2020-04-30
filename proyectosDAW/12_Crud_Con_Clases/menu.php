            <!-- Cabeza -->
  			<div class="row align-items-center">
  				<div class="col-sm-2">
  					<img alt="Logotipo" src="imaxes/logo.png">
  				</div>
  				<div class="col-sm-7">
  					<ul id="menu">
						<?php            
                            if(isset($_SESSION['loged_user'])) {      
                                echo "<a href='crearPais.php'>Dar de alta país</a> | ";
                                echo "<a href='listarPaises.php'>Listar Paises</a> | ";                
                                echo "<a href='salir.php'>Salir</a><br><br>";                                
                            } else {
                                header("location: login.php");
                            }
                        ?>
  					</ul>
  				</div>
  				<div class="col-sm-3">
  					<?php            
                        if(isset($_SESSION['loged_user'])) {
                            echo "<p>Usuario: ".$_SESSION['loged_user']."  Fecha: ".date('Y/m/d')." ".date('h:i:s') . "</p>";  
                        }
                    ?>
  				</div>
  			</div>
  			<!-- Fin Cabeza -->

