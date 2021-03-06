<?php

class CategoriaProduto
{

    private $id;

    private $nome;

    private $descricion;

    private $activado;

    public function __construct($nome = "", $descricion = "", $activado = 0)
    {
        $this->nome = $nome;
        $this->descricion = $descricion;
        $this->activado = $activado;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function getDescricion()
    {
        return $this->descricion;
    }

    public function getActivado()
    {
        return $this->activado;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function setDescricion($descricion)
    {
        $this->descricion = $descricion;
    }

    public function setActivado($activado)
    {
        $this->activado = $activado;
    }

    public function getProdutos($object){
        $conexion = ConexionBD::conectar();
        $resultado = 0;
        try{
            $sql = "SELECT count(*) as total
                        FROM producto
                    WHERE categoria LIKE ?";
            
            $stmt = $conexion -> prepare($sql);
            $stmt->bindValue(1, $object->getId());
            $stmt -> execute();
            $resultado = $stmt->fetch(PDO::FETCH_OBJ);
            $resultado = $resultado->total;
        } catch(PDOException $e){
            echo "Problemas obteniendo categorias. CategoriaDAO getProductos " . $e->getMessage();
            $resultado = 0;
        }
        return $resultado;
        
    }
}
?>