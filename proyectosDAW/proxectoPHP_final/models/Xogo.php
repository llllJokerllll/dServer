<?php

class Xogo
{

    private $id;
    private $nome;
    private $plataforma;
    private $descricion;
    private $ano;
    private $imagen;
    private $online;

    public function __construct($nome = "", $plataforma = "", $descricion = "", $ano = 0, $imagen = "", $online = false)
    {
        $this->nome = $nome;
        $this->plataforma = $plataforma;
        $this->descricion = $descricion;
        $this->ano = $ano;
        $this->imagen = $imagen;
        $this->online = $online;
        
    }
    public function getId()
    {
        return $this->id;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function getPlataforma()
    {
        return $this->plataforma;
    }

    public function getDescricion()
    {
        return $this->descricion;
    }

    public function getAno()
    {
        return $this->ano;
    }
    
    public function getImagen()
    {
        return $this->imagen;
    }
    
    public function getOnline()
    {
        return $this->online;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function setPlataforma($plataforma)
    {
        $this->plataforma = $plataforma;
    }

    public function setDescricion($descricion)
    {
        $this->descricion = $descricion;
    }

    public function setAno($ano)
    {
        $this->ano = $ano;
    }
    
    public function setImgen($imagen)
    {
        $this->imagen = $imagen;
    }
    
    public function setOnline($online)
    {
        $this->online = $online;
    }

}
?>