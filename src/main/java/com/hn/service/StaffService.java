package com.hn.service;

import com.hn.pojo.Staff;

public interface StaffService {

    Staff getById(int id);

    Staff getByAccountId(int accountId);

    boolean addOrUpdate(Staff staff);

    boolean deleteStaff(Staff staff);

    int count();
}
