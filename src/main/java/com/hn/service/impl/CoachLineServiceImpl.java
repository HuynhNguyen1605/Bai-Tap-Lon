package com.hn.service.impl;

import com.hn.pojo.CoachLine;
import com.hn.pojo.Comment;
import com.hn.pojo.Ticket;
import com.hn.repository.CoachLineRepository;
import com.hn.service.CoachLineService;
import com.hn.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class CoachLineServiceImpl implements CoachLineService {
    @Autowired
    private CoachLineRepository coachLineRepository;
    @Autowired
    TicketService ticketService;
    @Override
    public List<CoachLine> getCoachLines(Map<String, String> params, int page) {
        return this.coachLineRepository.getCoachLines(params, page);
    }

    @Override
    public int countCoachLine() {
        return this.coachLineRepository.countCoachLine();
    }

    @Override
    public boolean addOrUpdate(CoachLine coachLine) {
        return this.coachLineRepository.addOrUpdate(coachLine);
    }

    @Override
    public CoachLine getById(int id) {
        return this.coachLineRepository.getById(id);
    }

    @Override
    public boolean delete(CoachLine coachLine) {
        return this.coachLineRepository.delete(coachLine);
    }

    @Override
    public List<Comment> getComments(int coachlineId) {
        return this.coachLineRepository.getComments(coachlineId);
    }

    @Override
    public List<String> getBookedSeat(int coachlineId){
        List<String> bookedSeat = new ArrayList<>();
        List<Ticket> tickets = ticketService.findTicketByCoachLine(coachlineId);
        for (Ticket ticket : tickets) {
            if (ticket.getSeat() != null) {
                bookedSeat.add(ticket.getSeat());
            }
        }
        return bookedSeat;
    }
}
