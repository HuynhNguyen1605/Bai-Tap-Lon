package com.hn.service;


import com.hn.pojo.CoachLine;
import com.hn.pojo.Driver;

import java.util.List;
import java.util.Map;

public interface DriverService {

    Driver getById(int id);

    Driver GetByAccountId(int accountId);

    List<CoachLine> getCoachLineByDriver(int driverId, int page);

    List<CoachLine> getCoachLineByAccountDriver(int accountId, int page);

    boolean addOrUpdate(Driver driver);

    boolean deleteDriver(Driver driver);

    int count();

    List<Driver> findAll();
}
