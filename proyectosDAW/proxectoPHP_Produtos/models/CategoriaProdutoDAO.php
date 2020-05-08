<?php
class CategoriaProdutoDAO implements DAO
{

    public function getAll()
    {
        $categorias = [];
        $conexion = ConexionBD::obterConexion();

        try {

            $sql = "SELECT * FROM categoriaproduto ORDER BY id ASC";

            $stmt = $conexion->prepare($sql);
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_OBJ);

            foreach ($results as $r) {
                $res = new CategoriaProduto($r->nome, $r->descricion, $r->activado);
                $res->setId($r->id); 
                $categorias[] = $res;
            }
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo a listaxe de categorias. CategoriaProdutoDAO getAll " . $e->getMessage();
        }

        return $categorias;
    }

    public function get($id)
    {
        $categoria = null;
        $conexion = ConexionBD::obterConexion();

        try {

            $sql = "SELECT * FROM categoriaproduto WHERE id LIKE ? ";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $id);
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_OBJ);
            if ($stmt->rowCount() > 0) {
                $r = current($results);
                $categoria = new CategoriaProduto($r->nome, $r->descricion, $r->activado);
                $categoria->setId($r->id);
            }
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo a categoria. CategoriaProdutoDAO get " . $e->getMessage();
        }

        return $categoria;
    }

    public function save($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "SELECT id FROM categoriaproduto WHERE nome LIKE ? ";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getNome());
            $stmt->execute();

            if ($stmt->rowCount() == 0) {

                $sql = "INSERT INTO categoriaproduto (nome, descricion, activado) VALUES (?, ?, ?) ";

                $stmt = $conexion->prepare($sql);
                $stmt->bindValue(1, $object->getNome());
                $stmt->bindValue(2, $object->getDescricion() != NULL ? $object->getDescricion() : NULL);
                $stmt->bindValue(3, $object->getActivado());
                $stmt->execute();
            } else {
                echo "A categoría introducida xa existe";
            }
        } catch (PDOException $e) {
            echo "Houbo problemas gardando a categoria. CategoriaProdutoDAO save " . $e->getMessage();
            return false;
        }

        return true;
    }

    public function update($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "UPDATE categoriaproduto SET nome = ?, descricion = ?, activado = ? WHERE id LIKE ?";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getNome());
            $stmt->bindValue(2, $object->getDescricion() != NULL ? $object->getDescricion() : NULL);
            $stmt->bindValue(3, $object->getActivado());
            $stmt->bindValue(4, $object->getId());
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Houbo problemas actualizando a categoria. CategoriaProdutoDAO update " . $e->getMessage();
            return false;
        }

        return true;
    }

    public function delete($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "DELETE FROM categoriaproduto WHERE id LIKE ?";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getID());
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Houbo problemas borrando a categoria. CategoriaProdutoDAO delete " . $e->getMessage();
            return false;
        }
    }
    
    public function getProdutos($object){
        $conexion = ConexionBD::obterConexion();
        $resultado = 0;
        try{
            $sql = "SELECT count(*) as total FROM produto WHERE idCategoriaProduto LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object->getId());
            $stmt->execute();
            $resultado = $stmt->fetch(PDO::FETCH_OBJ);
            $resultado = $resultado->total;
        } catch(PDOException $e){
            echo "Houbo problemas collendo os produtos da categoria. CategoriaProdutoDAO getProdutos " . $e->getMessage();
            $resultado = 0;
        }
        return $resultado;
        
    }
}
?>