package com.hn.repository.impl;

import com.hn.pojo.CoachLine;
import com.hn.pojo.CoachWay;
import com.hn.pojo.Department;
import com.hn.pojo.Driver;
import com.hn.repository.DepartmentRepository;
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
public class DepartmentRepositoryImpl implements DepartmentRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public Department getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Department.class, id);
    }

    @Override
    public boolean addOrUpdate(Department department) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (department.getId() > 0)
                session.update(department);
            else
                session.save(department);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Department> getDepartments(Map<String, String> params, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
        CriteriaQuery<Department> q = b.createQuery(Department.class);
        Root root = q.from(Department.class);
        q.select(root);

        if(params!=null){
            List<Predicate> predicates = new ArrayList<>();
            String kw= params.get("kw");
            if (kw != null && !kw.isEmpty()) {
                Predicate p = b.like(root.get("name").as(String.class), String.format("%%%s%%", kw));
                predicates.add(p);
            }
            q.where(predicates.toArray(Predicate[]::new));
        }
        Query query = session.createQuery(q);
        return query.getResultList();
    }

    @Override
    public boolean delete(Department department) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            session.delete(department);
            return true;
        } catch (HibernateException ex) {
            System.err.println(ex.getMessage());
        }
        return false;
    }
}
