<?php 
class UserDAO {
    
    public function comprobarDatosUsuario(&$user) {
        
        try {
            $sql = "SELECT username, nome FROM user WHERE username LIKE ? AND password LIKE ?";
            
            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $user->getUsername());
            $stmt->bindValue(2, $user->getPassword());
            $stmt->execute();
            
            $resultset = $stmt->fetchAll(PDO::FETCH_OBJ);
            if ($stmt->rowCount() > 0) {
                $userAux = current($resultset);
                $user->setNome($userAux->getNome());
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