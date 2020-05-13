<?php
include_once 'views/theme/top.php';
include_once 'views/theme/menu.php';
include_once 'views/theme/privado.php';
?>
	        <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Listado de xogos</h1>
    				<table class="table table-striped table-bordered">
    					<tr>
                        	<th scope="col">#</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Plataforma</th>
                            <th scope="col">Descrición</th>
                            <th scope="col">Ano</th>
                            <th scope="col">Imagen</th>
                            <th scope="col">Online</th>
                            <th>Accións</th>
                        </tr>
                        <?php 
                            $xDao = new XogoDAO();
                            
                            foreach ($xDao->getAll() as $xogo) {
                                echo "<tr>";
                                echo "<td>".$xogo->getId()."</td>";
                                echo "<td>".$xogo->getNome()."</td>";
                                echo "<td>".$xogo->getPlataforma()."</td>";
                                echo "<td>".$xogo->getDescricion()."</td>";
                                echo "<td>".$xogo->getAno()."</td>";
                                echo "<td>". "<img src='uploads/" . $xogo->getImagen() . "' alt='" . $xogo->getImagen() . "' width='150px' height='150px'></td>";
                                echo "<td>".(!$xogo->getOnline() ? "<i style='color: red;' class='fas fa-times'></i>" : "<i style='color: green;' class='fas fa-check'></i>") . "</td>";
                                echo "<td><a href='eliminarXogos.php?id=".$xogo->getId()."' onclick='return confirm(\"¿Estás seguro?\")'>Eliminar</a> <a href='modificarXogos.php?id=".$xogo->getId()."'>Editar</a></td>";
                                echo "</tr>";
                            }
                        ?>
                	</table>
    			</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<ul class="list-group">
        				<li class="list-group-item"><a href="crearXogos.php">Crear xogo</a>
        			</ul>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'views/theme/bottom.php';
?>