<?php
function recolle($var) {
    if (isset($_REQUEST[$var])) {
        return trim(htmlspecialchars($_REQUEST[$var], ENT_QUOTES, "UTF-8"));
    } else {
        return "";
    }
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