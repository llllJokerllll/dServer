<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Crear produto</h1>
    				<?php 
                		$cdao = new CategoriaProdutoDAO();
                		$categorias = $cdao->getAll();		
                		if (isset($categorias[0])) {
                    ?>
                        <form class="form-group" action="<?= htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
                            <label for="nome">Nome </label>
                            <input class="form-control" type="text" name="nome" minlength="1" maxlength="50" required><br>
                            <label for="prezo">Prezo </label>
                            <input  class="form-control" type="number" name="prezo" min="0" value="0.01" step="0.01" required><br>
                            <label>Categoría de produto</label>
                            <select class="form-control" name="categoria" required>
                                <?php 
                                
                                foreach ($categorias as $categoria){
                                    echo "<option value='" . $categoria->getId() . "'>".$categoria->getNome() . "</option>";
                                }
                                ?>
                            
                            </select><br>
                            <label for="descricion">Descrición </label>
                            <textarea class="form-control" type="text" name="descricion"></textarea><br>
                            <input type="checkbox" name="estado" value="1" checked>
                        	<label> Activo</label><br>
                
                            <button type="submit" class="btn btn-success" name="envio" value="1">Crear</button>
                        	<button type="reset" class="btn btn-warning" name="borrar">Borrar</button>
                        </form>
                        <?php
                            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                                $pDao = new ProdutoDAO();
                                $pDao->save(new Produto(recolle("nome"), recolle("prezo"), recolle("descricion") != "" ? recolle("descricion") : NULL, recolle("estado") != "1" ? "0" : "1", recolle("categoria")));
                                header("location: listarProdutos.php");
                            }
                		} else {
                		    echo "<p>Para poder crear un produto, primero debes crear unha categoría. Fai click <a href=crearCategoriaProdutos.php>aquí</a> para crear unha categoría</p>";
                		}
                
                    ?>
    			</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<ul class="list-group">
        				<li class="list-group-item activo"><a href="crearProdutos.php">Crear producto</a>
        			</ul>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'views/theme/bottom.php';
?>