/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;
import models.Account;

/**
 *
 * @author Aseprudin
 */
public interface IGeneralDAO<T> {

    List<T> getAll();

    T getById(Object id);

    boolean saveOrDelete(T t, boolean isSave);
    
    List<Account> getPassByEmail(String email);
        
    boolean getToken(String token);
    
    Account getByEmail(String email);
}
