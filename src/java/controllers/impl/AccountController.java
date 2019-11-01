/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.impl;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import models.Account;
import models.Country;
import models.Region;
import models.Status;
import org.hibernate.SessionFactory;
import tools.BCrypt;

/**
 *
 * @author Rezaditya
 */
public class AccountController {

  private SessionFactory factory;
  private IGeneralDAO<Account> iadao;

  public AccountController(SessionFactory factory) {
    iadao = new GeneralDAO<>(factory, Account.class);
  }

  public String save(String employeeId, String email, String password) {
    String token = getRandomString(32);
    long status = -1;

    //reza
//    Account account = iadao.getToken(token);
    if (iadao.getToken(token)) {
      token = getRandomString(32);
    }

    //ayu
//    boolean m = true;
//    do {
//      Account account = iadao.getToken(token);
//      if (!account.getToken().isEmpty()) {
//        token = getRandomString(32);
//      } else {
//        m = false;
//      }
//    } while (m);
    //BCrypt password
    password = BCrypt.hashpw(password, BCrypt.gensalt());

    if (iadao.saveOrDelete(new Account(Integer.parseInt(employeeId), password, email, token, new Status(status)), true)) {
      return "Save Success";
    } else {
      return "Save Failed";
    }
  }

  public static String getRandomString(int length) {
    final String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJLMNOPQRSTUVWXYZ1234567890";
    StringBuilder result = new StringBuilder();
    while (length > 0) {
      Random rand = new Random();
      result.append(characters.charAt(rand.nextInt(characters.length())));
      length--;
    }
    return result.toString();
  }

  public String delete(String employeeId) {
    if (iadao.saveOrDelete(new Account(Integer.parseInt(employeeId)), false)) {
      return "Delete Success";
    } else {
      return "Delete Failed";
    }
  }

  public List<Account> getAll() {
    return iadao.getAll();
  }

  public Account getById(String employeeId) {
    return iadao.getById(employeeId);
  }

  public List<Account> getPassByEmail(String email) {
    return iadao.getPassByEmail(email);
  }

  public boolean login(String email, String password) {
    boolean result = false;
    if (BCrypt.checkpw(password, getPassByEmail(email).get(0).getPassword())) {
      result = true;
    }
    return result;
  }

  public Account getByEmail(String email) {
    return iadao.getByEmail(email);
  }

  public String updateStatus(String employeeId, String email, String password, String token, String status) {
    if (iadao.saveOrDelete(new Account(Integer.parseInt(employeeId), password, email, token, new Status(new Long(status))), true)) {
      return "Save Success";
    } else {
      return "Save Failed";
    }
  }
}
