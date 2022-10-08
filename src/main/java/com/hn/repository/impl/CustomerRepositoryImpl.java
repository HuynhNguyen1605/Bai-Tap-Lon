package com.hn.repository.impl;

import com.hn.pojo.Customer;
import com.hn.repository.CustomerRepository;
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
public class CustomerRepositoryImpl implements CustomerRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public Customer getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Customer.class, id);
    }

    @Override
    public Customer getByAccountId(int accountId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Customer> query = builder.createQuery(Customer.class);
        Root root = query.from(Customer.class);
        query = query.select(root);

        Predicate p1 = builder.equal(root.join("account").get("id").as(Integer.class), accountId);

        query = query.where(p1);

        Query q = session.createQuery(query);

        return (Customer) q.getSingleResult();
    }

    @Override
    public boolean addOrUpdate(Customer customer) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (customer.getId() > 0)
                session.update(customer);
            else
                session.save(customer);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(Customer customer) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(customer);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public int count() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        javax.persistence.Query q = session.createQuery("Select Count(*) From Customer ");

        return Integer.parseInt(q.getSingleResult().toString());
    }


}
