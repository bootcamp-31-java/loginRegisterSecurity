/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.impl;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.math.BigDecimal;
import java.util.List;
import models.Country;
import models.Region;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aseprudin
 */
public class CountryController {
    
    private SessionFactory factory;
    private IGeneralDAO<Country> icdao;

    public CountryController(SessionFactory factory) {
        icdao = new GeneralDAO<>(factory, Country.class);
    }
    
    public String save(String id, String name, String regionId){
        if (icdao.saveOrDelete(new Country(id, name, new Region(new BigDecimal(id))), true)) {
            return "Save Success";
        } else {
            return "Save Failed";
        }
    }
    
    public String delete(String id){
        if (icdao.saveOrDelete(new Country(id), true)) {
            return "Delete Success";
        } else {
            return "Delete Failed";
        }
    }
    
    public List<Country> getAll(){
        return icdao.getAll();
    }
    
    public Country getById(String id){
        return icdao.getById(id);
    }
    
}
