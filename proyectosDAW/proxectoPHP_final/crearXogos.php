<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';
include_once 'views/theme/privado.php';
define("CARTAFOL_IMAXES", "./uploads/");
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Crear xogo</h1>
						<?php
                            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                                //datos del archivo
                                $rutaSubida = CARTAFOL_IMAXES . basename($_FILES["imaxe"]["name"]);
                                $tipo_archivo = $_FILES['imaxe']['type'];
                                $tamano_archivo = $_FILES['imaxe']['size'];
                                //compruebo si las características del archivo son las que deseo
                                if (((strpos($tipo_archivo, "png") || strpos($tipo_archivo, "jpg")) && ($tamano_archivo < 10000000))) {
                                    echo "La extensión o el tamaño de los archivos no es correcta.";
                                } else {
                                    if (move_uploaded_file($_FILES['imaxe']['tmp_name'], $rutaSubida)){
                                        echo "El archivo ha sido cargado correctamente.";
                                    } else {
                                        echo "Ocurrió algún error al subir el fichero. No pudo guardarse.";
                                    }
                                }
                                $xDao = new XogoDAO();
                                $xDao->save(new Xogo(recolle("nome"), recolle("plataforma"), recolle("descricion") != "" ? recolle("descricion") : NULL, recolle("ano"), basename($_FILES["imaxe"]["name"]), recolle("online") == "1" ? "1" : "0"));
                                header("location: listarXogos.php");
                            }                
                        ?>
                        <form class="form-group" enctype="multipart/form-data" action="<?= htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
                            <label for="nome">Nome </label>
                            <input class="form-control" type="text" name="nome" minlength="2" maxlength="50" required><br>
                            <label for="plataforma">Plataforma </label>
                            <input class="form-control" type="text" name="plataforma" minlength="2" maxlength="50" required><br>
                            <label for="descricion">Descrición </label>
                            <textarea class="form-control" name="descricion"></textarea><br>
                            <label for="ano">Ano </label>
                            <input class="form-control" type="number" name="ano" minlength="4" maxlength="4" required><br>
                            <div class="form-group">
                            	<input type="hidden" name="MAX_FILE_SIZE" value="10000000">
                				<label for="imaxe">Subir ficheiro</label>
                				<input type="file" name="imaxe" id="imaxe" class="form-control" accept=".jpg, .png"/>
                			</div>
                            <input type="checkbox" name="online" value="1" checked>
                        	<label for="online"> Online</label><br>
                
                            <button type="submit" class="btn btn-success" name="envio" value="1">Crear</button>
                        	<button type="reset" class="btn btn-warning" name="borrar">Borrar</button>
                        </form>
                        
    			</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<ul class="list-group">
        				<li class="list-group-item activo"><a href="crearXogos.php">Crear xogo</a>
        			</ul>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'views/theme/bottom.php';
?>