<?php 
class Cadrado extends Figura {
    private $lado;
    
    public function __construct($nome, $lado) {
        // con parent::__construct invocamos el super del padre
        parent::__construct($nome);
        $this->lado = $lado;
        
    }
    
    public function calcularArea() {
        return $this->lado * $this->lado;
    }
    
    public static function dimeAlgo() {
        return "Eres la ostia!!";
    }
}
?>