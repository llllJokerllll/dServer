<?php
include_once 'top.php';
include_once 'menu.php';
?>
            <!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Listado de países</h1>
                        <?php
                            if(isset($_SESSION['loged_user'])) {
                                $cDAO = new CountryDAO();
                                $vPaises = $cDAO->getAll();
                                //Bucle para amosar resultados
                                if(count($vPaises) > 0) {
                                    echo '<table class="table table-striped table-bordered">
                                                  <tr>
                                                    <th scope="col">Código</th>
                                                    <th scope="col">Nome do país</th>
                                                    <th scope="col">Rexión</th>
                                                    <th scope="col">Superficie</th>
                                                    <th>Accións</th>
                                                  </tr>';
                                    foreach($vPaises as $r){
                                        echo "<tr>";
                                        echo "<td>".$r->getCode()."</td>";
                                        echo "<td>".$r->getName()."</td>";
                                        echo "<td>".$r->getRegion()."</td>";
                                        echo "<td>".$r->getSurfaceArea()." km<sup>2</sup></td>";
                                        echo "<td><a href='eliminarPais.php?id=" . $r->getCode() . "'>Eliminar</a> <a href='modificarPais.php?id=" . $r->getCode() . "'>Editar</a></td>";
                                        echo "</tr>";
                                    } //fin foreach
                                    echo "</table>";
                                }
                            } else {
                                header("location: index.php");
                            } 
                        ?>
                        </div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<?php
    include_once 'bottom.php';
?>