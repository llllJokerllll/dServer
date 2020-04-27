<?php
session_start();
require_once 'models/DAO.php';
require_once 'models/UserDao.php';
require_once 'models/User.php';
require_once 'config/config.php';
require_once 'models/Country.php';
require_once 'models/CountryDAO.php';
?>
<html>
    <head>
    	<style> 
    	   td, th{border: 1px solid black; padding: 4px;}
    	</style>
   	</head>
    <body>
        
