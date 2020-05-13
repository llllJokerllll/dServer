<?php

class XogoDAO implements DAO
{

    public function getAll()
    {
        $xogos = [];
        $conexion = ConexionBD::obterConexion();

        try {

            $sql = "SELECT * FROM juegos ORDER BY id ASC";

            $stmt = $conexion->prepare($sql);
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_OBJ);

            foreach ($results as $r) {
                $res = new Xogo($r->nome, $r->plataforma, $r->descricion, $r->ano, $r->imagen, $r->online);
                $res->setId($r->id);
                $xogos[] = $res;
            }
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo a listaxe de xogos. XogoDAO getAll " . $e->getMessage();
        }

        return $xogos;
    }

    public function get($id)
    {
        $xogo = null;
        $conexion = ConexionBD::obterConexion();

        try {

            $sql = "SELECT * FROM juegos WHERE id LIKE ? ";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $id);
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_OBJ);
            if ($stmt->rowCount() > 0) {
                $r = current($results);
                $xogo = new Xogo($r->nome, $r->plataforma, $r->descricion, $r->ano, $r->imagen, $r->online);
                $xogo->setId($r->id);
            }
        } catch (PDOException $e) {
            echo "Houbo problemas obtendo o xogo. XogoDAO get " . $e->getMessage();
        }

        return $xogo;
    }

    public function save($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "SELECT id FROM juegos WHERE nome LIKE ? ";
            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getNome());
            $stmt->execute();
            if ($stmt->rowCount() == 0) {
                $sql = "INSERT INTO juegos (nome, plataforma, descricion, ano, imagen, online) VALUES (?, ?, ?, ?, ?, ?) ";

                $stmt = $conexion->prepare($sql);
                $stmt->bindValue(1, $object->getNome());
                $stmt->bindValue(2, $object->getPlataforma());
                $stmt->bindValue(3, $object->getDescricion() != NULL ? $object->getDescricion() : NULL);
                $stmt->bindValue(4, $object->getAno());
                $stmt->bindValue(5, $object->getImagen() != NULL ? $object->getImagen() : NULL);
                $stmt->bindValue(6, $object->getOnline());

                $stmt->execute();
            } else {
                echo "O xogo introducido xa existe";
            }
        } catch (PDOException $e) {
            echo "Houbo problemas gardando o xogo. XogoDAO save " . $e->getMessage();
            return false;
        }

        return true;
    }

    public function update($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "UPDATE juegos SET nome = ?, plataforma = ?, descricion = ?, ano = ?, imagen = ?, online = ? WHERE id LIKE ?";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getNome());
            $stmt->bindValue(2, $object->getPlataforma());
            $stmt->bindValue(3, $object->getDescricion() != NULL ? $object->getDescricion() : NULL);
            $stmt->bindValue(4, $object->getAno());
            $stmt->bindValue(5, $object->getImagen() != NULL ? $object->getImagen() : NULL);
            $stmt->bindValue(6, $object->getOnline());
            $stmt->bindValue(7, $object->getId());
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Houbo problemas actualizando o xogo. XogoDAO update" . $e->getMessage();
            return false;
        }

        return true;
    }

    public function delete($object)
    {
        $conexion = ConexionBD::obterConexion();

        try {
            $sql = "DELETE FROM juegos WHERE id LIKE ?";

            $stmt = $conexion->prepare($sql);
            $stmt->bindValue(1, $object->getId());
            $stmt->execute();
        } catch (PDOException $e) {
            echo "Houbo problemas eliminando o xogo. XogoDAO delete " . $e->getMessage();
            return false;
        }
    }
}
?>