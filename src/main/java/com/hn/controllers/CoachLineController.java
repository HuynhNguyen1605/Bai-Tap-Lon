package com.hn.controllers;

import com.hn.dto.Seat;
import com.hn.pojo.CoachLine;
import com.hn.service.CoachLineService;
import com.hn.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CoachLineController {

    @Autowired
    private CoachLineService coachLineService;

    @Autowired
    private TicketService ticketService;
    @GetMapping("/coach-line")
    public String chitietchuyendi(@RequestParam(name = "id", defaultValue = "0") int id,
                                  Model model) {

        CoachLine coachLine = coachLineService.getById(id);
//        List<String> bookedSeat = coachLineService.getBookedSeat(coachLine.getId());
        model.addAttribute("seats", getSeats());
        model.addAttribute("coachLine", coachLine);
//        model.addAttribute("bookedSeat",bookedSeat);
        return "chi-tiet-chuyen-di";
    }

    List<String> getSeats() {
        List<String> seats = new ArrayList<>();
        for (Seat seat : Seat.values()) {
            seats.add(seat.getSeat());
        }
        return seats;
    }

}
