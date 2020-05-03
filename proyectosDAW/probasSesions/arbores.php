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
		
		<?php 
		if(!isset($_SESSION["arbore"])) {
		    $_SESSION["arbore"] = [];
		}
		?>
		
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
  						<li><a href="sesions.php">Ver sesións</a></li>
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
  					<h1>Árbores típicas galegas</h1>
  					<p>Anímate a inserir algunha, quedará gardado na sesión do navegador.</p>
  					<?php 
  			             
  					     if (isset($_REQUEST["envio"]) && $_REQUEST["envio"] == 1) {
  					         if (!in_array($_REQUEST["nome"], $_SESSION["arbore"])) {
  					             array_push($_SESSION["arbore"], $_REQUEST["nome"]);
  					             echo "<table class='table'><tr class='table-success'><td>Árbore engadida correctamente</td></tr></table>";
  					         } else {
  					             echo "<table class='table'><tr class='table-danger'><th>Houbo erros na tramitación do formulario</th></tr>";
  					             echo "<tr class='table-danger'><td>Nome da árbore repetida</td></tr></table>";
  					         }
  					     }
  					
  					?>
  					
  					<form action="<?=$_SERVER["PHP_SELF"]?>" method="GET">
  						<label for="nome">Nome da árbore</label>
  						<input class="form-control" type="text" name="nome" id="nome" maxlength="50" placeholder="Introduza un nome de árbore" required>
  						<div class="valid-feedback">Correcto!</div>
  						<div class="invalid-feedback">Incorrecto!</div>
  						
  						<br>
  						<input type="hidden" name="envio" value="1">
  						<button type="submit" class="btn btn-success">Enviar</button>
  						<button type="reset" class="btn btn-warning">Borrar</button>
  						<hr>
  					</form>               
  					<?php 
  					     
  					
  					     if (isset($_REQUEST["envio"]) && $_REQUEST["envio"] == 1) {
  					    				
  					         sort($_SESSION["arbore"], SORT_NATURAL | SORT_FLAG_CASE);
  					         
  					         echo "<pre>";
  					         echo "<table class='table table-striped'>";
  					         echo "<tr class='bg-success'><th>Nome da árbore</th></tr>";
  					         foreach ($_SESSION["arbore"] as $key => $value) {
  					             echo "<tr><td>$value</td>\t\t<td><a href='eliminarArbore.php?id=$key'>Eliminar</a></tr>";
  					         }
  					         echo "</table>";
  					         echo "</pre>";
  					     } 	
      					
  					?>
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
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

<?php 
if(!isset($_COOKIE["color"]) && (!isset($_COOKIE["peticionColor"])) || $_COOKIE["peticionColor"] < 5){
    include_once 'includes/cookieColor_2.php';
}

?>