<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Crear Categoría</h1>
    				<form class="form-group" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
                        <label for="nome">Nome </label><input class="form-control" type="text" name="nome" minlength="1" maxlength="50" required><br>
                        <label for="descricion">Descrición </label><textarea class="form-control" type="text" name="descricion"></textarea><br>
                        <input type="checkbox" name="estado" value="1" checked>
                        <label> Activo</label><br>
            
                        <button type="submit" class="btn btn-success" name="envio" value="1">Crear</button>
                        <button type="reset" class="btn btn-warning" name="borrar">Borrar</button>
                    </form>
                    <?php
                            
                        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                            $categoriaDao = new CategoriaProdutoDAO();
                            $categoriaDao->save(new CategoriaProduto(recolle("nome"), recolle("descricion") != "" ? recolle("descricion") : NULL, recolle("estado") != "1" ? "0" : "1"));
                            header("location: listarCategoriaProdutos.php");
                        }
                    ?>
    			</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<ul class="list-group">
        				<li class="list-group-item activo"><a href="crearCategoriaProdutos.php">Nova categoría de produtos</a>
        			</ul>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'views/theme/bottom.php';
?>