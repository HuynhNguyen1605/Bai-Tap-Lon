package com.hn.service;

import com.hn.pojo.Ticket;

import java.util.List;
import java.util.Map;

public interface TicketService {

    Ticket getById(int id);

    Ticket getBy2Key(int accountId, int coachLineId);

    boolean addOrUpdate(Ticket ticket);

    List<Ticket> getTicketList(Map<String, String> params, int page, Integer customerId);

}
