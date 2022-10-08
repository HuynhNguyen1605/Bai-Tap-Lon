package com.hn.controllers;

import com.hn.pojo.Account;
import com.hn.pojo.CoachLine;
import com.hn.pojo.Driver;
import com.hn.service.AccountService;
import com.hn.service.CoachLineService;
import com.hn.service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/driver")
public class DriverController {

    @Autowired
    private CoachLineService coachLineService;

    @Autowired
    private DriverService driverService;

    @Autowired
    private AccountService accountService;
    @GetMapping ("")
    public String driverHome(@RequestParam(name = "driver_id", defaultValue = "0") int driver_id,
                             Model model){
        Account account = accountService.getById(driver_id);
        model.addAttribute("account", account);
        return "trang-chu-tai-xe";
    }

    @RequestMapping("/chuyen-di-tai-xe")
    public String chuyendi(@RequestParam(name = "account-id", defaultValue = "0") int accountId, Model model){
        List<CoachLine> coachLineByDriver = driverService.getCoachLineByAccountDriver(accountId, 0);

        model.addAttribute("coachLineByDriver", coachLineByDriver);
        return "chuyen-di-tai-xe";
    }
}
