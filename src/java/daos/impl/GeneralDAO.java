/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos.impl;

import daos.IGeneralDAO;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import models.Region;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Aseprudin
 */
public class GeneralDAO<T> implements IGeneralDAO<T> {

    private SessionFactory factory;
    private Session session;
    private Transaction transaction;
    private T model;

    public GeneralDAO(SessionFactory factory, Class<T> model) {
        try {
            this.factory = factory;
            this.model = model.newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean saveOrDelete(T t, boolean isSave) {
        boolean result = false;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            if (isSave) {
                session.saveOrUpdate(t);
            } else {
                session.delete(t);
            }
            result = true;
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public List<T> getAll() {
        List<T> rs = new ArrayList<>();
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            rs = session.createQuery("from " + model.getClass().getSimpleName()).list();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return rs;
    }

    @Override
    public T getById(Object id) {
        T models = null;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("from " + model.getClass().getSimpleName() + " where id = :id");
            query.setParameter("id", id);
            models = (T) query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return models;
    }

}
