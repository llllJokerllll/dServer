<?php
    include_once 'top.php';
    include_once 'menu.php';
?>

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
        <?php
                
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                require_once "config.php";
                /*$sql = "INSERT INTO country (Code, Code2, Name, Continent, Region, SurfaceArea, Population, LifeExpectancy, LocalName, GovernmentForm, indepYear, GNP, GNPOld, HeadOfState, Capital)
                        VALUES (:code, :code2, :name, :continent, :region, :superficie, :poblacion, :esperanzaVida, :localName, :tipoGoberno, :indepYear, :GNP, :GNPOld, :headOfState, :capital)";
                $query = $conexion -> prepare($sql);                
                $query->bindParam(":code", $_POST["code"]);
                $query->bindParam(":code2", $_POST["code2"]);
                $query->bindParam(":name", $_POST["nome"]);
                $query->bindParam(":continent", $_POST["continent"]);
                $query->bindParam(":region", $_POST["region"]);
                $query->bindParam(":superficie", $_POST["superficie"]);
                $query->bindParam(":poblacion", $_POST["poblacion"]);
                $query->bindParam(":esperanzaVida", $_POST["esperanzaVida"]);
                $query->bindParam(":localName", $_POST["localName"]);
                $query->bindParam(":tipoGoberno", $_POST["tipoGoberno"]);
                $indepYear = $_POST["indepYear"] != "" ? $_POST["indepYear"]:NULL;
                $query->bindParam(":indepYear",  $indepYear);
                $gnp = $_POST["gnp"] != "" ? $_POST["gnp"]:NULL;
                $query->bindParam(":GNP", $gnp);
                $gnpOld = $_POST["gnpOld"] != "" ? $_POST["gnpOld"]:NULL;
                $query->bindParam(":GNPOld", $gnpOld);
                $headOfState = $_POST["headOfState"] != "" ? $_POST["headOfState"]:NULL;
                $query->bindParam(":headOfState", $headOfState);
                $capital = $_POST["capital"] != "" ? $_POST["capital"]:NULL;
                $query->bindParam(":capital",$capital );*/
                $sql = "INSERT INTO country (Code, Code2, Name, Continent, Region, SurfaceArea, Population, LifeExpectancy, LocalName, GovernmentForm, indepYear, GNP, GNPOld, HeadOfState, Capital)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try{
                    $query = $conexion -> prepare($sql);     
                    $query-> execute([$_POST["code"], $_POST["code2"], $_POST["nome"], $_POST["continent"], $_POST["region"], $_POST["superficie"],
                        $_POST["poblacion"], $_POST["esperanzaVida"], $_POST["localName"],$_POST["tipoGoberno"], $_POST["indepYear"] != "" ? $_POST["indepYear"]:NULL,
                        $_POST["gnp"] != "" ? $_POST["gnp"]:NULL, $_POST["gnpOld"] != "" ? $_POST["gnpOld"]:NULL, $_POST["headOfState"] != "" ? $_POST["headOfState"]:NULL,
                        $_POST["capital"] != "" ? $_POST["capital"]:NULL
                    ]);
                    echo "País creado con éxito";
                } catch (PDOException $e){
                    die ("Problemas creando o país ". $e->getMessage());
                }
                                                
                
            }
        ?>
<?php
    include_once 'bottom.php';
?>