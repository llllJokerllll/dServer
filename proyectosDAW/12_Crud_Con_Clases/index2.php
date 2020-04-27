<?php 
    require_once 'models/DAO.php';
    require_once 'models/Country.php';
    require_once 'models/CountryDAO.php';
    require_once 'config/config.php';
    
    /*$pais = new Country("AEI");
    
    echo $pais->getCode();
    
    echo $pais;*/
    
    $cDAO = new CountryDAO();
    $vector = $cDAO->getAll();
    
    echo count($vector);
    
    $pais = $cDAO->get("ARE");
    
    echo $pais;
    
    $pais = new Country("ZZZ", "La ostia", "s");
    //$cDAO->save($pais);
    
    //$cDAO->delete($pais);
    
    $cDAO->update($pais);
?>