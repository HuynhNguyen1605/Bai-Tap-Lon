package com.hn.service;

import com.hn.pojo.Comment;

public interface CommentService {
    Comment addComment(String content,int accountId, int coachlineId);

}
