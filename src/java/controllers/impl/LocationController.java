/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.impl;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.util.List;
import models.Country;
import models.Location;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aseprudin
 */
public class LocationController {
    
    private SessionFactory factory;
    private IGeneralDAO<Location> ildao;

    public LocationController(SessionFactory factory) {
        ildao = new GeneralDAO<>(factory, Location.class);
    }
    
    public String save(String id, String streetAddress, String postalCode, String city,
            String stateProvince, String countryId){
        if (ildao.saveOrDelete(new Location(new Short("id"), streetAddress, postalCode, city, 
                stateProvince, new Country(id)), true)) {
            return "Save Success";
        } else {
            return "Save Failed";
        }
    }
    
    public String delete(String id){
        if (ildao.saveOrDelete(new Location(new Short("id")), true)) {
            return "Delete Succes";
        } else {
            return "Delete Failed";
        }
    }
    
    public List<Location> getAll(){
        return ildao.getAll();
    }
    
    public Location getById(String id){
        return ildao.getById(new Short("id"));
    }
}
