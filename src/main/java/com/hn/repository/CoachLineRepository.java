package com.hn.repository;

import com.hn.pojo.Account;
import com.hn.pojo.CoachLine;
import com.hn.pojo.Comment;

import java.util.List;
import java.util.Map;

public interface CoachLineRepository {
    List<CoachLine> getCoachLines(Map<String, String> params, int page);

    CoachLine getById(int id);

    boolean addOrUpdate(CoachLine coachLine);

    boolean delete(CoachLine coachLine);

    List<Comment> getComments(int coachlineId);

    int countCoachLine();
}
