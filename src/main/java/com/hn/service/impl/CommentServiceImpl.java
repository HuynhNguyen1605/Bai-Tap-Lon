package com.hn.service.impl;

import com.hn.pojo.Account;
import com.hn.pojo.CoachLine;
import com.hn.pojo.Comment;
import com.hn.repository.CommentRepository;
import com.hn.service.AccountService;
import com.hn.service.CoachLineService;
import com.hn.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private CoachLineService coachLineService;
    @Autowired
    private AccountService accountService;

    @Override
    public Comment addComment(String content, int accountId, int coachlineId) {
        Account account=this.accountService.getById(accountId);
        CoachLine coachLine=this.coachLineService.getById(coachlineId);

        Comment comment=new Comment();
        comment.setContent(content);
        comment.setAccount(account);
        comment.setCoachLine(coachLine);
        comment.setCreatedDate(new Date());

        return this.commentRepository.addComment(comment);
    }
}
