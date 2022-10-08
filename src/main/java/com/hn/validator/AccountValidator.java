package com.hn.validator;

import com.hn.pojo.Account;
import com.hn.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class AccountValidator implements Validator {

    @Autowired
    private AccountService accountService;
    @Override
    public boolean supports(Class<?> aClass) {
        return Account.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Account account=(Account) target;
        int usernameMinLength = 6;
        int usernameMaxLength = 20;
        int passwordMinLength = 8;

        // validate username
        if (accountService.getUsers(account.getUsername(), 0).size() > 0)
            errors.rejectValue("username", "", "Tên đăng nhập đã tồn tại");

        if (account.getUsername().contains(" "))
            errors.rejectValue("username", "", "Tên đăng nhập không có khoảng trắng");

        if (account.getUsername().length() < usernameMinLength)
            errors.rejectValue("username", "", "Tên đăng nhập không ít hơn " + usernameMinLength + " ký tự");

        if (account.getUsername().length() > usernameMaxLength)
            errors.rejectValue("username", "", "Tên đăng nhập không quá " + usernameMaxLength + " ký tự");
//matkhau


        if (account.getPassword().contains(" "))
            errors.rejectValue("password", "", "Mật khẩu không chứa khoảng trắng");

        if (account.getPassword().length() < passwordMinLength)
            errors.rejectValue("password", "", "Mật khẩu cần có tối thiểu " + passwordMinLength + " ký tự");

        // email
        if (accountService.getByEmail(account.getEmail()).size() > 0)
            errors.rejectValue("email", "", "Email đang bỏ trống hoặc đã tồn tại");

        // sdt
        if (accountService.getByPhone(account.getPhone()).size() > 0)
            errors.rejectValue("phone", "", "Số điện thoại bị bỏ trống hoặc đã tồn tại");





    }
}
