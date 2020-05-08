<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';

    if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
        $cDao = new CategoriaProdutoDAO();
        $categoria = $cDao->get($_GET["id"]);
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Modificar categoría de produto # <?=$categoria->getId()?></h1>
    				<form class="form-group" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
                        <label for="nome">Nome </label>
                        <input class="form-control" type="text" name="nome" value="<?=$categoria->getNome()?>" minlength="1" maxlength="50" required><br>
                        <label for="descricion">Descrición </label>
                        <textarea class="form-control" type="text" maxlength="200" name="descricion"><?=$categoria->getDescricion()?></textarea><br>
                        <input type="checkbox" name="estado" value="1" <?=$categoria->getActivado() == 1 ? " checked" : ""?>>
                        <label> Activo</label><br>
            
            			<input type="hidden" name="id" value="<?=$categoria->getId()?>">
                        <button type="submit" class="btn btn-success" name="envio" value="1">Modificar</button>
                        <button type="reset" class="btn btn-warning">Borrar</button>
                    </form>
                    <?php
    }
                        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                            $categoriaDao = new CategoriaProdutoDAO();
                            $res = new CategoriaProduto(recolle("nome"), recolle("descricion") != "" ? recolle("descricion") : NULL, recolle("estado") != "1" ? "0" : "1");
                            $res->setId(recolle("id"));
                            $categoriaDao->update($res);
                            header("location: listarCategoriaProdutos.php");
                        }
                    ?>
    			</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<ul class="list-group">
        				<li class="list-group-item"><a href="crearCategoriaProdutos.php">Nova categoría de produtos</a>
        			</ul>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'views/theme/bottom.php';
?>