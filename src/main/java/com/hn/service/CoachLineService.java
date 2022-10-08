package com.hn.service;

import com.hn.pojo.CoachLine;
import com.hn.pojo.CoachWay;
import com.hn.pojo.Comment;

import java.util.List;
import java.util.Map;

public interface CoachLineService {
    List<CoachLine> getCoachLines(Map<String, String> params, int page);
    int countCoachLine();

    boolean addOrUpdate(CoachLine coachLine);

    CoachLine getById(int id);

    boolean delete(CoachLine coachLine);
    List<Comment> getComments(int coachlineId);

}
