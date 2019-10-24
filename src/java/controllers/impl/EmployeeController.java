/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.impl;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import models.Department;
import models.Employee;
import models.Job;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aseprudin
 */
public class EmployeeController {
    
    private SessionFactory factory;
    private IGeneralDAO<Employee> iedao;

    public EmployeeController(SessionFactory factory) {
        iedao = new GeneralDAO<>(factory, Employee.class);
    }
    
    public String save(String id, String firstName, String lastName, String email, 
            String phoneNumber, String hireDate, String salary, String commissionPct, 
            String department, String manager, String job){
        if (iedao.saveOrDelete(new Employee(new Integer(id), firstName, lastName, email, 
                phoneNumber, new Date(hireDate), new BigDecimal(salary), 
                new BigDecimal(commissionPct), new Department(new Short(department)), 
                new Employee(new Integer(manager)), new Job(job)), true)) {
            return "Save Success";
        } else {
            return "Save Failed";
        }   
    }
    
    public String delete(String id){
        if(iedao.saveOrDelete(new Employee(new Integer(id)), false)){
            return "delete Success";
        }else{
            return "delete Failed";
        }
    }
    
    public List<Employee> getAll(){
        return iedao.getAll();
    }
    
    public Employee getById(String id){
        return iedao.getById(id);
    }
}
