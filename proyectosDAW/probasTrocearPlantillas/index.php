<?php 
    define("URL_THEME", dirname($_SERVER["SCRIPT_NAME"]) . '/views/theme/');
    define("DIR_THEME", dirname(__FILE__) . '/views/theme/');
    
    if (isset($_GET["controller"])) {
        require_once("controllers/" . $_GET["controller"] . ".php");
    } else {
        require_once("controllers/indexController.php");
    }