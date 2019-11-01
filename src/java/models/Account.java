/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Rezaditya
 */
@Entity
@Table(name = "ACCOUNT")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Account.findAll", query = "SELECT a FROM Account a")
  , @NamedQuery(name = "Account.findByEmployeeId", query = "SELECT a FROM Account a WHERE a.employeeId = :employeeId")
  , @NamedQuery(name = "Account.findByPassword", query = "SELECT a FROM Account a WHERE a.password = :password")
  , @NamedQuery(name = "Account.findByEmail", query = "SELECT a FROM Account a WHERE a.email = :email")
  , @NamedQuery(name = "Account.findByToken", query = "SELECT a FROM Account a WHERE a.token = :token")})
public class Account implements Serializable {

  private static final long serialVersionUID = 1L;
  @Id
  @Basic(optional = false)
  @Column(name = "EMPLOYEE_ID")
  private Integer employeeId;
  @Basic(optional = false)
  @Column(name = "PASSWORD")
  private String password;
  @Basic(optional = false)
  @Column(name = "EMAIL")
  private String email;
  @Column(name = "TOKEN")
  private String token;
  @JoinColumn(name = "STATUS", referencedColumnName = "ID")
  @ManyToOne(fetch = FetchType.LAZY)
  private Status status;

  public Account() {
  }

  public Account(Integer employeeId) {
    this.employeeId = employeeId;
  }

  public Account(Integer employeeId, String password, String email) {
    this.employeeId = employeeId;
    this.password = password;
    this.email = email;
  }

  public Account(Integer employeeId, String password, String email, String token, Status status) {
    this.employeeId = employeeId;
    this.password = password;
    this.email = email;
    this.token = token;
    this.status = status;
  }

  public Integer getEmployeeId() {
    return employeeId;
  }

  public void setEmployeeId(Integer employeeId) {
    this.employeeId = employeeId;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public Status getStatus() {
    return status;
  }

  public void setStatus(Status status) {
    this.status = status;
  }

  @Override
  public int hashCode() {
    int hash = 0;
    hash += (employeeId != null ? employeeId.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof Account)) {
      return false;
    }
    Account other = (Account) object;
    if ((this.employeeId == null && other.employeeId != null) || (this.employeeId != null && !this.employeeId.equals(other.employeeId))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "models.Account[ employeeId=" + employeeId + " ]";
  }
  
}
