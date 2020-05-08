<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';

    if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
        $pDao = new ProdutoDAO();
        $produto = $pDao->get($_GET["id"]);
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Modificar produto # <?=$produto->getId()?></h1>
    				<form class="form-group" action="<?= htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
                    	<label for="nome">Nome </label>
                        <input class="form-control" type="text" name="nome" minlength="1" maxlength="50" value="<?=$produto->getNome()?>" required><br>
                        <label for="prezo">Prezo </label>
                        <input  class="form-control" type="number" name="prezo" min="0" step="0.01" value="<?=$produto->getPrezo()?>" required><br>
                        <label>Categoría de produto</label>
                        <select class="form-control" name="categoria" required>
                            <?php 
                                $cdao = new CategoriaProdutoDAO();
                                $categorias = $cdao->getAll();
                                foreach ($categorias as $categoria) {
                                    echo "<option value='" . $categoria->getId() . "'" . ($categoria->getId() == $produto->getIdCategoriaProduto() ? "selected" : "") . ">" . $categoria->getNome() . "</option>";
                                }
                            ?>
                            
                        </select><br>
                        <label for="descricion">Descrición </label>
                        <textarea class="form-control" type="text" name="descricion" maxlength="200"><?=$produto->getDescricion()?></textarea><br>
                        <input type="checkbox" name="estado" value="1" <?=$produto->getActivado() == 1 ? " checked" : ""?>>
                        <label> Activo</label><br>
                
                		<input type="hidden" name="id" value="<?=$produto->getId()?>">
                        <button type="submit" class="btn btn-success" name="envio" value="1">Modificar</button>
                        <button type="reset" class="btn btn-warning">Borrar</button>
                    </form>
                    <?php
    }
                            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                                $pDao = new ProdutoDAO();
                                $res = new Produto(recolle("nome"), recolle("prezo"), recolle("descricion") != "" ? recolle("descricion") : NULL, recolle("estado") != "1" ? "0" : "1", recolle("categoria"));
                                $res->setId(recolle("id"));
                                $pDao->update($res);
                                header("location: listarProdutos.php");
                            }
                        ?>
    			</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<ul class="list-group">
        				<li class="list-group-item"><a href="crearProdutos.php">Crear producto</a>
        			</ul>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'views/theme/bottom.php';
?>