<?php

class ProdutoDAO implements DAO
{

    public function getAll()
    {
        $produtos = [];
        $conexion = ConexionBD::obterConexion();

        try {

            $sql = "SELECT * FROM produto ORDER BY id ASC";

            $stmt = $conexion->prepare($sql);
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_OBJ);

            foreach ($results as $r) {
                $res = new Produto($r->nome, $r->prezo, $r->descricion, $r->activado, $r->idCategoriaProduto);
                $res->setId($r->id);
                $produtos[] = $res;
            }
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo a listaxe de produtos. ProdutoDAO getAll " . $e->getMessage();
        }

        return $produtos;
    }

    public function get($id)
    {
        $produto = null;
        $conexion = ConexionBD::obterConexion();

        try {

            $sql = "SELECT * FROM produto WHERE id LIKE ? ";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $id);
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_OBJ);
            if ($stmt->rowCount() > 0) {
                $r = current($results);
                $produto = new Produto($r->nome, $r->prezo, $r->descricion, $r->activado, $r->idCategoriaProduto);
                $produto->setId($r->id);
            }
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo o produto. ProdutoDAO get " . $e->getMessage();
        }

        return $produto;
    }

    public function save($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "SELECT id FROM produto WHERE nome LIKE ? ";
            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getNome());
            $stmt->execute();
            if ($stmt->rowCount() == 0) {
                $sql = "INSERT INTO produto (nome, prezo, descricion, activado, idCategoriaProduto) VALUES (?, ?, ?, ?, ?) ";

                $stmt = $conexion->prepare($sql);
                $stmt->bindValue(1, $object->getNome());
                $stmt->bindValue(2, $object->getPrezo());
                $stmt->bindValue(3, $object->getDescricion() != NULL ? $object->getDescricion() : NULL);
                $stmt->bindValue(4, $object->getActivado());
                $stmt->bindValue(5, $object->getIdCategoriaProduto());

                $stmt->execute();
            } else {
                echo "O produto introducido xa existe";
            }
        } catch (PDOException $e) {
            echo "Houbo problemas gardando o produto. ProdutoDAO save " . $e->getMessage();
            return false;
        }

        return true;
    }

    public function update($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "UPDATE produto SET nome = ?, prezo = ?, descricion = ?, activado = ?, idCategoriaProduto = ? WHERE id LIKE ?";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getNome());
            $stmt->bindValue(2, $object->getPrezo());
            $stmt->bindValue(3, $object->getDescricion() != NULL ? $object->getDescricion() : NULL);
            $stmt->bindValue(4, $object->getActivado());
            $stmt->bindValue(5, $object->getIdCategoriaProduto());
            $stmt->bindValue(6, $object->getId());
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Houbo problemas actualizando o produto. ProdutoDAO update" . $e->getMessage();
            return false;
        }

        return true;
    }

    public function delete($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "DELETE FROM produto WHERE id LIKE ?";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getId());
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Houbo problemas eliminando o produto. ProdutoDAO delete " . $e->getMessage();
            return false;
        }
    }
}
?>