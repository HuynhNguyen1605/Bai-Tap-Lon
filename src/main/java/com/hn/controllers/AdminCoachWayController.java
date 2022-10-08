package com.hn.controllers;

import com.hn.pojo.Account;
import com.hn.pojo.CoachLine;
import com.hn.pojo.CoachWay;
import com.hn.service.CoachWayService;
import org.springframework.beans.factory.annotation.Autowired;
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
public class AdminCoachWayController {
    @Autowired
    private CoachWayService coachWayService;

    @RequestMapping("/admin/quan-ly-hanh-trinh")
    public String quanlychuyenxe(Model model) {
        List<CoachWay> coachWayList = coachWayService.geCoachWays(null, 0);

        model.addAttribute("coachWays", coachWayList);
        return "quan-ly-hanh-trinh";
    }

    @GetMapping("/admin/coach-way/add-or-update")
    public String addCoachWay(Model model, @RequestParam(name = "id", defaultValue = "0") int id) {
        CoachWay coachWay = null;
        if (id != 0) {
            coachWay = coachWayService.getById(id);
        } else {
            coachWay = new CoachWay();
        }
        model.addAttribute("coachWay", coachWay);
//        if(id>0){
//            model.addAttribute("coachWay",this.coachWayService.getById(id));
//        }else {
//            model.addAttribute("coachWay",new CoachWay());
//        }


        return "them-coach-way";
    }

    @PostMapping("/admin/coach-way/add-or-update")
    public String addOrUpdateCoachWay(Model model,
                                      @ModelAttribute(value = "coachWay") @Valid CoachWay coachWay,
                                      BindingResult result,
                                      final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
//
//        if (coachWay.getId() == 0) {
//            coachWay.setId(0);
//        }
        if (coachWayService.addOrUpdate(coachWay)) {
            System.err.println("LUU THANH CONG");
            return "redirect:/admin/quan-ly-hanh-trinh";
        }

        return "redirect:/admin/quan-ly-chuyen-di";
    }

//    @PostMapping("/admin/coach-way/add-or-update")
//    public String addOrUpdateCoachWay(Model model, @ModelAttribute(value = "coachWay")@Valid CoachWay coachWay,
//                               BindingResult result,
//                               final  RedirectAttributes redirectAttrs){
//        if(coachWay.getId()==0){
//            return "them-coach-way";
//
//        }
//        int rawId= coachWay.getId();
//        boolean addOrUpdateCheck=this.coachWayService.addOrUpdate(coachWay);
//        if(addOrUpdateCheck){
//            if(rawId==0){
//                CoachWay coachWayadd= new CoachWay();
//                coachWayadd.setId(0);
//                coachWayService.addOrUpdate(coachWay);
//            }else {
//                System.out.println("Sua thanh cong");
//                return "/admin/quan-ly-hanh-trinh";
//            }
//        }
//        return "them-coach-way";
//    }

    @RequestMapping(path = "/admin/coach-way/delete")
    @Transactional
    public String deleteCoachWay(Model model,
                                 @RequestParam(name = "id", defaultValue = "0") int id,
                                 final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
        CoachWay coachWay = new CoachWay();

        if (id > 0) {
            coachWay = this.coachWayService.getById(id);
            boolean deleteCheck = coachWayService.delete(coachWay);
            if (coachWay != null && deleteCheck) {
                sucMsg = String.format("Xoá thành công hành trình '%s'", coachWay.getDeparturePoint() + " - " + coachWay.getDestinationPoint());
            } else {
                assert coachWay != null;
                errMsg = String.format("Xoá thành công hành trình '%s'", coachWay.getDeparturePoint() + " - " + coachWay.getDestinationPoint());
            }
        } else {
            errMsg = String.format("Xoá thành công hành trình '%s'", coachWay.getDeparturePoint() + " - " + coachWay.getDestinationPoint());
        }
        redirectAttrs.addFlashAttribute("errMsg", errMsg);
        redirectAttrs.addFlashAttribute("sucMsg", sucMsg);

        return "redirect:/admin/quan-ly-hanh-trinh";
//
    }


}
