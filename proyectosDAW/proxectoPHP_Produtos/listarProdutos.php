<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Listado de produtos</h1>
    				<table class="table table-striped table-bordered">
    					<tr>
                        	<th scope="col">#</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Prezo</th>
                            <th scope="col">Descrición</th>
                            <th scope="col">Categoría</th>
                            <th scope="col">Activado</th>
                            <th>Accións</th>
                        </tr>
                        <?php 
                            $cDao= new CategoriaProdutoDAO();
                            $pDao= new ProdutoDAO();
                            
                            foreach ($pDao->getAll() as $produto) {
                                echo "<tr>";
                                echo "<td>".$produto->getId()."</td>";
                                echo "<td>".$produto->getNome()."</td>";
                                echo "<td>".round($produto->getPrezo(),2)." $</td>";
                                echo "<td>".$produto->getDescricion()."</td>";
                                $categoria = $cDao->get($produto->getIdCategoriaProduto());
                                echo "<td>".$categoria->getNome()."</td>";
                                echo "<td>".(!$produto->getActivado() ? "<i style='color: red;' class='fas fa-check'></i>" : "<i style='color: green;' class='fas fa-check'></i>") . "</td>";
                                echo "<td><a href='eliminarProdutos.php?id=".$produto->getId()."' onclick='return confirm(\"¿Estás seguro?\")'>Eliminar</a> <a href='modificarProdutos.php?id=".$produto->getId()."'>Editar</a></td>";
                                echo "</tr>";
                            }
                        ?>
                	</table>
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