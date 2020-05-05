<?php
class ValoracionTroncos {
    
    private $id;
    private $madeira;
    private $cantidade;
    private $altura;
    private $radio;
    private $desconto;
    private $volume;
    private $idLote;            
    
    public function __construct($madeira = "", $cantidade = 0, $altura = 0, $radio = 0, $desconto = 0, $volume = 0, $idLote = null) { 
        $this->id = 0;
        $this->madeira = $madeira;
        $this->cantidade = $cantidade;
        $this->altura = $altura;
        $this->radio = $radio;
        $this->desconto = $desconto;
        $this->volume = $volume;
        $this->idLote = $idLote;
    }

    public function getId(){
        return $this->id;
    }

    public function setId($id){
        $this->id = $id;
    }

    public function getMadeira(){
        return $this->madeira;
    }

    public function setMadeira($madeira){
        $this->madeira = $madeira;
    }

    public function getCantidade(){
        return $this->cantidade;
    }

    public function setCantidade($cantidade){
        $this->cantidade = $cantidade;
    }

    public function getAltura(){
        return $this->altura;
    }

    public function setAltura($altura){
        $this->altura = $altura;
    }

    public function getRadio(){
        return $this->radio;
    }

    public function setRadio($radio){
        $this->radio = $radio;
    }

    public function getDesconto(){
        return $this->desconto;
    }

    public function setDesconto($desconto){
        $this->desconto = $desconto;
    }

    public function getVolume(){
        return $this->volume;
    }

    public function setVolume($volume){
        $this->volume = $volume;
    }

    public function getIdLote(){
        return $this->idLote;
    }

    public function setIdLote($idLote){
        $this->idLote = $idLote;
    }        

    public static function calcularVolume($cantidade, $radio, $altura, $desconto) {
        $res = (($cantidade * $radio) * ($cantidade * $altura)) * ((100 - $desconto) / 100);
        return $res;
    }
}
?>