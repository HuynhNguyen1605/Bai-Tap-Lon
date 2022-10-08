package com.hn.service.impl;

import com.hn.pojo.CoachWay;
import com.hn.repository.CoachWayRepository;
import com.hn.service.CoachWayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CoachWayServiceImpl implements CoachWayService {
    @Autowired
    private CoachWayRepository coachWayRepository;
    @Override
    public CoachWay getById(int id) {
        return this.coachWayRepository.getById(id);
    }

    @Override
    public boolean addOrUpdate(CoachWay coachWay) {
        return this.coachWayRepository.addOrUpdate(coachWay);
    }

    @Override
    public CoachWay getByName(String name) {
        return this.coachWayRepository.getByName(name);
    }

    @Override
    public List<CoachWay> geCoachWays(Map<String, String> params, int page) {
        return this.coachWayRepository.geCoachWays(params,page);
    }

    @Override
    public boolean delete(CoachWay coachWay) {
        return this.coachWayRepository.delete(coachWay);
    }

    @Override
    public long count() {
        return this.coachWayRepository.count();
    }

    @Override
    public int getMaxItemsInPage() {
        return this.getMaxItemsInPage();
    }

    @Override
    public List<CoachWay> findAll() {
        return this.coachWayRepository.findAll();
    }
}
