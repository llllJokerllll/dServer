<?php
class LoteTroncosDAO {

    public function save(&$object) {

        $conexion = ConexionBD::conectar();
        
        try{
            $sql = "INSERT INTO lotetroncos (nome, fecha)
                        VALUES (?, ?)";            
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object->getNome());            
            $stmt->bindValue(2, $object->getFecha());                       
            $stmt-> execute();
            $object->setId($conexion->lastInsertId());
        } catch (PDOException $e){
            echo ("Problemas gardando o lote ". $e->getMessage());
            return false;
        }
        
        return true;
    }
}
?>