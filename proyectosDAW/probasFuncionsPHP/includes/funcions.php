<?php
/* Catálogo de funcións */
    /**
     * 
     * @param int $numero
     * @return boolean
     */
    function par($numero) {
        $res = false;
        if ($numero % 2 == 0) {
            $res = true;
        } 
        return $res;
    }

    /**
     * 
     * @param number $num
     * @return number
     */
    function incremento($num = 0) {
        return ++$num;
    }
    
    /**
     * 
     * @param number $num
     * @return boolean
     */
    function incremento2(&$num = 0) {
        $res = false;
        if (++$num) {
            $res = true;
        }
        return $res;
    }
    
    /**
     * 
     * @param number $num
     * @return boolean
     */
    function cadrado($num) {
        $cad = pow($num, 2);
        echo "O cadrado de $num é $cad";
        return true;
    }
    
    /**
     * 
     * @param number $num1
     * @param number $num2
     * @return number
     */
    function producto($num1, $num2) {
        return $num1 * $num2;
    }
    
    /**
     * 
     * @param number $num
     */
    function amosaNum($num) {
        echo "O número introducido é: $num";
    }
    
    //Variables globales
    $a = 4;
    $b = 7;
    $res = 0;
    
    /**
     * 
     * @return number
     */
    function suma() {
        global $a, $b, $res;
        
        $res = $a + $b;
        return $res;
    }
    
    /**
     * 
     * @param int $numMes
     * @return string
     */
    function nomeMes($numMes = 1) {
        
        $meses = [
            1 => "Xaneiro",
            2 => "Febreiro",
            3 => "Marzo",
            4 => "Abril",
            5 => "Maio",
            6 => "Xuño",
            7 => "Xullo",
            8 => "Agosto",
            9 => "Setembro",
            10 => "Outubro",
            11 => "Novembro",
            12 => "Decembro",
        ];
        
        foreach ($meses as $key => $value) {
            if ($key == $numMes) {
                return $value;
            }
        }
        
        return "Inválido";
    }
    
    /**
     * 
     * @param number $valor
     * @param number $ive
     * @return number
     */
    function iva($valor, $ive = 21) {
        return $valor * ($ive / 100);
    }
    
    /**
     * 
     * @param number $a
     * @param number $b
     * @return number
     */
    function media($a, $b) {
        return ($a + $b) / 2;
    }
    
    /**
     * 
     * @param int $year
     * @return boolean
     */
    function esBisiesto($ano) {
        return ( ($ano % 4 == 0 && $ano % 100 != 0) || $ano % 400 == 0 ) ? "El $ano es Bisiesto":"El $ano NO es Bisiesto";
    }
    
    /**
     * 
     * @param number $num
     * @return boolean
     */
    function esCapicua($num) {
        $inverso = 0;
        $cociente = $num;
        while ($cociente != 0) {
            $resto = $cociente % 10;
            $inverso = $inverso * 10 + $resto;
            $cociente = (int) ($cociente / 10);
        }
        return ($inverso == $num);
    }
    
    /**
     * 
     * @param int $num
     */
    function fibonacci($num = 5) {
        if ($num < 3) {$num = 3;}
        $fibonacci  = [0,1];
        
        for($i = 2; $i <= $num; $i++) {
            $fibonacci[] = $fibonacci[$i - 1] + $fibonacci[$i - 2];
            echo $fibonacci[$i] . " ";
        }
    }
    
    /**
     * 
     * @param number ...$numeros
     * @return number
     */
    function exercicio15(...$numeros) {
        if (count($numeros) == 2) {
            return $numeros[0] * $numeros[1];
        } else if (count($numeros) == 3) {
            return $numeros[0] + $numeros[1] + $numeros[2];
        } else if (count($numeros) == 4) {
            return ($numeros[0] + $numeros[1] + $numeros[2] + $numeros[3]) / 4;
        }
    }
    
    /**
     * 
     * @param String $texto
     */
    function stats($texto) {
        $vector["len"] = 0;
        $vector["a"] = 0;
        $vector["e"] = 0;
        $vector["i"] = 0;
        $vector["o"] = 0;
        $vector["u"] = 0;
        
        $texto = strtolower($texto);
        $vector["len"] = strlen($texto);
        
        for ($i = 0; $i < $vector["len"]; $i++) {
            if ($texto[$i] == "a") {
                $vector["a"] += 1;
            } else if ($texto[$i] == "e") {
                $vector["e"] += 1;
            } else if ($texto[$i] == "i") {
                $vector["i"] += 1;
            } else if ($texto[$i] == "o") {
                $vector["o"] += 1;
            } else if ($texto[$i] == "u") {
                $vector["u"] += 1;
            }
        }
        return $vector;
    }
    
    /**
     * 
     * @return string
     */
    function exercicio17() {
        
        $cadeaSaida = "";
        
        $parametros = func_get_args();
        
        foreach ($parametros as $p) {
            $cadeaSaida .= "<li>" . $p . "</li>";
        }
        
        if ($cadeaSaida != "") {
            $cadeaSaida = "<ol>$cadeaSaida</ol>";
        }
        
        return $cadeaSaida;
    }
    
    function exercicio18($vector, &$menor) {
        
        $menor = min($vector);
        return ($menor > 0) ? "true" : "false";
    }
?>