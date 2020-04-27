<?php 

    define("SERVIDOR", "localhost");
    define("USER", "usuarioProbas");
    define("PASS", "Pw159159*");
    define("BD", "probas");
    define("PORT", "3306");
    
    try {
        //"mysql:host=localhost;dbname=probas;port=3306"
        $conexion = new PDO("mysql:host=" . SERVIDOR . ";dbname=" . BD . ";port=" . PORT, USER, PASS, [PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES 'utf8'"]);
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        echo "Erro na conexión: " . $e->getMessage();
        exit();
        // die
    }
?>