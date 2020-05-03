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
  						<li><a href="index.php">INICIO</a></li>
  						<li class="activo"><a href="login.php">LOGIN</a></li>
  					</ul>
  				</div>
  				<div class="col-sm-3">

  				</div>
  			</div>
  			<!-- Fin Cabeza -->
  			
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Login</h1>
  					<div id="login">
  						<h2>Por favor, inicie<br>sesión</h2>
  						
  						<form method="POST" action="validar.php">
                            <input type="text" name="nnombre" placeholder="Usuario" />
                            <br />
                            <input type="password" name="npassword" placeholder="Contraseña" />
                            <br />
                            <button type="submit" class="btn btn-success">Inicar Sesion</button>
                        </form>
  					</div>
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>

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