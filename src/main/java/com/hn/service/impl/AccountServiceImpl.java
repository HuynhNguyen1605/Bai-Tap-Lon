package com.hn.service.impl;

import com.cloudinary.utils.ObjectUtils;
import com.hn.pojo.Account;
import com.hn.repository.AccountRepository;
import com.hn.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.cloudinary.Cloudinary;

import java.io.IOException;
import java.util.*;

@Service("userDetailsService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public Account getById(int id) {
        return this.accountRepository.getById(id);
    }

    @Override
    public List<Account> getAccounts(Map<String, String> params, int page) {
        return this.accountRepository.getAccounts(params,page);
    }

    @Override
    public boolean addOrUpdate(Account account) {
        String pass = account.getPassword();
        account.setPassword(this.passwordEncoder.encode(pass));

        String avatar = account.getAvatar();

        if (!account.getFile().isEmpty()) {
            Map r = null;
            try {
                r = this.cloudinary.uploader().upload(account.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (r != null)
                account.setAvatar((String) r.get("secure_url"));
            else
                account.setAvatar(avatar);
        }

        return this.accountRepository.addOrUpdate(account);
    }

    @Override
    public Account getByUsername(String username) {
        return this.accountRepository.getByUsername(username);
    }

    @Override
    public List<Account> getUsers(String username, int page) {
        return this.accountRepository.getUsers(username, page);
    }

    @Override
    public List<Account> getUsersMultiCondition(Map<String, String> params, int page) {
        return this.accountRepository.getUsersMultiCondition(params, page);
    }

    @Override
    public List<Account> getByEmail(String email) {
        return this.accountRepository.getByEmail(email);
    }

    @Override
    public List<Account> getByPhone(String phone) {
        return this.accountRepository.getByPhone(phone);
    }

    @Override
    public boolean delete(Account account) {
        return this.accountRepository.delete(account);
    }

    @Override
    public long count() {
        return this.accountRepository.count();
    }

    @Override
    public int getMaxItemsInPage() {
        return this.accountRepository.getMaxItemsInPage();
    }

    @Override
    public int countAccount() {
        return 0;
    }

    @Override
    public boolean deleteAccount(Account account) {
        return this.accountRepository.delete(account);
    }

    @Override
    public List<Account> getByRole(String role, int page, int active) {
        return this.accountRepository.getByRole(role, page, active);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<Account> accounts = this.getUsers(username, 0);
        if (accounts.isEmpty())
            throw new UsernameNotFoundException("User does not exist!!!");

        Account account = accounts.get(0);

        Set<GrantedAuthority> auth = new HashSet<>();
        auth.add(new SimpleGrantedAuthority(account.getUserRole()));

        return new org.springframework.security.core
                .userdetails.User(account.getUsername(), account.getPassword(), auth);
    }

}
