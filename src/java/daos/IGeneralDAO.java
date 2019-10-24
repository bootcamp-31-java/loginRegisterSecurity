/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;

/**
 *
 * @author Aseprudin
 */
public interface IGeneralDAO<T> {

    List<T> getAll();

    T getById(Object id);

    boolean saveOrDelete(T t, boolean isSave);
    
}
