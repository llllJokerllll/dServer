<?php

class Produto
{

    private $id;
    private $nome;
    private $prezo;
    private $descricion;
    private $activado;
    private $idCategoriaProduto;

    public function __construct($nome = "", $prezo = 0, $descricion = "", $activado = false, $idCategoriaProduto = "")
    {
        $this->nome = $nome;
        $this->prezo = $prezo;
        $this->descricion = $descricion;
        $this->activado = $activado;
        $this->idCategoriaProduto = $idCategoriaProduto;
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function getPrezo()
    {
        return $this->prezo;
    }

    public function getDescricion()
    {
        return $this->descricion;
    }

    public function getActivado()
    {
        return $this->activado;
    }

    public function getIdCategoriaProduto()
    {
        return $this->idCategoriaProduto;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function setPrezo($prezo)
    {
        $this->prezo = $prezo;
    }

    public function setDescricion($descricion)
    {
        $this->descricion = $descricion;
    }

    public function setActivado($activado)
    {
        $this->activado = $activado;
    }

    public function setIdCategoriaProduto($idCategoriaProduto)
    {
        $this->idCategoriaProduto = $idCategoriaProduto;
    }

}
?>