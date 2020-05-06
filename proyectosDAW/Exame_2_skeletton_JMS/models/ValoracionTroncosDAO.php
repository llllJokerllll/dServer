<?php
class ValoracionTroncosDAO {
    
    public function getAll(){
        $vector = [];
        $conexion = ConexionBD::conectar();
        
        try {
            $sql = "SELECT madeira, cantidade, altura, radio, desconto, volume, idLote FROM valoraciontroncos";
            
            $stmt = $conexion -> prepare($sql);
            $stmt -> execute();
            $results = $stmt -> fetchAll(PDO::FETCH_OBJ);

            foreach($results as $r){
                $vector[] = new ValoracionTroncos($r->madeira, $r->cantidade, $r->altura, $r->radio, $r->desconto, $r->volume, $r->idLote);
            } 
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo as Valoracións. ValoracionTroncosDAO getAll " - $e->getMessage();
        }
        
        
        return $vector;
    }
    
    public function get($id) {
        
        $valoracion = null;
        $conexion = ConexionBD::conectar();
        
        try {
            $sql = "SELECT madeira, cantidade, altura, radio, desconto, volume, idLote FROM valoraciontroncos WHERE id LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt -> bindValue(1, $id);
            $stmt -> execute();
            $results = $stmt -> fetchAll(PDO::FETCH_OBJ);

            if ($stmt -> rowCount() > 0) {
                $r = current($results);
                $valoracion = new ValoracionTroncos($r->madeira, $r->cantidade, $r->altura, $r->radio, $r->desconto, $r->volume, $r->idLote);
            }
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo a Valoración. ValoracionTroncosDAO get " - $e->getMessage();
        }
        
        return $valoracion;
    }
    
    public function save($object) {
        
        $conexion = ConexionBD::conectar();
        
        try {
            $sql = "INSERT INTO valoraciontroncos (madeira, cantidade, altura, radio, desconto, volume, idLote) VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object -> getMadeira());
            $stmt->bindValue(2, $object -> getCantidade());
            $stmt->bindValue(3, $object -> getAltura());
            $stmt->bindValue(4, $object -> getRadio());
            $stmt->bindValue(5, $object -> getDesconto());
            $stmt->bindValue(6, $object -> getVolume());
            $stmt->bindValue(7, $object -> getIdLote() != "" ? $object -> getIdLote() : NULL);
            $stmt -> execute();
            
            
        } catch (PDOException $e) {
            echo "Houbo problemas gardando a Valoración. ValoracionTroncosDAO save " - $e->getMessage();
            return false;
        }
        
        return true;
    }
    
    public function delete($object) {
        
        $conexion = ConexionBD::conectar();
        
        try {
            $sql = "DELETE FROM valoraciontroncos WHERE id LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object -> getId());
            $stmt -> execute();
            
            
        } catch (PDOException $e) {
            echo "Houbo problemas borrando a Valoración. ValoracionTroncosDAO delete " - $e->getMessage();
            return false;
        }
        
        return true;
    }
    
    public function update($object) {
        
        $conexion = ConexionBD::conectar();
        
        try {
            $sql = "UPDATE valoraciontroncos SET madeira = ?, cantidade = ?, altura = ?, radio = ?, desconto = ?, volume = ?, idLote = ? WHERE id LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object -> getMadeira());
            $stmt->bindValue(2, $object -> getCantidade());
            $stmt->bindValue(3, $object -> getAltura());
            $stmt->bindValue(4, $object -> getRadio());
            $stmt->bindValue(5, $object -> getDesconto());
            $stmt->bindValue(6, $object -> getVolume());
            $stmt->bindValue(7, $object -> getIdLote() != "" ? $object -> getIdLote() : NULL);
            $stmt->bindValue(8, $object -> getId());
            $stmt -> execute();
            
            
        } catch (PDOException $e) {
            echo "Houbo problemas actualizando a Valoración. ValoracionTroncosDAO update " - $e->getMessage();
            return false;
        }
        
        return true;
    }

}
?>