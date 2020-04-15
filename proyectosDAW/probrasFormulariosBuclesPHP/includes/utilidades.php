<?php
function recolle($var) {
    if (isset($_REQUEST[$var])) {
        return trim(htmlspecialchars($_REQUEST[$var], ENT_QUOTES, "UTF-8"));
    } else {
        return "";
    }
}
?>