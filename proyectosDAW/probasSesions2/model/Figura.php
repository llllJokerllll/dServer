<?php

    class Figura {
        
        //private, protected, public
        protected $nome;
        protected $regular;
        
        public static $numFiguras = 0;
        
        public function __construct() {
            
            $params = func_get_args();  
            $constructorAChamar = "__construct" . count($params);
            
            if (method_exists($this, $constructorAChamar)) {
                call_user_func_array([$this, $constructorAChamar], $params);
            } else {
                die("Non existe constructor con esos parámetros");
            }
        }
        
        public function __construct1($nome = "") {
            $this -> nome = $nome;
            self::$numFiguras++;
        }
        
        public function __construct2($nome = "", $regular = false) {
            $this -> nome = $nome;
            $this -> regular = $regular;
            self::$numFiguras++;
        }
        

        public function getNome() {
            return $this->nome;
        }
    
        public function setNome($nome) {
            $this->nome = $nome;
        }
        
        public function getRegular() {
            return $this->regular;
        }
        
        public function setRegular($regular) {
            $this->regular = $regular;
        }
    
        public function __toString() {
            return "Figura: " . $this->nome . ", " . $this->regular;
        }
        
        
    }

?>