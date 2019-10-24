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
import models.Region;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aseprudin
 */
public class RegionController {
    
    private SessionFactory factory;
    private IGeneralDAO<Region> irdao;

    public RegionController(SessionFactory factory) {
        irdao = new GeneralDAO<>(factory, Region.class);
    }
    
    public String save(String id, String name){
        if (irdao.saveOrDelete(new Region(new BigDecimal(id), name), true)) {
            return "Save Succes";
        }else{
            return "Save Failed";
        }
    }
    
    public String delete(String id){
        if (irdao.saveOrDelete(new Region(new BigDecimal(id)), false)) {
            return "Delete Succes";
        } else {
            return "Delete Failed";
        }
    }
    
    public List<Region> getAll() {
        return irdao.getAll();
    }
    
    public Region getById(String id){
        return irdao.getById(new BigDecimal(id));
    }
            
}
