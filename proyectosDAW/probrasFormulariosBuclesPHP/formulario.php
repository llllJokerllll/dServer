<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">    
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>&bull; Plantilla PHP &bull; &#x1F342;  	</title>
	<link rel="icon" type="image/png" sizes="64x64" href="favicon.png"/>
    <meta name="description" content="Plantilla para DAW">
    <meta name="author" content="Julio Mosquera González">    
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
	<script src="https://kit.fontawesome.com/3f7b4da8bf.js" crossorigin="anonymous"></script>
	<!-- Estilos propios --> 
	<link rel="stylesheet" href="css/estilos.css">
	<link rel="stylesheet" href="css/form_login.css">

  </head>
  <body>
    <div class="container-fluid">
		<div class="row text-center" id="topbar">
			<div class="col-12 col-md-7 text-md-left">
				<i class="fas fa-phone rgtspace-5"></i> +34 (988) 988 988
				<i class="far fa-envelope rgtspace-5"></i> info@chancastic.com
				<div class="social-icons">
    				<a href="#" title="Ligazón ao noso perfil de Facebook"><i class="fab fa-facebook-f"></i></a>
    				<a href="#" title="Ligazón ao noso perfil de Instagram"><i class="fab fa-instagram"></i></a>
    				<a href="#" title="Ligazón ao noso perfil de Youtube"><i class="fab fa-youtube"></i></a>
    				<a href="#" title="Ligazón ao noso perfil de Linkedin"><i class="fab fa-linkedin"></i></a>
				</div>
			</div>
			<div class="col-12 col-md-5 user-zone text-md-right">
				<a href="#" title="Idioma"><i class="fas fa-language"></i></a>
				<a href="login.php" title="Login"><i class="fas fa-sign-in-alt"></i> Login</a>
				<a href="#" title="Sign In"><i class="fas fa-edit"></i> Rexistrarse</a>							
			</div>
		</div>
		<div class="row no-gutters sticky-top" id="cabezaMenu">
			<div class="col-12">
				<nav class="navbar navbar-expand-lg navbar-light sticky-top">				 
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu-collapsado-1">
						<span class="navbar-toggler-icon"></span>
					</button> 
					<a class="navbar-brand" href="#"><img src="imaxes/logo.png" alt="Logotipo"/></a>
					<div class="collapse navbar-collapse" id="menu-collapsado-1">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item">
								 <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item active">
								 <a class="nav-link" href="formulario.php">Probas formulario</a>
							</li>
							<li class="nav-item">
								 <a class="nav-link" href="#">Público</a>
							</li>
							<li class="nav-item">
								 <a class="nav-link" href="login.php">Login</a>
							</li>
							<li class="nav-item">
								 <a class="nav-link" href="#">Privado</a>
							</li>
							<li class="nav-item dropdown">
								 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">Ligazóns privadas</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
									 <a class="dropdown-item" href="#">Ligazón 1</a> <a class="dropdown-item" href="#">Ligazón 2</a> <a class="dropdown-item" href="#">Ligazón 3</a>
									<div class="dropdown-divider">
									</div> <a class="dropdown-item" href="#">Submenú 4</a>
								</div>
							</li>
						</ul>					
						<form class="form-inline my-2 my-lg-0">
							<div class="input-group">
								<div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                                </div>
                          		<input class="form-control mr-sm-2" type="search" placeholder="Procura" aria-label="Procura">
                          	</div>
                          <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Procura</button>
                        </form>
					</div>
				</nav>
			</div>
		</div>
		<div class="row" id="breadcrumbs">
			<nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php">Home</a></li>                
                <li class="breadcrumb-item active" aria-current="page">Formulario</li>
              </ol>
            </nav>
		</div>	
		<!-- Zona principal da páxina -->
		<div class="row mb-5">
			<!-- Contido -->
        	<div class="col-md-8 col-lg-9">
                <h1>Formulario</h1>
                
                <p>Aquí irán os formularios para practicar</p>
                
          	</div>
          	<!-- Fin contido principal -->
            <div class="col-md-4 col-lg-3" id ="lateral">
                <h2>Opcións laterais</h2>
                <div class="direccion caixa">
					<h3>DAW Dual, S.A.U. de deseño</h3>
					<p>
						R/ CIFP A Carballeira<br>
						32002, Ourense<br>
						988 999 999 - Fax: 988 999 999
					</p>
				</div>
				<div class="sobremin caixa">
					<h3>Sobre min</h3>
					<p>
						Somos un grupo que se está formando para ser profesionais da programación espcecializada en Web. Estamos comezando porque estamos en 1º curso, pero todo se andará e bla, bla, bla, ...
					</p>
				</div>                
          	</div>
        </div>
		<!-- Fin zona principal da páxina -->
			
		<!-- Pé de páxina -->
		<div class="row text-center" id="pe">
			<div class="col-md-6 text-md-left">
				Copyright © 2020 - Todos os dereitos reservados
			</div>
			<div class="col-md-6 text-md-right">
				Julio Mosquera González
			</div>
		</div>
		
	</div>
  </body>
</html>