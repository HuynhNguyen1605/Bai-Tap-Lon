package com.hn.service.impl;

import com.hn.pojo.Department;
import com.hn.repository.DepartmentRepository;
import com.hn.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;
    @Override
    public Department getById(int id) {
        return this.departmentRepository.getById(id);
    }

    @Override
    public boolean addOrUpdate(Department department) {
        return this.departmentRepository.addOrUpdate(department);
    }

    @Override
    public List<Department> getDepartments(Map<String, String> params, int page) {
        return this.departmentRepository.getDepartments(params,page);
    }

    @Override
    public boolean delete(Department department) {
        return this.departmentRepository.delete(department);
    }
}
