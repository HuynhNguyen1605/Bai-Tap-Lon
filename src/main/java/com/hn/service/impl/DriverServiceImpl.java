package com.hn.service.impl;

import com.hn.pojo.CoachLine;
import com.hn.pojo.Driver;
import com.hn.repository.DriverRepository;
import com.hn.service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DriverServiceImpl implements DriverService {

    @Autowired
    public DriverRepository driverRepository;
    @Override
    public Driver getById(int id) {
        return this.driverRepository.getById(id);
    }

    @Override
    public Driver GetByAccountId(int accountId) {
        return this.driverRepository.getAccountId(accountId);
    }

    @Override
    public List<CoachLine> getCoachLineByDriver(int driverId, int page) {
        return this.driverRepository.getCoachLineByDriver(driverId, page);
    }

    @Override
    public List<CoachLine> getCoachLineByAccountDriver(int accountId, int page) {
        return this.driverRepository.getCoachLineByDriver(this.driverRepository.getAccountId(accountId).getId(), 0);
    }

    @Override
    public boolean addOrUpdate(Driver driver) {
        return this.driverRepository.addOrUpdate(driver);
    }

    @Override
    public boolean deleteDriver(Driver driver) {
        return this.driverRepository.deleteDriver(driver);
    }

    @Override
    public int count() {
        return this.driverRepository.count();
    }

    @Override
    public List<Driver> findAll() {
        return this.driverRepository.findAll();
    }
}
