package com.hn.repository;

import com.hn.pojo.CoachWay;

import java.util.List;
import java.util.Map;

public interface CoachWayRepository {
    CoachWay getById(int id);

    boolean addOrUpdate(CoachWay coachWay);

    CoachWay getByName(String name);

    List<CoachWay> geCoachWays(Map<String, String> params, int page);

    boolean delete(CoachWay coachWay);

    long count();

    int getMaxItemsInPage();

    List<CoachWay> findAll();

}
