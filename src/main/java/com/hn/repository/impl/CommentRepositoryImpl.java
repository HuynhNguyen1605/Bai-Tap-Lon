package com.hn.repository.impl;

import com.hn.pojo.Comment;
import com.hn.repository.CommentRepository;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CommentRepositoryImpl implements CommentRepository {
  @Autowired
  private LocalSessionFactoryBean sessionFactoryBean;
   @Override
    public Comment addComment(Comment comment) {
        Session session=this.sessionFactoryBean.getObject().getCurrentSession();
        try{
            session.save(comment);
            return comment;
        }catch (HibernateException ex){
            ex.printStackTrace();
       }
        return null;
    }
}
