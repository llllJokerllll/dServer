<?php
    include_once 'top.php';
    include_once 'menu.php';
?>
        
        <?php
                
            if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
                require_once "config.php";
                
                $sql = "DELETE FROM country WHERE code LIKE :code";
                $query = $conexion -> prepare($sql);                
                $query->bindParam(":code", $_GET["id"]);                
                
                try{
                    $query->execute();
                    echo "País eliminado con éxito";                    
                } catch (PDOException $e){
                    die ("Problemas eliminando o país ". $e->getMessage());
                }
                
                
            }
        ?>
<?php
    include_once 'bottom.php';
?>