<?php
function recolle($var, $m = "") {
    if (isset($_REQUEST[$var])) {
        $tmp = (is_array($m)) ? [] : "";
    } else if (!is_array($_REQUEST[$var])) {
        $tmp = trim(htmlspecialchars($_REQUEST[$var], ENT_QUOTES, "UTF-8"));
    } else {
        $tmp = "";
    }
    return $tmp;
}
 
function voltarArquivos($ruta) {
    $arrayArquivos = [];
    $directorio = opendir($ruta);
    while ($arquivo = readdir($directorio)) {
        if (is_file($arquivo) && preg_match("/.php$/", $arquivo)) {
            $arrayArquivos[] = $arquivo;
        }
    } // while
    sort($arrayArquivos);
    return $arrayArquivos;
}
?>