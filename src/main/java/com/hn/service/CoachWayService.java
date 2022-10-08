package com.hn.service;

import com.hn.pojo.CoachWay;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CoachWayService {

    CoachWay getById(int id);

    boolean addOrUpdate(CoachWay coachWay);

    CoachWay getByName(String name);

    List<CoachWay> geCoachWays(Map<String, String> params, int page);

    boolean delete(CoachWay coachWay);

    long count();

    int getMaxItemsInPage();

    List<CoachWay> findAll();
}
