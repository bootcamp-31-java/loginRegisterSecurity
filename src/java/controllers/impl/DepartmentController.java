/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.impl;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.util.List;
import models.Department;
import models.Employee;
import models.Location;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aseprudin
 */
public class DepartmentController {

    private SessionFactory factory;
    private IGeneralDAO<Department> iddao;

    public DepartmentController(SessionFactory factory) {
        iddao = new GeneralDAO<>(factory, Department.class);
    }

    public String save(String id, String name, String manager, String location) {
        if (iddao.saveOrDelete(new Department(Short.parseShort(id), name, 
                new Employee(Integer.parseInt(manager)), 
                new Location(Short.parseShort(location))), true)) {
            return "Save Succes";
        } else {
            return "Save Failed";
        }
    }

    public String delete(String id, String name, String manager, String location) {
        if (iddao.saveOrDelete(new Department(Short.parseShort(id), 
                name, new Employee(Integer.parseInt(manager)),
                new Location(Short.parseShort(location))), false)) {
            return "Delete Succes";
        } else {
            return "Delete Failed";
        }
    }

    public List<Department> getAll() {
        return iddao.getAll();
    }

    public Department getById(String id) {
        return iddao.getById(Short.parseShort(id));
    }

}
