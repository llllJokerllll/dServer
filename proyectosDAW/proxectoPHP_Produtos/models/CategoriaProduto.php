<?php
class CategoriaProduto {
    private $id;
    private $nome;
    private $descricion;
    private $activado;

    public function __construct($nome = "", $descricion = "", $activado = 0) {
        $this->nome = $nome;
        $this->descricion = $descricion;
        $this->activado = $activado;
    }
    
    public function getId() {
        return $this->id;
    }
    
    public function getNome() {
        return $this->nome;
    }
    
    public function getDescricion() {
        return $this->descricion;
    }
    
    public function getActivado() {
        return $this->activado;
    }
    
    public function setId($id) {
        $this->id = $id;
    }
    
    public function setNome($nome) {
        $this->nome = $nome;
    }
    
    public function setDescricion($descricion) {
        $this->descricion = $descricion;
    }
    
    public function setActivado($activado) {
        $this->activado = $activado;
    }
    
    public function getProdutos() {
        $produto = new ProdutoDAO();
        $produtos = $produto->getALL(["idCategoriaProduto" => $this->id]);
        // $produto->getProdutosDestaCategoria($this->id);
        return $produtos;
    }
}
?>