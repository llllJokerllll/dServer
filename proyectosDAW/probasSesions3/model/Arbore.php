<?php
    class Arbore {
        private $nomeComun;
        private $nomeLatino;
        private $alturaMaxima;
    
        public function __construct($nomeComun = "", $nomeLatino = "", $alturaMaxima = "0") {
            $this->nomeComun = $nomeComun;
            $this->nomeLatino = $nomeLatino;
            $this->alturaMaxima = $alturaMaxima;
        }
        
        public function getNomeComun() {
            return $this->nomeComun;
        }
        
        public function getNomeLatino() {
            return $this->nomeLatino;
        }
        
        public function getAlturaMaxima() {
            return $this->alturaMaxima;
        }
        
        public function setNomeComun($nomeComun) {
            $this->nomeComun = $nomeComun;
        }
        
        public function setNomeLatino($nomeLatino) {
            $this->nomeLatino = $nomeLatino;
        }
        
        public function setAlturaMaxima($alturaMaxima) {
            $this->alturaMaxima = $alturaMaxima;
        }
        
        public static function obterInfo() {
            return "Clase árbore";
        }
        
        public function __toString() {
            return Arbore::obterInfo() . ":<br>Nome Comun: $this->nomeComun<br>Nome latino: $this->nomeLatino<br>Altura Máxima: $this->alturaMaxima";
        }
    }
?>
