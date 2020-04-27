<?php 
class CountryDAO implements DAO {
    
    public function getAll(){
            
        $vector = [];
        global $conexion;
        
        try {
            $sql = "SELECT Code, Name, Continent, Region, surfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2 FROM country WHERE continent LIKE ? ORDER By Code ASC";
            
            $stmt = $conexion -> prepare($sql);
            $cont = "Asia";
            $stmt->bindValue(1, $cont);
            $stmt -> execute();
            $results = $stmt -> fetchAll(PDO::FETCH_OBJ);
            //Bucle para gardar resultados
            foreach($results as $r){
                $vector[] = new Country($r->Code, $r->Name, $r->Continent, $r->Region, $r->surfaceArea, $r->IndepYear, $r->Population, $r->LifeExpectancy, $r->GNP, $r->GNPOld, $r->LocalName, $r->GovernmentForm, $r->HeadOfState, $r->Capital, $r->Code2);
            } // fin foreach
        } catch (PDOException $e) {
            echo "Problemas obtendo listaxe de países. CountryDAO getAll " - $e->getMessage();
        }
            
            
            return $vector;
    }

    public function get($id) {
        
        $pais = null;
        global $conexion;
        
        try {
            $sql = "SELECT Code, Name, Continent, Region, surfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2 FROM country WHERE Code LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $id);
            $stmt -> execute();
            $results = $stmt -> fetchAll(PDO::FETCH_OBJ);
            // Resultado
            if ($stmt -> rowCount() > 0) {
                $r = current($results);
                $pais = new Country($r->Code, $r->Name, $r->Continent, $r->Region, $r->surfaceArea, $r->IndepYear, $r->Population, $r->LifeExpectancy, $r->GNP, $r->GNPOld, $r->LocalName, $r->GovernmentForm, $r->HeadOfState, $r->Capital, $r->Code2);
            } // fin foreach
        } catch (PDOException $e) {
            echo "Problemas obtendo un país. CountryDAO get " - $e->getMessage();
        }
        
        return $pais;
    }

    public function save($object) {
        
        global $conexion;
        
        try {
            $sql = "INSERT INTO country (Code, Name, Continent, Region, surfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object->getCode());
            $stmt->bindValue(2, $object->getName());
            $stmt->bindValue(3, $object->getContinent());
            $stmt->bindValue(4, $object->getRegion());
            $stmt->bindValue(5, $object->getSurfaceArea());
            $stmt->bindValue(6, $object->getIndepYear() != "" ? $object->getIndepYear() : NULL);
            $stmt->bindValue(7, $object->getPopulation());
            $stmt->bindValue(8, $object->getLifeExpectancy() != "" ? $object->getLifeExpectancy() : NULL);
            $stmt->bindValue(9, $object->getGNP() != "" ? $object->getGNP() : NULL);
            $stmt->bindValue(10, $object->getGNPOld() != "" ? $object->getGNPOld() : NULL);
            $stmt->bindValue(11, $object->getLocalName());
            $stmt->bindValue(12, $object->getGovernmentForm());
            $stmt->bindValue(13, $object->getHeadOfState() != "" ? $object->getHeadOfState() : NULL);
            $stmt->bindValue(14, $object->getCapital() != "" ? $object->getCapital() : NULL);
            $stmt->bindValue(15, $object->getCode2());
            $stmt -> execute();
            

        } catch (PDOException $e) {
            echo "Problemas gardando un país. CountryDAO save " - $e->getMessage();
            return false;
        }
        
        return true;
    }

    public function update($object) {
        
        global $conexion;
        
        try {
            $sql = "UPDATE country Code = ?, Name = ?, Continent = ?, Region = ?, surfaceArea = ?, IndepYear = ?, Population = ?, LifeExpectancy = ?, GNP = ?, GNPOld = ?, LocalName = ?, GovernmentForm = ?, HeadOfState = ?, Capital = ?, Code2 = ? WHERE code LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object->getCode());
            $stmt->bindValue(2, $object->getName());
            $stmt->bindValue(3, $object->getContinent());
            $stmt->bindValue(4, $object->getRegion());
            $stmt->bindValue(5, $object->getSurfaceArea());
            $stmt->bindValue(6, $object->getIndepYear() != "" ? $object->getIndepYear() : NULL);
            $stmt->bindValue(7, $object->getPopulation());
            $stmt->bindValue(8, $object->getLifeExpectancy() != "" ? $object->getLifeExpectancy() : NULL);
            $stmt->bindValue(9, $object->getGNP() != "" ? $object->getGNP() : NULL);
            $stmt->bindValue(10, $object->getGNPOld() != "" ? $object->getGNPOld() : NULL);
            $stmt->bindValue(11, $object->getLocalName());
            $stmt->bindValue(12, $object->getGovernmentForm());
            $stmt->bindValue(13, $object->getHeadOfState() != "" ? $object->getHeadOfState() : NULL);
            $stmt->bindValue(14, $object->getCapital() != "" ? $object->getCapital() : NULL);
            $stmt->bindValue(15, $object->getCode2());
            $stmt->bindValue(16, $object->getCode());
            $stmt -> execute();
            
            
        } catch (PDOException $e) {
            echo "Problemas actualizando un país. CountryDAO update " - $e->getMessage();
            return false;
        }
        
        return true;
    }

    public function delete($object) {
        
        global $conexion;
        
        try {
            $sql = "DELETE FROM country WHERE code LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object->getCode());
            $stmt -> execute();
            
            
        } catch (PDOException $e) {
            echo "Problemas borrando un país. CountryDAO delete " - $e->getMessage();
            return false;
        }
        
        return true;
    }

    
}
?>