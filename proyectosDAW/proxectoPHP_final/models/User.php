<?php 
class User {
    private $id;
    private $username;
    private $password;
    private $nome;
    
    public function __construct($username = "", $password = "", $nome = "") {
        $this->username = $username;
        $this->password = $password;
        $this->nome = $nome;
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

    public function getNome()
    {
        return $this->nome;
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

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    
    
}
?>