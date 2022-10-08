package com.hn.repository.impl;


import com.hn.pojo.CoachLine;
import com.hn.pojo.Driver;
import com.hn.repository.DriverRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class DriverRepositoryImpl implements DriverRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Driver getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Driver.class, id);
    }

    @Override
    public List<CoachLine> getCoachLineByDriver(int driverId, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<CoachLine> q = b.createQuery(CoachLine.class);
        Root root = q.from(CoachLine.class);
        q.select(root);
        Predicate p1 = b.equal(root.join("driverId").get("id").as(Integer.class), driverId);

        q = q.where(p1);



        Query query = session.createQuery(q);
//        if (page > 0) {
//            int size = 0;
//            int start = (page - 1) * size;
//            query.setFirstResult(start);
//            query.setMaxResults(size);

//        }
        return query.getResultList();
    }

    @Override
    public Driver getAccountId(int accountId) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Driver> query = builder.createQuery(Driver.class);
        Root root = query.from(Driver.class);
        query = query.select(root);

        Predicate p1 = builder.equal(root.join("accountId").get("id").as(Integer.class), accountId);

        query = query.where(p1);

        Query q = session.createQuery(query);

        return (Driver) q.getSingleResult();
    }

    @Override
    public boolean addOrUpdate(Driver driver) {

        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (driver.getId() > 0)
                session.update(driver);
            else
                session.save(driver);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteDriver(Driver driver) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(driver);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public int count() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        javax.persistence.Query q = session.createQuery("Select Count(*) From Driver ");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public List<Driver> findAll() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        javax.persistence.Query q = session.createQuery("From Driver ");

        return q.getResultList();
    }


}
