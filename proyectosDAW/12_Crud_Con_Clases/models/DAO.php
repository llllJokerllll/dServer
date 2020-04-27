<?php 
interface DAO {
    public function get($id);
    public function getAll();
    public function save($object);
    public function delete($object);
    public function update($object);
}
?>