package com.hn.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.hn.handlers.LoginHandler;
import com.hn.handlers.LogoutHandler;
import com.hn.handlers.MyAccessDenied;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
        "com.hn.service",
        "com.hn.repository",
        "com.hn.controllers",
        "com.hn.handlers",
        "com.hn.validator"

})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private LoginHandler loginHandler;
    @Autowired
    private LogoutHandler logoutHandler;
    @Autowired
    private MyAccessDenied accessDenied;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "huynhnguyen",
                "api_key", "251592436659376",
                "api_secret", "MXWW6Xk4krA9xwfn02ruVPmc01o",
                "secure", true
        ));

        return c;
    }

//    @Bean
//    public JavaMailSender configureJavaMailSender(){
//        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//
//        mailSender.setHost("smtp.gmail.com");
//        mailSender.setUsername("");
////        mailSender.setPassword("");
//        mailSender.setPassword("");
//
//        mailSender.setPort(587);
//
//        Properties mailProperties = new Properties();
//        mailProperties.put("mail.smtp.starttls.enable", "true");
//        mailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
//        mailProperties.put("mail.smtp.auth", "true");
//        mailProperties.put("mail.debug", "true");
//        mailProperties.put("mail.transport,protocol", "smtp");
//
//        mailSender.setJavaMailProperties(mailProperties);
//
//        return mailSender;
//    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().permitAll()
                .loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");

        http.formLogin().successHandler(this.loginHandler)
                .failureUrl("/login?error");

        http.logout().logoutSuccessHandler(this.logoutHandler);

        http.exceptionHandling().accessDeniedHandler(this.accessDenied);

        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/admin/**").access("hasAuthority('admin')")
                .antMatchers("/driver/**").access("hasAuthority('driver')")
                .antMatchers("/customer/**").access("hasAuthority('customer')")
                .antMatchers("/staff/**").access("hasAuthority('staff')");

        http.csrf().disable();
    }

}

