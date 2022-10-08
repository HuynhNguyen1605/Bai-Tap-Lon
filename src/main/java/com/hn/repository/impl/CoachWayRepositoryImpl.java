package com.hn.repository.impl;

import com.hn.pojo.CoachWay;
import com.hn.repository.CoachWayRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
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
public class CoachWayRepositoryImpl implements CoachWayRepository {
    private final int maxItemsInPage = 10;

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public CoachWay getById(int id) {
        Session session=this.sessionFactory.getObject().getCurrentSession();
        return session.get(CoachWay.class,id);
    }

    @Override
    public boolean addOrUpdate(CoachWay coachWay) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (coachWay.getId() > 0)
                session.update(coachWay);
            else
                session.save(coachWay);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }


    @Override
    public CoachWay getByName(String name) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CoachWay> query = builder.createQuery(CoachWay.class);
        Root root = query.from(CoachWay.class);
        query = query.select(root);

        if (!name.isEmpty()) {
            Predicate p = builder.equal(root.get("name").as(String.class), name.trim());
            query = query.where(p);
        }

        Query q = session.createQuery(query);
        return (CoachWay) q.getResultList();
    }

    @Override
    public List<CoachWay> geCoachWays(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<CoachWay> q = b.createQuery(CoachWay.class);
        Root root = q.from(CoachWay.class);
        q.select(root);

        if(params!=null){
            List<Predicate> predicates = new ArrayList<>();
            String kw= params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("departurePoint").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }
            String kw1 = params.get("destinationPoint");
            if (kw1 != null) {
                Predicate p = b.like(root.get("destinationPoint").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }
            q.where(predicates.toArray(Predicate[]::new));

        }
        Query query = session.createQuery(q);



        return query.getResultList();
    }

    @Override
    public boolean delete(CoachWay coachWay) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(coachWay);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public long count() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery("Select Count(*) From CoachWay ");

        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    public int getMaxItemsInPage() {
        return maxItemsInPage;
    }

    @Override
    public List<CoachWay> findAll() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        Query q = session.createQuery(" From CoachWay ");
        return q.getResultList();
    }
}
