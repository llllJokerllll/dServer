<?php 
class User {
    private $id;
    private $username;
    private $password;
    private $nomeCompleto;
    private $tipoUsuario;
    
    public function __construct($username = "", $password = "", $nomeCompleto = "", $tipoUsuario = "") {
        $this->username = $username;
        $this->password = $password;
        $this->nomeCompleto = $nomeCompleto;
        $this->tipoUsuario = $tipoUsuario;
    }
    
    public function getId()
    {
        return $this->id;
    }

    public function getUsername()
    {
        return $this->username;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function getNomeCompleto()
    {
        return $this->nomeCompleto;
    }
    
    public function getTipoUsuario()
    {
        return $this->tipoUsuario;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function setUsername($username)
    {
        $this->username = $username;
    }

    public function setPassword($password)
    {
        $this->password = $password;
    }

    public function setNomeCompleto($nomeCompleto)
    {
        $this->nomeCompleto = $nomeCompleto;
    }

    public function setTipoUsuario($tipoUsuario)
    {
        $this->tipoUsuario = $tipoUsuario;
    }
    
}
?>