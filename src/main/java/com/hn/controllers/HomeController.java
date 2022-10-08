/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hn.controllers;

import com.hn.pojo.Account;
import com.hn.pojo.CoachLine;
import com.hn.pojo.Customer;
import com.hn.pojo.Ticket;
import com.hn.service.AccountService;
import com.hn.service.CoachLineService;
import com.hn.service.CustomerService;
import com.hn.service.TicketService;
import com.hn.validator.AccountValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private AccountValidator accountValidator;

    @Autowired
    private AccountService accountService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private CoachLineService coachLineService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/")
    public String trangbatdau(Model model) {
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));
        return "trang-bat-dau";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        return "login";
    }

    @RequestMapping("/dat-ve")
    public String datVe(Model model) {
        List<CoachLine> coachLineList = coachLineService.getCoachLines(null, 0);

        model.addAttribute(coachLineList);
        return "dat-ve";
    }

    @RequestMapping("/gio-hang/{customerId}")
    public String giohang(@PathVariable Integer customerId, Model model) {
        List<Ticket> ticketList = ticketService.getTicketList(null, 0, customerId);
        Map<CoachLine, Integer> ticketWithAmount = TicketWithAmount(ticketList);
        model.addAttribute("ticketWithAmount",ticketWithAmount);
//        model.addAttribute(ticketList);
        return "gio-hang";
    }
    @GetMapping("/chi-tiet-tai-khoan")
    public String chitiettaikhoan(@RequestParam(name = "id", defaultValue = "0") int id,
                                  Model model) {

        Account account = accountService.getById(id);
        model.addAttribute("account", account);
        return "chi-tiet-tai-khoan";
    }

    @RequestMapping("/dang-ky")
    public String dangKy(Model model) {
        Account account = new Account();

        account.setId(0);
        account.setUserRole(Account.CUSTOMER);
        model.addAttribute("account", account);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "dang-ky";
    }

    @PostMapping("/dang-ky")
    public String dangKyPostMethod(Model model,
                                   @ModelAttribute(value = "account") Account account,
                                      BindingResult result,
                                   final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
        accountValidator.validate(account,result);
        if(result.hasErrors())
            return"dang-ky";
        account.setUserRole(Account.CUSTOMER);
        if (accountService.addOrUpdate(account)) {{
            Customer customer = new Customer();
            customer.setId(0);
            customer.setAccount(accountService.getById(account.getId()));
            customerService.addOrUpdate(customer);
            System.err.println("LUU THANH CONG");
            return "redirect:/";
        }
        }
        else
            System.err.println("LUU THAT BAI");
        errMsg = String.format("Thêm thông tin user '%s' không thành công", account.getUsername());
        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        return "dang-ky";
    }

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null)
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
    }

    public Map<CoachLine, Integer> TicketWithAmount(List<Ticket> tickets) {
        Map<CoachLine, Integer> result = new HashMap<>();

        for (Ticket ticket : tickets) {
            CoachLine coachLine = ticket.getCoachLine();
            if (result.containsKey(coachLine)) {
                Integer oldAmount = result.get(coachLine);
                Integer newAmount = oldAmount + 1;
                result.replace(coachLine, oldAmount, newAmount);
            } else {
                result.put(coachLine, 1);
            }
        }
        return result;
    }

    @RequestMapping("/trang-chu-dat-ve")
    public String homedatve(){
        return "trang-chu-dat-ve";
    }

    @RequestMapping("/gioi-thieu")
    public String gioithieu(){
        return "gioi-thieu";
    }

    @RequestMapping("/lien-he")
    public String lienhe(){
        return "lien-he";
    }

}
