<?php 
class Country {
    
    private $code; // Campo clave
    private $name;
    private $continent;
    private $region;
    private $surfaceArea;
    private $indepYear;
    private $population;
    private $lifeExpectancy;
    private $GNP;
    private $GNPOld;
    private $localName;
    private $governmentForm;
    private $headOfState;
    private $capital;
    private $code2;
    
    public function __construct($code = "", $name = "", $continent = "Asia", $region = "", $surfaceArea = 0, $indepYear = 0, $population = 0, $lifeExpectancy = 0, $GNP = 0, $GNPOld = 0, $localName = "", $governmentForm = "", $headOfState = "", $capital = 0, $code2 = "") {
        
        $this -> code = $code;
        $this -> name = $name;
        $this -> continent = $continent;
        $this -> region = $region;
        $this -> surfaceArea = $surfaceArea;
        $this -> indepYear = $indepYear;
        $this -> population = $population;
        $this -> lifeExpectancy = $lifeExpectancy;
        $this -> GNP = $GNP;
        $this -> GNPOld = $GNPOld;
        $this -> localName = $localName;
        $this -> governmentForm = $governmentForm;
        $this -> headOfState = $headOfState;
        $this -> capital = $capital;
        $this -> code2 = $code2;
    }
    
    public function getCode()
    {
        return $this->code;
    }

    public function getName()
    {
        return $this->name;
    }

    public function getContinent()
    {
        return $this->continent;
    }

    public function getRegion()
    {
        return $this->region;
    }

    public function getSurfaceArea()
    {
        return $this->surfaceArea;
    }

    public function getIndepYear()
    {
        return $this->indepYear;
    }

    public function getPopulation()
    {
        return $this->population;
    }

    public function getLifeExpectancy()
    {
        return $this->lifeExpectancy;
    }

    public function getGNP()
    {
        return $this->GNP;
    }

    public function getGNPOld()
    {
        return $this->GNPOld;
    }

    public function getLocalName()
    {
        return $this->localName;
    }

    public function getGovernmentForm()
    {
        return $this->governmentForm;
    }

    public function getHeadOfState()
    {
        return $this->headOfState;
    }

    public function getCapital()
    {
        return $this->capital;
    }

    public function getCode2()
    {
        return $this->code2;
    }

    public function setCode($code)
    {
        $this->code = $code;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function setContinent($continent)
    {
        $this->continent = $continent;
    }

    public function setRegion($region)
    {
        $this->region = $region;
    }

    public function setSurfaceArea($surfaceArea)
    {
        $this->surfaceArea = $surfaceArea;
    }

    public function setIndepYear($indepYear)
    {
        $this->indepYear = $indepYear;
    }

    public function setPopulation($population)
    {
        $this->population = $population;
    }

    public function setLifeExpectancy($lifeExpectancy)
    {
        $this->lifeExpectancy = $lifeExpectancy;
    }

    public function setGNP($GNP)
    {
        $this->GNP = $GNP;
    }

    public function setGNPOld($GNPOld)
    {
        $this->GNPOld = $GNPOld;
    }

    public function setLocalName($localName)
    {
        $this->localName = $localName;
    }

    public function setGovernmentForm($governmentForm)
    {
        $this->governmentForm = $governmentForm;
    }

    public function setHeadOfState($headOfState)
    {
        $this->headOfState = $headOfState;
    }

    public function setCapital($capital)
    {
        $this->capital = $capital;
    }

    public function setCode2($code2)
    {
        $this->code2 = $code2;
    }

    public function __toString() {
        return "Codigo: $this->code, Nombre: $this->name, Continente: $this->continent, Región: $this->region, Superficie: $this->surfaceArea, Independencia: $this->indepYear, Población: $this->population, Esperanza de Vida: $this->lifeExpectancy, GNP: $this->GNP, GNPOld: $this->GNPOld, Nombre Local: $this->localName, Gobierno: $this->governmentForm, Estado: $this->headOfState, Capital: $this->capital, Code2: $this->code2";
    }
    
}

?>