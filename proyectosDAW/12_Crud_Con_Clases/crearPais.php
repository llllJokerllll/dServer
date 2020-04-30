<?php
    include_once 'top.php';
    include_once 'menu.php';
?>
		<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Creación dun País</h1>
                    <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
                        <label>Code* </label><input type="text" name="code" minlenght="2" maxlength="3" required><br>
                        <label>Code2* </label><input type="text" name="code2" minlenght="2" maxlength="2" required><br>
                        <label>Nome* </label><input type="text" name="nome" minlength="1" maxlength="50" required><br>
                        <label>Continente* </label><input type="text" name="continent" pattern="(Asia|Europe|North America|Africa|Oceania|Antarctica|South America)" required><br>
                        <label>Región* </label><input type="text" name="region" minlenght="1" maxlength="26" required><br>
                        <label>Superficie* </label><input type="number" name="superficie" min="0" max="99999999999" required><br>
                        <label>Población* </label><input type="number" name="poblacion" min="0" max="99999999999" required><br>
                        <label>Esperanza de vida </label><input type="number" name="esperanzaVida" step="0.01" min="0" max="150.0" required><br>
                        <label>Local name* </label><input type="text" name="localName" minlenght="1" maxlength="45" required><br>
                        <label>Tipo de goberno* </label><input type="text" name="tipoGoberno" minlenght="1" maxlength="45" required><br>            
                        <label>Ano de independencia </label><input type="number" name="indepYear" min="0" max="2000"><br>
                        <label>GNP </label><input type="number" name="gnp" min="0" max="99999" step="0.1"><br>
                        <label>GNP antigo </label><input type="number" name="gnpOld" min="0" max="99999" step="0.1"><br>
                        <label>Xefe de estado </label><input type="text" name="headOfState" minlength="0" maxlength="55"><br>
                        <label>Capital</label><input type="number" name="capital" min="0" max="99999999"><br>
                        <input type="submit">
                    </form>
        		</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
        <?php
                
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $cDAO = new CountryDAO();
                $pais = new Country($_POST["code"], $_POST["nome"], $_POST["continent"], $_POST["region"], $_POST["superficie"],
                    $_POST["poblacion"], $_POST["esperanzaVida"], $_POST["localName"], $_POST["tipoGoberno"], $_POST["indepYear"],
                    $_POST["gnp"], $_POST["gnpOld"], $_POST["headOfState"],
                    $_POST["capital"], $_POST["code2"]);
                if ($cDAO->save($pais)) {
                    echo "País creado con éxito";
                } else {
                    echo "Problemas creando país";
                }
            }
        ?>
<?php
    include_once 'bottom.php';
?>