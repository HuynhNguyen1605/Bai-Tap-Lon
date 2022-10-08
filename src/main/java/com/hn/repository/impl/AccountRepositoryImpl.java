package com.hn.repository.impl;

import com.hn.pojo.Account;
import com.hn.repository.AccountRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class AccountRepositoryImpl implements AccountRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    private final int maxItemsInPage = 10;

    public int getMaxItemsInPage() {
        return maxItemsInPage;
    }

    @Override
    public Account getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Account.class, id);
    }

    @Override
    public boolean addOrUpdate(Account user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (user.getId() > 0)
                session.update(user);
            else
                session.save(user);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public Account getByUsername(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("From Account WHERE username=:username");
        q.setParameter("username", username);

        return (Account) q.getSingleResult();

//        CriteriaBuilder builder = session.getCriteriaBuilder();
//        CriteriaQuery<Account> query = builder.createQuery(Account.class);
//        Root root = query.from(Account.class);
//        query = query.select(root);
//
//        query = query.where(builder.equal(root.get("username").as(String.class), username));
//
//        org.hibernate.query.Query q = session.createQuery(query);
//        return (Account) q.getSingleResult();
    }

    @Override
    public List<Account> getAccounts(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Account> q = b.createQuery(Account.class);
        Root root = q.from(Account.class);
        q.select(root);
        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("fullname").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String us = params.get("username");
            if (us != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("username").as(Long.class), Long.parseLong(us));
                predicates.add(p);
            }

            String em = params.get("email");
            if (em != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("email").as(Long.class), Long.parseLong(em));
                predicates.add(p);
            }

            String dc = params.get("diachi");
            if (dc != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("address").as(Long.class), Long.parseLong(dc));
                predicates.add(p);
            }

            String tu = params.get("loaitaikhoan");
            if (tu != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("user_role").as(Long.class), Long.parseLong(tu));
                predicates.add(p);
            }
            q.where(predicates.toArray(Predicate[]::new));
        }
        org.hibernate.query.Query query = session.createQuery(q);
//        if (page > 0) {
//            int size = 0;
//            int start = (page - 1) * size;
//            query.setFirstResult(start);
//            query.setMaxResults(size);
//        }
        return query.getResultList();
    }


    @Override
    public List<Account> getByRole(String role, int page, int active) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Account> query = builder.createQuery(Account.class);
        Root root = query.from(Account.class);
        query = query.select(root);

        Predicate p1 = builder.equal(root.get("userType").as(String.class), role.trim());
        Predicate p2 = builder.equal(root.get("active").as(Integer.class), active);

        query = query.where(p1, p2);

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = session.createQuery(query);

        if (page != 0) {
            int max = maxItemsInPage;
            q.setMaxResults(max);
            q.setFirstResult((page - 1) * max);
        }
        return q.getResultList();
    }

    @Override
    public List<Account> getUsers(String username, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Account> query = builder.createQuery(Account.class);
        Root root = query.from(Account.class);
        query = query.select(root);

        if (!username.isEmpty()) {
            Predicate p = builder.equal(root.get("username").as(String.class), username.trim());
            query = query.where(p);
        }

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = session.createQuery(query);

        if (page != 0) {
            int max = maxItemsInPage;
            q.setMaxResults(max);
            q.setFirstResult((page - 1) * max);
        }
        return q.getResultList();
    }

    @Override
    public List<Account> getUsersMultiCondition(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Account> q = builder.createQuery(Account.class);
        Root root = q.from(Account.class);
        q.select(root);
        q = q.orderBy(builder.desc(root.get("id")));

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            if (params.containsKey("fullname")) {
                Predicate p1 = builder.like(root.get("fullName").as(String.class),
                        String.format("%%%s%%", params.get("fullname")));
                predicates.add(p1);
            }

            if (params.containsKey("gender")) {
                Predicate p2 = builder.equal(root.get("gender").as(String.class), params.get("gender"));
                predicates.add(p2);
            }

            if (params.containsKey("userType")) {
                Predicate p3 = builder.equal(root.get("userType").as(String.class), params.get("userType"));
                predicates.add(p3);
            }

            if (params.containsKey("active")) {
                int activeStt = Integer.parseInt(params.get("active"));
                Predicate p4 = builder.equal(root.get("active").as(Integer.class), activeStt);
                predicates.add(p4);
            }

            if (params.containsKey("address")) {
                Predicate p7 = builder.like(root.get("address").as(String.class),
                        String.format("%%%s%%", params.get("address").trim().toLowerCase()));
                predicates.add(p7);
            }

            if (params.containsKey("username")) {
                Predicate p8 = builder.like(root.get("username").as(String.class),
                        String.format("%%%s%%", params.get("username")));
                predicates.add(p8);
            }

            if (params.containsKey("phone")) {
                Predicate p9 = builder.like(root.get("phone").as(String.class),
                        String.format("%%%s%%", params.get("phone")));
                predicates.add(p9);
            }

            if (params.containsKey("email")) {
                Predicate p10 = builder.like(root.get("email").as(String.class),
                        String.format("%%%s%%", params.get("email")));
                predicates.add(p10);
            }

            if (params.containsKey("userType")) {
                Predicate p11 = builder.like(root.get("userType").as(String.class),
                        String.format("%%%s%%", params.get("userType")));
                predicates.add(p11);
            }

            q = q.where(predicates.toArray(new Predicate[]{}));
        }

        Query query = session.createQuery(q);

        if (page != 0) {
            int max = maxItemsInPage;
            query.setMaxResults(max);
            query.setFirstResult((page - 1) * max);
        }
        return query.getResultList();
    }

    @Override
    public List<Account> getByEmail(String email) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Account> query = builder.createQuery(Account.class);
        Root root = query.from(Account.class);
        query = query.select(root);

        if (!email.isEmpty()) {
            Predicate p = builder.equal(root.get("email").as(String.class), email.trim());
            query = query.where(p);
        }

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public List<Account> getByPhone(String phone) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Account> query = builder.createQuery(Account.class);
        Root root = query.from(Account.class);
        query = query.select(root);

        if (!phone.isEmpty()) {
            Predicate p = builder.equal(root.get("phone").as(String.class), phone.trim());
            query = query.where(p);
        }

        query = query.orderBy(builder.desc(root.get("id")));

        Query q = session.createQuery(query);

        return q.getResultList();
    }

    @Override
    public boolean delete(Account account) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(account);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From Account");

        return Long.parseLong(q.getSingleResult().toString());
    }

}
