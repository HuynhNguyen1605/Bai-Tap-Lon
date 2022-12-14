package com.hn.controllers;

import com.hn.pojo.*;
import com.hn.service.*;
import com.hn.validator.AccountValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AccountController {

    @Autowired
    private AccountService accountService;


    @Autowired
    private CoachLineService coachLineService;
    //sang
    @Autowired
    private CustomerService customerService;
    @Autowired
    private StaffService staffService;

    @Autowired
    private Environment env;
    @Autowired
    private DriverService driverServices;

    @Autowired
    private AccountValidator accountValidator;

    @RequestMapping("")
    public String adminHome() {
        return "trang-chu-admin";
    }


//    @RequestMapping("/sua-tai-khoan")
//    public String suataikhoan(Model model) {
//        return "sua-tai-khoan";
//    }

    @RequestMapping("/quan-ly-tai-khoan")
    public String quanlytaikhoan(Model model) {
        List<Account> accountList = accountService.getAccounts(null, 0);

        model.addAttribute("accounts", accountList);
        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        model.addAttribute("sucMsg", model.asMap().get("sucMsg"));

        return "quan-ly-tai-khoan";
    }

    @GetMapping("/quan-ly-tai-khoan/search")
    public String timve(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        List<Account> accounts = this.accountService.getAccounts(params, page);
        model.addAttribute("accounts", accounts);
        System.out.println(accounts);
        model.addAttribute("countAccount", this.accountService.count());
        return "quan-ly-tai-khoan";
    }

    //    @RequestMapping("/quan-ly-chuyen-xe")
//    public String quanlychuyenxe(Model model) {
//        List<CoachLine> coachLineList = coachLineService.getCoachLines(null, 0);
//
//        model.addAttribute(coachLineList);
//        return "quan-ly-chuyen-xe";
//    }
    @RequestMapping(path = "/quan-ly-tai-khoan/delete")
    @Transactional
    public String deleteAccountById(Model model,
                                    @RequestParam(name = "id", defaultValue = "0") int id,
                                    final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
        Account account = new Account();

        if (id > 0) {
            account = this.accountService.getById(id);

            boolean deleteCheck = accountService.deleteAccount(account);
            if (account != null && deleteCheck) {
                sucMsg = String.format("Xo?? th??nh c??ng account '%s'", account.getUsername());
            } else {
                assert account != null;
                errMsg = String.format("Xo?? kh??ng th??nh c??ng account '%s'", account.getUsername());
            }
        } else {
            errMsg = String.format("Xo?? kh??ng th??nh c??ng user '%s'", account.getUsername());
        }
        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);

        return "redirect:/admin/quan-ly-tai-khoan";
//
    }

    @GetMapping("/add-or-update")
    public String addOrUpdateAccountView(Model model,
                                         @RequestParam(name = "id", defaultValue = "0") int id) {
        if (id != 0)
            model.addAttribute("accounts", this.accountService.getById(id));
        else
            model.addAttribute("accounts", new Account(0));
        model.addAttribute("errMsg", model.asMap().get("errMsg"));

        return "sua-tai-khoan";
    }

    @PostMapping("/add-or-update")
    public String addOrUpdateAccount(Model model,
                                     @ModelAttribute(value = "accounts") @Valid Account account,
                                     BindingResult result,
                                     final RedirectAttributes redirectAttrs) {

        String errMsg = null;
        String sucMsg = null;
        if (account.getId() == 0) {
            accountValidator.validate(account, result);
            if(result.hasErrors())
                return "sua-tai-khoan";
        }


        int rawID = account.getId();
        boolean addOrUpdateCheck = this.accountService.addOrUpdate(account);
        if (addOrUpdateCheck) {
            if (rawID == 0) {
                switch (account.getUserRole()) {
                    case Account.CUSTOMER:
                        Customer customer = new Customer();
                        customer.setId(0);
                        customer.setAccount(accountService.getById(account.getId()));
                        customerService.addOrUpdate(customer);
                        System.out.println("them cus thanh cong");
                        sucMsg = ("Th??m th??ng tin kh??ch h??ng '%s' th??nh c??ng");
                        break;
                    case Account.DRIVER:
                        Driver driver = new Driver();
                        driver.setId(0);
                        driver.setAccount(accountService.getById(account.getId()));
                        driverServices.addOrUpdate(driver);
                        System.out.println("them driver thanh cong");
                        sucMsg = String.format("Th??m th??ng tin t??i x??? '%s' th??nh c??ng", account.getUsername());
                        break;
                    case Account.STAFF:
                        Staff staff = new Staff();
                        staff.setId(0);
                        staff.setAccount(accountService.getById(account.getId()));
                        staffService.addOrUpdate(staff);
                        System.out.println("them staff thanh cong");
                        sucMsg = String.format("Th??m th??ng tin nh??n vi??n '%s' th??nh c??ng", account.getUsername());
                        break;
                    default:
                        sucMsg = String.format("S???a th??ng tin t??i kho???n '%s' th??nh c??ng", account.getUsername());
                        break;
                }
            }
        } else {
            errMsg = "Th??m th??ng tin t??i kho???n kh??ng th??nh c??ng";
        }
        model.addAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        return "redirect:/admin/quan-ly-tai-khoan";
    }
}
