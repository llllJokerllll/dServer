<html>
	<head>
		<meta charset="utf-8">
		<title>Probas PHP</title>
	</head>
	<body>
		<h1>Estamos de probas con PHP</h1>
		<?php
		echo "Hola Mundo!!!"; // mismas opcions para mostrar print, print_r, printf
		
		//las variables van con $ primero y no tienen q ser de ningun tipo
		$a = 5;
		
		//Usamos el "." para concatenar los valores
		echo "<br>" . $a;
		
		$a = "estamos aqui";
		
		echo "<h2>" . $a . "</h2>";
		
		echo "<strong>$a</strong><br>";
		
		echo '<strong>$a</strong><br>';
		
		//int, float, boolean, String
		
		$a = 3;
		$b = "3";
		
		echo "O resultado da operación é: " . ($a*$b) . "<br>";
		
		$a = "String";
		var_dump($a);
		
		$numeroReal = 4e2;
		
		define("NOME", 5);
		
		echo NOME;
		
		if ($numeroReal > 0) {
		    echo "<br>Positivo";
		} else {
		    echo "<br>Negativo";
		}
		
// 		while () {
		    
// 		}
		
		echo "<ol>";
		
		for ($i = 0; $i < 10; $i++) {
		    echo "<li>$i</li>";
		}
		
		echo "</ol>";
		
		echo PHP_INT_MAX;
		
		echo "<br>" . $_SERVER["SERVER_NAME"];
		// $_REQUEST, $_GET, $_POST, 
		
		// vectores en php
		//$vector = array();
		//$vector = [];
		
		$vector[] = 10;
		$vector[] = 9;
		$vector[] = 7;
		$vector[] = 5;
		
		$vector[0] = 10;
		$vector[1] = 9;
		$vector[55] = 7;
		$vector[4] = 5;
		
		echo "<br>";
		
		foreach ($vector as $key => $value) {
		    echo $value, "<br>";
		}
		
		$vectorAsociativo["Lunes"] = "Sopa";
		$vectorAsociativo["Martes"] = "Pokemon a la sal";
		$vectorAsociativo["Miercoles"] = "Sobras del pokemon";
		
		foreach ($vectorAsociativo as $key => $value) {
		    echo $key . ": " . $value, "<br>";
		}
		
		echo "<br>";
		print_r($vector);
		
		
		
		?>
	</body>
	
</html>
