<?php 
class UserDAO {
    
    public function comprobarDatosUsuario(&$user) {
        
        $conexion = ConexionBD::obterConexion();
        try {
            $sql = "SELECT username, nomeCompleto FROM usuario WHERE username LIKE ? AND password LIKE ?";
            
            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $user->getUsername());
            $stmt->bindValue(2, $user->getPassword());
            $stmt->execute();
            
            $resultset = $stmt->fetchAll(PDO::FETCH_OBJ);
            if ($stmt->rowCount() > 0) {
                $userAux = current($resultset);
                $user->setNomeCompleto($userAux->nomeCompleto);
                $user->setPassword("");
                return true;
            } else {
                return false;
            }
        } catch (PDOException $e) {
            echo "Error comprobando Datos de Usuario. UserDAO " . $e->getMessage();
        }
    }
}
?>