package com.hn.repository.impl;

import com.hn.pojo.Account;
import com.hn.pojo.Customer;
import com.hn.pojo.Ticket;
import com.hn.repository.AccountRepository;
import com.hn.repository.CustomerRepository;
import com.hn.repository.TicketRepository;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@Transactional
public class TicketRepositoryImpl implements TicketRepository {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private AccountRepository accountRepository;
    @Override
    public Ticket getById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        return session.get(Ticket.class, id);
    }

    @Override
    public Ticket getBy2Key(int accountId, int coachLineId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Ticket> query = builder.createQuery(Ticket.class);
        Root root = query.from(Ticket.class);
        query = query.select(root);

        Predicate p1 = builder.equal(root.join("customer").join("account").get("id").as(Integer.class), accountId);
        Predicate p2 = builder.equal(root.join("coachLine").get("id").as(Integer.class), coachLineId);

        query = query.where(p1, p2);

        Query q = session.createQuery(query);

        return (Ticket) q.getSingleResult();
    }

    @Override
    public boolean addOrUpdate(Ticket ticket) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try {
            if (ticket.getId() > 0)
                session.update(ticket);
            else
                session.save(ticket);
            return true;
        } catch (HibernateException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    @Override
     public List<Ticket> getTickets(Map<String, String> params, int page, Integer customerId){
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder b = session.getCriteriaBuilder();
            CriteriaQuery<Ticket> q = b.createQuery(Ticket.class);
            Root root = q.from(Ticket.class);
        q.select(root);
        List<Predicate> predicates = new ArrayList<>();

        if (customerId != null && !customerId.equals(0)) {
            Account account = accountRepository.getById(customerId);
            Customer customer = customerRepository.getByAccountId(account.getId());
            Predicate p = b.equal(root.get("customer").as(Customer.class), customer);
            predicates.add(p);
        }

        if (params != null) {
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

            String sl = params.get("soluong");
            if (sl != null) {
                Predicate p = b.equal(root.get("amount").as(Long.class), Long.parseLong(sl));
                predicates.add(p);
            }

            String tt = params.get("thanhtien");
            if (tt != null) {
                Predicate p = b.equal(root.get("total_price").as(Long.class), Long.parseLong(tt));
                predicates.add(p);
            }
        }
        q.where(predicates.toArray(Predicate[]::new));

        Query query = session.createQuery(q);
        if (page > 0) {
            int size = 0;
            int start = (page - 1) * size;
            query.setFirstResult(start);
            query.setMaxResults(size);

        }
        return query.getResultList();
     }

     @Override
    public List<Ticket> findTicketByCoachline(int coachlineId){
         Session session = this.sessionFactory.getObject().getCurrentSession();
         javax.persistence.Query q = session.createQuery("From Ticket t where t.coachLine.id = : coachlineId");
         q.setParameter("coachlineId", coachlineId);

         return q.getResultList();
    }
}
