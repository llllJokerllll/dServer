<?php
class LoteTroncos {
    
    private $id;
    private $nome;    
    private $fecha;    
    
    public function __construct($nome = "", $fecha = "") { 
        $this->nome = $nome;        
        $this->fecha = $fecha;        
    }

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }

    public function getNome(){
        return $this->nome;
    }

    public function setNome($nome){
        $this->nome = $nome;
    }

    public function getFecha(){
        return $this->fecha;
    }

    public function setFecha($fecha){
        $this->fecha = $fecha;
    }

}
?>