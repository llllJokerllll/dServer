<?php
class ConexionBD {
    public static function obterConexion() {
        $conexion = null;
        try{
            $conexion = new PDO("mysql:host=".SERVER_BD."; dbname=".BD,USER_BD,PASSWORD_BD,  [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"]);
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }catch(PDOException $e){
            echo "Erro na conexión: " . $e->getMessage();
            exit();
        }
        return $conexion;
    }
}
?>