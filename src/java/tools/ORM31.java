/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import static controllers.impl.AccountController.getRandomString;
import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.text.DecimalFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Random;
import models.Account;
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

  public static String generateRandomBase64Token(int byteLength) {
    SecureRandom secureRandom = new SecureRandom();
    byte[] token = new byte[byteLength];
    secureRandom.nextBytes(token);
    return Base64.getUrlEncoder().withoutPadding().encodeToString(token); //base64 encoding
  }

  public static String getRandomString(int length) {
    final String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+";
    StringBuilder result = new StringBuilder();
    while (length > 0) {
      Random rand = new Random();
      result.append(characters.charAt(rand.nextInt(characters.length())));
      length--;
    }
    return result.toString();
  }

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

    System.out.println(generateRandomBase64Token(32).length());
    System.out.println(getRandomString(32).length());

    
    long status = -1;
    boolean availabelToken = false;
    String n[] = {"a", "b", "c"};
    String token = "b";
    
    for (String account : n) {
      if (account == token) {
        token = "d";
      }
    }
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
