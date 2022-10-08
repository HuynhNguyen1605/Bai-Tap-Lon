package com.hn.service.impl;

import com.hn.pojo.Staff;
import com.hn.repository.StaffRepository;
import com.hn.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffRepository staffRepository;

    @Override
    public Staff getById(int id) {
        return this.staffRepository.getById(id);
    }

    @Override
    public Staff getByAccountId(int accountId) {
        return this.staffRepository.getByAccountId(accountId);
    }

    @Override
    public boolean addOrUpdate(Staff staff) {
        return this.staffRepository.addOrUpdate(staff);
    }

    @Override
    public boolean deleteStaff(Staff staff) {
        return this.staffRepository.deleteStaff(staff);
    }

    @Override
    public int count() {
        return this.staffRepository.count();
    }
}
