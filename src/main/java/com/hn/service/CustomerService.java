package com.hn.service;

import com.hn.pojo.Customer;

public interface CustomerService {

    Customer getById(int id);

    Customer getByAccountId(int accountId);

    boolean addOrUpdate(Customer customer);

    boolean deleteCustomer(Customer customer);


}
