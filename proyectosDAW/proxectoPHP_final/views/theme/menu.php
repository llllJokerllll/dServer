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
          					$about = "";
          					$login = "";
          					$xogos = "";
          					if ($paxina == "index.php") {
          					    $index = "activo";
          					} else if ($paxina == "about.php") {
          					    $about = "activo";
          					} else if ($paxina == "login.php") {
          					    $login = "activo";
          					} else if ($paxina == "listarXogos.php") {
          					    $xogos = "activo";
          					}
                            if (!empty($_SESSION['loged_user'])) {
                                if ($paxina) {
                                    echo "<li class='$index'><a href='index.php'>INICIO</a></li>";
                                    echo "<li class='$about'><a href='about.php'>ABOUT</a></li>";
                                    echo "<li class='$xogos'><a href='listarXogos.php'>LISTAR XOGOS</a></li>";
                                    echo "<li><a href='logout.php'>LOGOUT</a></li>";
                                }
          					} else {
          					    if ($paxina) {
          					        echo "<li class='$index'><a href='index.php'>INICIO</a></li>";
          					        echo "<li class='$about'><a href='about.php'>ABOUT</a></li>";
          					        echo "<li class='$login'><a href='login.php'>LOGIN</a></li>";
          					    }
          					}
      					?>
  					</ul>
  				</div>
  				<div class="col-sm-3">
  					<?php 
  					setlocale(LC_ALL, 'es_ES');
  					$idioma = isset($_COOKIE["idioma"]) ? "Idioma: " . $_COOKIE["idioma"] : "";
  					echo $idioma . "<br>";
  					echo date('d/m/Y') . " " . date('h:i:s');
  					if (!empty($_SESSION['loged_user'])) {
  					    echo "<br>Hola " . $_SESSION['loged_user'];
  					}
  					?>
  				</div>
  			</div>
  			<!-- Fin Cabeza -->