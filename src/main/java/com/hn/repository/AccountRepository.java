package com.hn.repository;

import com.hn.pojo.Account;

import java.util.List;
import java.util.Map;

public interface AccountRepository {

    Account getById(int id);

    boolean addOrUpdate(Account user);

    Account getByUsername(String username);

    List<Account> getAccounts(Map<String, String> params, int page);

    List<Account> getByRole(String role, int page, int active);

    List<Account> getUsers(String username, int page);

    List<Account> getUsersMultiCondition(Map<String, String> params, int page);

    List<Account> getByEmail(String email);

    List<Account> getByPhone(String phone);

    boolean delete(Account user);

    long count();

    int getMaxItemsInPage();

}
