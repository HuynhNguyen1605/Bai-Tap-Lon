package com.hn.service;

import com.hn.pojo.Account;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Map;

public interface AccountService extends UserDetailsService {

    Account getById(int id);

    List<Account> getAccounts(Map<String, String> params, int page);

    boolean addOrUpdate(Account user);

    Account getByUsername(String username);

    List<Account> getByRole(String role, int page, int active);

    List<Account> getUsers(String username, int page);

    List<Account> getUsersMultiCondition(Map<String, String> params, int page);

    List<Account> getByEmail(String email);

    List<Account> getByPhone(String phone);

    boolean delete(Account user);

    long count();

    int getMaxItemsInPage();

    int countAccount();

    boolean deleteAccount(Account account);
}
