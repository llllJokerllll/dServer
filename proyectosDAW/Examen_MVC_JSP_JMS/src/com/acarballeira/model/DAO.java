package com.acarballeira.model;

import java.util.List;
//import java.util.Optional;

/**
 * 
 * @author chanquinhas
 *
 * @param <T>. T indica o tipo de dato/clase que vai implementar esta interface. 
 * Ao implementar a interface, por exemplo teriamos algo así: "public class ClienteDAO implements DAO<Cliente>"
 * e deberíamos substituír as T por Cliente.
 */
public interface DAO<T> {
    
    //T get(int id);    
    List<T> getAll();     
    public boolean save(T t);     
    //public boolean update(T t);     
    //public boolean delete(T t);
}
