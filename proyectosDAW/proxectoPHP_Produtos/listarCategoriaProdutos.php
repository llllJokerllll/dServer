<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Listado de categoría de produtos</h1>
  					<table class="table table-striped table-bordered">
  						<tr>
                        	<th scope="col">#</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Descrición</th>
                            <th scope="col">Activado</th>
                            <th>Accións</th>
                        </tr>
                        <?php
                        $categoriaDao= new CategoriaProdutoDAO();
                        foreach ($categoriaDao->getAll() as $categoria) {
                            $produtos = $categoriaDao->getProdutos($categoria);
                            echo "<tr>";
                            echo "<td>".$categoria->getId()."</td>";
                            echo "<td>".$categoria->getNome()."</td>";
                            echo "<td>".$categoria->getDescricion()."</td>";
                            echo "<td>".(!$categoria->getActivado() ? "<i style='color: red;' class='fas fa-times'></i>" : "<i style='color: green;' class='fas fa-check'></i>") . "</td>";
                            echo "<td><a href='" . ($produtos == 0 ? "eliminarCategoriaProdutos.php?id=" . $categoria->getId() . "' onclick='return confirm(\"¿Estás seguro?\")'" : "#' class='desactivado' onclick='alert(\"Primeiro debes borrar os produtos asociados a categoría elexida\")'") . ">Eliminar</a> <a href='modificarCategoriaProdutos.php?id=" . $categoria->getId() . "'>Editar</a></td>";
                            echo "</tr>";
                        }
                        ?>
                    </table>
                        

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