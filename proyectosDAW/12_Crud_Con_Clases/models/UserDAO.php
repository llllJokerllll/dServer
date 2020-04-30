<?php 
class UserDAO {
    
    public function comprobarDatosUsuario(&$user) {
        
        $conexion = ConexionBD::obterConexion();
        
        try {
            $sql = "SELECT username, nome FROM user WHERE username LIKE ? AND password LIKE ?";
            
            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $user->getUsername());
            $stmt->bindValue(2, $user->getPassword());
            $stmt->execute();
            $resulset = $stmt->fetchAll(PDO::FETCH_OBJ);
            if ($stmt->rowCount() > 0) {
                $userAux = current($resulset);
                $user->setNome($userAux->nome);
                $user->setPassword("");
                return true;
            } else {
                return false;
            }
        } catch (PDOException $e) {
            echo "Error comprobando Datos de Usuario. UserDAO " . $e->getMessage();
            return false;
        }
    }
}
?>