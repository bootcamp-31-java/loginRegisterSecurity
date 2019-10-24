/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.impl;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.util.List;
import models.Job;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aseprudin
 */
public class JobController {
    
    private SessionFactory factory;
    private IGeneralDAO<Job> ijdao;

    public JobController(SessionFactory factory) {
        ijdao = new GeneralDAO<>(factory, Job.class);
    }
    
    public String save(String id, String title, String minSalary, String maxSalary){
        if (ijdao.saveOrDelete(new Job(id, title, new Integer(minSalary), 
                new Integer(maxSalary)), true)) {
            return "Save Success";
        } else {
            return "Save Failed";
        }
    }
    
    public String delete(String id){
        if (ijdao.saveOrDelete(new Job(id), true)) {
            return "Delete Success";
        } else {
            return "Delete Failed";
        }
    }
    
    public List<Job> getAll(){
        return ijdao.getAll();
    }
    
    public Job getById(String id){
        return ijdao.getById(id);
    }
}
