<?php 
    session_start();
?>
<!DOCTYPE html>
<html lang="es">
	<head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">    
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>&bull; Plantilla PHP &bull;  	</title>
        <link rel="icon" type="image/png" sizes="64x64" href="favicon.png"/>	
        <meta name="description" content="Plantilla básica para DAWDUAL">
        <meta name="author" content="Jose Manuel Sabarís García">   
        
        <!-- Bootstrap CDNs -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
		<!-- Fin Bootstrap CDNs --> 
		<!-- Estilos propios -->
		<link rel="stylesheet" href="css/estilos.css">		
		<link rel="stylesheet" href="css/propios.css">	
  	</head>
  	<body>
  		<div class="container my-2 p-3">
  			<!-- Cabeza -->
  			<div class="row align-items-center">
  				<div class="col-sm-2">
  					<img alt="Logotipo" src="imaxes/logo.png">
  				</div>
  				<div class="col-sm-7">
  					<ul id="menu">
  						<li><a href="index.php">Inicio</a></li>
  						<li class="activo"><a href="arboresListaxe.php">Árbores Galegas</a></li>
  						<li><a href="logout.php">Saír Sesión</a></li>
  					</ul>
  				</div>
  				<div class="col-sm-3">
  					<?php include_once 'includes/cookieVisitas.php';?> 
  				</div>
  			</div>
  			<!-- Fin Cabeza -->
  			
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Árbores típicas galegas - Engadir</h1>
  					<p>Anímate a inserir algunha, quedará gardado na sesión do navegador.</p>
  						<?php
  						    require_once(__DIR__."/model/Arbore.php");
  						    $nomeComun = "";
  						    $nomeLatino = "";
  						    $alturaMaxima = 0;
  						    $arbore = null;
  						    $erroText = "";
  						    
							if (isset($_REQUEST["accion"]) && $_REQUEST["accion"] == "eliminar" && isset($_REQUEST["idArbore"])) {
                                unset($_SESSION["arbores"][$_REQUEST["idArbore"]]);
							    header("location: arboresListaxe.php");
							    echo "<div class='alert alert-success alert-dismissible fade show'>Árbore eliminada correctamente</div>";
							}
							
							if (isset($_REQUEST["envio"]) && $_REQUEST["envio"] == "1") {
							    require_once(__DIR__."/includes/utilidades.php");
							    
							    $nomeComun = recolle("nomeComun");
							    $nomeLatino = recolle("nomeLatino");
							    $alturaMaxima = recolle("alturaMaxima");
							    $arbore = new Arbore($nomeComun, $nomeLatino, $alturaMaxima);
							    
							    foreach ($_SESSION["arbores"] as $arb) {
							        $arb = unserialize($arb);
							        if ($arb->getNomeLatino() == $arbore->getNomeLatino()) {
							            $erroText = "Árbore repetida";
							            break;
							        }
							    }
							    
							    if ($erroText == "") {
							        $_SESSION["arbores"][] = serialize($arbore);
							        header("location: arboresListaxe.php");
							        echo "<div class='alert alert-success alert-dismissible fade show'>Árbore engadida correctamente</div>";
							    }
							}
							
							
						?>
						<form action="<?=$_SERVER['PHP_SELF']?>" action="GET" class="<?=$erroText != '' ? 'was-validated' : '';?>">
    						<div class="form-group">
    							<label for="nomeComun">Nome común</label>
    							<input type="text" name="nomeComun" id="nomeComun" minlength="3" maxlength="50" value="<?=$nomeComun?>" class="form-control" placeholder="Introduza un nome común de árbore" required>
    							<div class="valid-feedback">
    								Correcto!!!
    							</div>
    							<div class="invalid-feedback">
    								Por favor, introduzca un texto válido, números e letras incluíndo o guión baixo e medio.
    							</div>
    							<label for="nomeLatino">Nome latino</label>
    							<input type="text" name="nomeLatino" id="nomeLatino" minlength="3" maxlength="50" value="<?=$nomeLatino?>" class="form-control" placeholder="Introduza un nome latino de árbore" required>
    							<div class="valid-feedback">
    								Correcto!!!
    							</div>
    							<div class="invalid-feedback">
    								Por favor, introduzca un texto válido, números e letras incluíndo o guión baixo e medio.
    							</div>
    							<label for="alturaMaxima">Altura máxima</label>
    							<input type="number" name="alturaMaxima" id="alturaMaxima" min="1" max="150" value="<?=$alturaMaxima?>" class="form-control" placeholder="0" required>
    							<div class="valid-feedback">
    								Correcto!!!
    							</div>
    							<div class="invalid-feedback">
    								Por favor, introduzca un valor válido, números.
    							</div>
    						</div>
    						<button type="submit" name="envio" value="1" class="btn btn-primary">Enviar</button>
    						<button type="reset" class="btn btn-warning">Borrar</button>
						</form>
						<hr class="my-4">
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<?php 
  					     $paxina = basename($_SERVER['REQUEST_URI'], '?' . $_SERVER['QUERY_STRING']);
  					     $arboresForm = "list-group-item";
  					     if ($paxina == "arboresForm.php") {
  					         $arboresForm = "list-group-item active";
  					     }
  					     if ($paxina) {
  					         echo "<ul class='list-group'>";
  					         echo "<li class='$arboresForm'><a href='arboresForm.php'>Engadir árbore</a></li>";
  					         echo "<li class='list-group-item'><a href='arboresListaxe.php'>Listaxe de árbores</a></li>";
  					         echo "</ul>";
  					     }
  					?>
  				</div>
  			</div>
  			<!-- Fin Medio -->
  			
  			<!-- Pe -->
  			<div class="row text-center">
  				<div class="col-12">
  					&copy; DWAD 2019 - 2020
  				</div>
  			</div>
  			<!-- Fin Pe -->
  		</div>
  	</body>
</html>
