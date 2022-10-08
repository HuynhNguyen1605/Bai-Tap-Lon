package com.hn.repository;

import com.hn.pojo.Staff;

public interface StaffRepository {

    Staff getById(int id);

    Staff getByAccountId(int accountId);

    boolean addOrUpdate(Staff staff);

    boolean deleteStaff(Staff staff);

    int count();
}
