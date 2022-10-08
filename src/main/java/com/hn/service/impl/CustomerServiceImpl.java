package com.hn.service.impl;

import com.hn.pojo.Customer;
import com.hn.repository.CustomerRepository;
import com.hn.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customer getById(int id) {
        return this.customerRepository.getById(id);
    }

    @Override
    public Customer getByAccountId(int accountId) {
        return this.customerRepository.getByAccountId(accountId);
    }

    @Override
    public boolean addOrUpdate(Customer customer) {
        return this.customerRepository.addOrUpdate(customer);
    }

    @Override
    public boolean deleteCustomer(Customer customer) {
        return this.customerRepository.deleteCustomer(customer);
    }
}
