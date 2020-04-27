<?php
    include_once 'top.php';
    include_once 'menu.php';
    
    if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET["id"])) {
        require_once "config.php";
        $sql = "SELECT * FROM country WHERE code LIKE :code";
        $query = $conexion -> prepare($sql);        
        $query->bindParam(":code", $_GET["id"]);
        $query -> execute();
        $results = $query -> fetchAll(PDO::FETCH_OBJ);
        //Bucle para amosar resultados
        if($query->rowCount() > 0) {
            $pais = current($results);            
            ?>
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
                <label>Code* </label><input readonly value="<?=$pais->Code?>" type="text" name="code" minlenght="2" maxlength="3" required><br>
                <label>Code2* </label><input value="<?=$pais->Code2?>" type="text" name="code2" minlenght="2" maxlength="2" required><br>
                <label>Nome* </label><input value="<?=$pais->Name?>" type="text" name="nome" minlength="1" maxlength="50" required><br>
                <label>Continente* </label><input value="<?=$pais->Continent?>" type="text" name="continent" pattern="(Asia|Europe|North America|Africa|Oceania|Antarctica|South America)" required><br>
                <label>Región* </label><input value="<?=$pais->Region?>" type="text" name="region" minlenght="1" maxlength="26" required><br>
                <label>Superficie* </label><input value="<?=$pais->SurfaceArea?>" type="number" name="superficie" min="0" max="99999999999" required><br>
                <label>Población* </label><input value="<?=$pais->Population?>" type="number" name="poblacion" min="0" max="99999999999" required><br>
                <label>Esperanza de vida </label><input value="<?=$pais->LifeExpectancy?>" type="number" name="esperanzaVida" step="0.01" min="0" max="150.0" required><br>
                <label>Local name* </label><input value="<?=$pais->LocalName?>" type="text" name="localName" minlenght="1" maxlength="45" required><br>
                <label>Tipo de goberno* </label><input value="<?=$pais->GovernmentForm?>" type="text" name="tipoGoberno" minlenght="1" maxlength="45" required><br>            
                <label>Ano de independencia </label><input value="<?=$pais->IndepYear?>" type="number" name="indepYear" min="0" max="2000"><br>
                <label>GNP </label><input value="<?=$pais->GNP?>" type="number" name="gnp" min="0" max="99999" step="0.1"><br>
                <label>GNP antigo </label><input value="<?=$pais->GNPOld?>" type="number" name="gnpOld" min="0" max="99999" step="0.1"><br>
                <label>Xefe de estado </label><input value="<?=$pais->HeadOfState?>" type="text" name="headOfState" minlength="0" maxlength="55"><br>
                <label>Capital</label><input value="<?=$pais->Capital?>" type="number" name="capital" min="0" max="99999999"><br>
                <input type="submit">
            </form>
            <?php 
            
        }
    }
                
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                require_once "config.php";
                $sql = "UPDATE  country SET
                        Code = ?, Code2 = ?, Name = ?, Continent = ?, Region = ?, SurfaceArea = ?, Population = ?, LifeExpectancy = ?,
                        LocalName = ?, GovernmentForm = ?, IndepYear = ?, GNP = ?, GNPOld = ?, HeadOfState = ?, Capital = ?
                        WHERE code LIKE ?";
                $params = [
                    $_POST["code"], 
                    $_POST["code2"], 
                    $_POST["nome"], 
                    $_POST["continent"], 
                    $_POST["region"], 
                    $_POST["superficie"],
                    $_POST["poblacion"], 
                    $_POST["esperanzaVida"], 
                    $_POST["localName"],
                    $_POST["tipoGoberno"], 
                    $_POST["indepYear"] != "" ? $_POST["indepYear"]:NULL,
                    $_POST["gnp"] != "" ? $_POST["gnp"]:NULL, 
                    $_POST["gnpOld"] != "" ? $_POST["gnpOld"]:NULL, 
                    $_POST["headOfState"] != "" ? $_POST["headOfState"]:NULL,
                    $_POST["capital"] != "" ? $_POST["capital"]:NULL,
                    $_POST["code"],
                ];
                                
                try{
                    $query = $conexion -> prepare($sql);
                    //$query->bindParam(":code", $_POST["code"]); Non pode haber parámetros posicionais e nomeados                    
                    $query-> execute($params);
                    echo "País modificado con éxito";
                } catch (PDOException $e){
                    die ("Problemas modificando o país ". $e->getMessage());
                }
                                                
                
            }
        ?>
<?php
    include_once 'bottom.php';
?>