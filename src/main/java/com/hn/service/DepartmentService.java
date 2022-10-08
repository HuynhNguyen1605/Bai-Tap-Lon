package com.hn.service;

import com.hn.pojo.Department;

import java.util.List;
import java.util.Map;

public interface DepartmentService {

    Department getById(int id);

    boolean addOrUpdate(Department department);

    List<Department> getDepartments(Map<String, String> params, int page);

    boolean delete(Department department);
}
