/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import models.Country;
import models.Department;
import models.Employee;
import models.Job;
import models.Location;
import models.Region;
import org.hibernate.SessionFactory;

/**
 *
 * @author Aseprudin
 */
public class ORM31 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        SessionFactory factory = HibernateUtil.getSessionFactory();
        System.out.println(factory);
        
        //dao
        System.out.println("-------------------------------------REGION--------------------------------------------------");
        //Region
//        IGeneralDAO<Region> rdao = new GeneralDAO<>(factory, Region.class);
//        if (rdao.saveOrDelete(new Region(new BigDecimal("90"), "Kenye"), true)) {
//            System.out.println("Save Sukses");
//        } else {
//            System.out.println("Save Tidak Sukses");
//        }
//        
//        if (rdao.saveOrDelete(new Region(new BigDecimal("90")), false)) {
//            System.out.println("Delete Sukses");
//        } else {
//            System.out.println("Delete Failed");
//        }
//        
//        for (Region region : rdao.getAll()) {
//            System.out.println(region.getId()+ " - " + region.getName());
//        }
//        
//        Region region = rdao.getById(new BigDecimal(2));
//        System.out.println(region.getId()+" - "+region.getName());
//        
//        System.out.println("-------------------------------------COUNTRY--------------------------------------------------");
//        //Country
//        IGeneralDAO<Country> cdao = new GeneralDAO<>(factory, Country.class);
//        if (cdao.saveOrDelete(new Country("AB", "Cede", new Region(new BigDecimal(2))), true)) {
//            System.out.println("Save Sukses");
//        } else {
//            System.out.println("Save Failed");
//        }
//        
//        if (cdao.saveOrDelete(new Country("AB", "Cede", new Region(new BigDecimal(2))), false)) {
//            System.out.println("Delete Sukses");
//        } else {
//            System.out.println("Delete Failed");
//        }


        //Controller
        
    }
}

