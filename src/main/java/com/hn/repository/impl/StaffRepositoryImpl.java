package com.hn.repository.impl;

import com.hn.pojo.Customer;
import com.hn.pojo.Staff;
import com.hn.repository.StaffRepository;
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
@Repository
@Transactional
public class StaffRepositoryImpl implements StaffRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Staff getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Staff.class, id);
    }

    @Override
    public Staff getByAccountId(int accountId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Staff> query = builder.createQuery(Staff.class);
        Root root = query.from(Staff.class);
        query = query.select(root);

        Predicate p1 = builder.equal(root.join("staff").get("id").as(Integer.class), accountId);

        query = query.where(p1);

        Query q = session.createQuery(query);

        return (Staff) q.getSingleResult();
    }

    @Override
    public boolean addOrUpdate(Staff staff) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (staff.getId() > 0)
                session.update(staff);
            else
                session.save(staff);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteStaff(Staff staff) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(staff);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public int count() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        javax.persistence.Query q = session.createQuery("Select Count(*) From Staff ");

        return Integer.parseInt(q.getSingleResult().toString());
    }
}
