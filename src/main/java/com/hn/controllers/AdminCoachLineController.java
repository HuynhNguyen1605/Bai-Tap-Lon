package com.hn.controllers;

import com.hn.dto.CoachLineDto;
import com.hn.pojo.Account;
import com.hn.pojo.CoachLine;
import com.hn.pojo.CoachWay;
import com.hn.pojo.Driver;
import com.hn.service.CoachLineService;
import com.hn.service.CoachWayService;
import com.hn.service.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class AdminCoachLineController {
    @Autowired
    private CoachLineService coachLineService;

    @Autowired
    private CoachWayService coachWayService;

    @Autowired
    private DriverService driverService;

    @RequestMapping("/admin/quan-ly-chuyen-xe")
    public String quanlychuyenxe(Model model) {
        List<CoachLine> coachLineList = coachLineService.getCoachLines(null, 0);
        model.addAttribute("coachLines",coachLineList);
        return "quan-ly-chuyen-xe";
    }

    @GetMapping("/admin/quan-ly-chuyen-xe/search")
    public String timChuyenXe(Model model, @RequestParam Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        List<CoachLine> coachLines = this.coachLineService.getCoachLines(params, page);
        model.addAttribute("coachLines", coachLines);
        System.out.println(coachLines);
        model.addAttribute("countCoachLine", this.coachLineService.countCoachLine());
        return "quan-ly-chuyen-xe";
    }

    @GetMapping("/admin/coach-line/add-or-update")
    public String addOrUpdateJobTypeView(Model model,
                                         @RequestParam(name = "id", defaultValue = "0") int id) {


        if (id > 0) {
            model.addAttribute("coachLine", this.coachLineService.getById(id));
        } else {
            model.addAttribute("coachLine", new CoachLine(0));
        }

        model.addAttribute("coachWays",coachWayService.findAll());
        model.addAttribute("drivers", driverService.findAll());

        model.addAttribute("errMsg", model.asMap().get("errMsg"));
        return "them-coach-line";
    }

    @PostMapping("/admin/coach-line/add-or-update")
    public String addOrUpdateJobType (Model model,
                                      @ModelAttribute("coachLine") CoachLine coachLine,
                                      BindingResult result,
                                      final RedirectAttributes redirectAttrs) {
        String errMsg = null;
        String sucMsg = null;
//

        CoachWay coachWay = coachWayService.getById(coachLine.getCoachWay().getId());
        Driver driver = driverService.getById(coachLine.getDriver().getId());

        coachLine.setCoachWay(coachWay);
        coachLine.setDriver(driver);
        coachLine.setName(coachWay.getDeparturePoint()+ " - " +coachWay.getDestinationPoint());
        if(coachLineService.addOrUpdate(coachLine)){
            System.err.println("LUU THANH CONG");
            return "redirect:/admin/quan-ly-chuyen-xe";
        }

        return "redirect:/admin/quan-ly-chuyen-xe";
    }

    @RequestMapping(path = "/admin/quan-ly-chuyen-xe/delete")
    @Transactional
    public String deleteCoachLineById(Model model,
                                      @RequestParam (name = "id",defaultValue = "0") int id,
                                      final RedirectAttributes redirectAttrs){
        String errMsg = null;
        String sucMsg = null;
        CoachLine coachLine= new CoachLine();
        if(id>0){
            coachLine=this.coachLineService.getById(id);
            boolean deleteCheck=coachLineService.delete(coachLine);
            if(coachLine!=null&&deleteCheck){
                sucMsg= String.format("Xoá thành công chuyến xe '%s'",coachLine.getName());
            }else {
                assert coachLine!=null;
                errMsg= String.format("Xoá không thành công chuyến xe '%s'",coachLine.getName());
            }
                errMsg= String.format("Xoá không thành công chuyến xe '%s'",coachLine.getName());
            redirectAttrs.addFlashAttribute("errMsg", errMsg);
            redirectAttrs.addFlashAttribute("sucMsg", sucMsg);
        }
        return "redirect:/admin/quan-ly-chuyen-xe";
    }

}
