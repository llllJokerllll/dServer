<?php
    include_once 'top.php';
?>

        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
            <label>Usuario </label><input type="text" name="user"><br>
            <label>Contraseña </label><input type="password" name="pass"><br>
            <input type="submit">
        </form>

        <?php
                
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                require_once "config.php";
                $sql = "SELECT nome FROM user WHERE username LIKE :user AND password LIKE :pass";
                $query = $conexion -> prepare($sql);                
                $query->bindParam(":user", $_POST["user"]);
                $query->bindParam(":pass", $_POST["pass"]);
                $query -> execute();                
                $results = $query -> fetchAll(PDO::FETCH_OBJ);                                               
                //Atopamos                               
                if($query->rowCount() > 0) {                    
                    $r = current($results);                    
                    session_regenerate_id();                       
                    $_SESSION['loged_user'] = $r->nome;
                    header("location: index.php");
                } else {
                    echo "Nome de usuario ou contrasinal inválidas";
                }
            }
        ?>
<?php
    include_once 'bottom.php';
?>