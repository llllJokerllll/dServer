<?php 
    if (isset($_COOKIE["visitas"])) {
        $visitas = $_COOKIE["visitas"];
        $visitas++;
        setcookie("visitas", $visitas, time() + 3600 * 24 * 15);
        echo "Me visitaste: " . $visitas . " veces";
    } else {
        setcookie("visitas", 1, time() + 3600 * 24 * 15);
        echo "Benvido por primeira vez";
    }
?>