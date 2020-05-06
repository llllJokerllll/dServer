<?php 
class UserDAO {
    
    public function comprobarDatosUsuario(&$user) {
        
        $encuentros = [];
        $fr = fopen("users.txt", "r");
        
        while(($linea = fgets($fr)) != null) {
            array_push($encuentros, explode("###", $linea));
        }
        fclose($fr);
        if ($user->getUsername() == $encuentros[0][0] && $user->getPassword() == $encuentros[0][1]) {
            return true;
        } else {
            return false;
        }
    }
}
?>