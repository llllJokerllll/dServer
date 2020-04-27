<?php
include_once 'top.php';
include_once 'menu.php';
?>

        <?php
            if(isset($_SESSION['loged_user'])) {
                require_once "config/config.php";
                $sql = "SELECT code, name, region, surfaceArea FROM country WHERE continent LIKE :continente";
                $query = $conexion -> prepare($sql);
                $cont = "Asia";
                $query->bindParam(":continente", $cont);            
                $query -> execute();
                $results = $query -> fetchAll(PDO::FETCH_OBJ);
                //Bucle para amosar resultados
                if($query->rowCount() > 0) {
                    echo '<table class="table table-striped table-bordered">
                                  <tr>
                                    <th scope="col">Código</th>
                                    <th scope="col">Nome do país</th>
                                    <th scope="col">Rexión</th>
                                    <th scope="col">Superficie</th>
                                    <th>Accións</th>
                                  </tr>';
                    foreach($results as $r){
                        echo "<tr>";
                        echo "<td>".$r->code."</td>";
                        echo "<td>".$r->name."</td>";
                        echo "<td>".$r->region."</td>";
                        echo "<td>".$r->surfaceArea." km<sup>2</sup></td>";
                        echo "<td><a href='eliminarPais.php?id=".$r->code."'>Eliminar</a> <a href='modificarPais.php?id=".$r->code."'>Editar</a></td>";
                        echo "</tr>";
                    } //fin foreach
                    echo "</table>";
                }
            } else {
                header("location: index.php");
            } 
        ?>
<?php
    include_once 'bottom.php';
?>