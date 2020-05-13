            <!-- Pe -->
  			<div class="row text-center">
  				<div class="col-12">
  					&copy; DWAD 2019 - 2020
  				</div>
  			</div>
  			<!-- Fin Pe -->
  		</div>
  		<!-- Fin Contenido -->
  	</body>
</html>

<?php 
if(!isset($_COOKIE["idioma"]) && (!isset($_COOKIE["peticionIdioma"])) || $_COOKIE["peticionIdioma"] < 5){
    include_once 'helpers/cookieIdioma.php';
}

?>