package com.hn.repository;

import com.hn.pojo.CoachLine;
import com.hn.pojo.Driver;

import java.util.List;
import java.util.Map;

public interface DriverRepository {
    Driver getById(int id);

    List<CoachLine> getCoachLineByDriver(int driverId, int page);


    Driver getAccountId(int accountId);

    boolean addOrUpdate(Driver driver);

    boolean deleteDriver(Driver driver);

    int count();

    List<Driver> findAll();
}
