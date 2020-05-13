<?php
    include_once 'top.php';
    include_once 'menu.php';
?>

        <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
            <label>Usuario </label><input type="text" name="user"><br>
            <label>Contraseña </label><input type="password" name="pass"><br>
            <input type="submit">
        </form>

        <?php
            
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $uDAO = new UserDAO();
                $usuario = new User($_POST["user"], $_POST["pass"]);
                if ($uDAO->comprobarDatosUsuario($usuario)) {
                    session_regenerate_id();                       
                    $_SESSION['loged_user'] = $usuario->getNome();
                    header("location: index.php");
                } else {
                    echo "Nome de usuario ou contrasinal inválidas";
                }
            }
        ?>
<?php
    include_once 'bottom.php';
?>