/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hn.handlers;

import com.hn.pojo.Account;
import com.hn.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * @author
 */
@Component
public class LoginHandler implements AuthenticationSuccessHandler {
    @Autowired
    private AccountService userDetailsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response, Authentication a) throws IOException, ServletException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Account account = this.userDetailsService.getByUsername(authentication.getName());
        request.getSession().setAttribute("currentUser", account);
        System.out.println("LOGIN SUCCESSFUL");
        String redirectUrl = request.getContextPath();
        switch (account.getUserRole()) {
            case Account.ADMIN:
                redirectUrl = "admin";
                break;
            case Account.DRIVER:
                redirectUrl = "driver";
                break;
            case Account.CUSTOMER:
                redirectUrl = "customer";
                break;
            case Account.STAFF:
                redirectUrl = "staff";
                break;
        }

        response.sendRedirect(redirectUrl);
    }

}
