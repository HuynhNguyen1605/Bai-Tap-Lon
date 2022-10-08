package com.hn.repository.impl;


import com.hn.pojo.CoachLine;
import com.hn.pojo.CoachWay;
import com.hn.pojo.Comment;
import com.hn.repository.CoachLineRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.core.env.Environment;

import javax.persistence.criteria.CriteriaQuery;

import org.hibernate.query.Query;

import javax.persistence.criteria.Predicate;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Root;
import java.util.*;

@Repository
@Transactional
public class CoachLineRepositoryImpl implements CoachLineRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Autowired
    private Environment env;

    @Override
    public List<CoachLine> getCoachLines(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<CoachLine> q = b.createQuery(CoachLine.class);
        Root root = q.from(CoachLine.class);
        q.select(root);

        if (params != null) {
            List<Predicate> predicates = new ArrayList<>();
            String kw = params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }

            String fp = params.get("fromPrice");
            if (fp != null) {
                Predicate p = b.greaterThanOrEqualTo(root.get("price").as(Long.class), Long.parseLong(fp));
                predicates.add(p);
            }

            String ndi = params.get("ngaydi");
            if (ndi != null) {
                Predicate p = b.lessThanOrEqualTo(root.get("departureDate").as(Date.class), Long.parseLong(ndi));
                predicates.add(p);
            }

            String nden = params.get("ngayden");
            if (ndi != null) {
                Predicate p = b.lessThanOrEqualTo(root.get("arrivalDate").as(Date.class), Long.parseLong(nden));
                predicates.add(p);
            }

            String ctrong = params.get("chotrong");
            if (ctrong != null) {
                Predicate p = b.equal(root.get("remainingSeats").as(Long.class), Long.parseLong(fp));
                predicates.add(p);
            }

            q.where(predicates.toArray(Predicate[]::new));
        }

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
    public int countCoachLine() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("SELECT COUNT(*) FROM CoachLine ");

        return Integer.parseInt(q.getSingleResult().toString());
    }

    @Override
    public CoachLine getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(CoachLine.class, id);
    }

    @Override
    public boolean addOrUpdate(CoachLine coachLine) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.save(coachLine);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(CoachLine coachLine) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(coachLine);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<Comment> getComments(int coachlineId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Comment> q = b.createQuery(Comment.class);
        Root root = q.from(CoachLine.class);
        q.select(root);

        q.where(b.equal(root.get("coachlineId"),coachlineId));

        Query query=session.createQuery(q);
        return query.getResultList();
    }
}
