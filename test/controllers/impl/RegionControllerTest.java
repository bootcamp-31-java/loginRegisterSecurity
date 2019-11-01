/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.impl;

import daos.IGeneralDAO;
import daos.impl.GeneralDAO;
import java.math.BigDecimal;
import models.Region;
import org.hibernate.SessionFactory;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Aseprudin
 */
public class RegionControllerTest {
    
    SessionFactory factory;
    IGeneralDAO<Region> irdao;
//
//    public RegionControllerTest(SessionFactory factory) {
//        irdao = new GeneralDAO<>(factory, Region.class);
//    }
    
    public RegionControllerTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of save method, of class RegionController.
     */
    @Test
    public void testSave() {
        irdao.saveOrDelete(new Region(new BigDecimal("1"), "Ayu"), true);
    }

    /**
     * Test of delete method, of class RegionController.
     */
    @Test
    public void testDelete() {
        irdao.saveOrDelete(new Region(new BigDecimal("1"), "Ayu"), false);
    }

    /**
     * Test of getAll method, of class RegionController.
     */
    @Test
    public void testGetAll() {
    }

    /**
     * Test of getById method, of class RegionController.
     */
    @Test
    public void testGetById() {
    }
    
}
