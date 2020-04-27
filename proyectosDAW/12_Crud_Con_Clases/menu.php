
        <?php            
            if(isset($_SESSION['loged_user'])) {
                
                echo "<a href='crearPais.php'>Dar de alta país</a> | ";
                echo "<a href='listarPaises.php'>Listar Paises</a> | ";                
                echo "<a href='salir.php'>Salir</a><br><br>";
                echo "<p>Usuario: ".$_SESSION['loged_user']."  Fecha: ".date('Y/m/d')." ".date('h:i:s') . "</p>";
                
            } else {
                header("location: login.php");
            }
        ?>
