package com.hn.repository;

import com.hn.pojo.Account;
import com.hn.pojo.Ticket;

import java.util.List;
import java.util.Map;

public interface TicketRepository {

    Ticket getById(int id);

    Ticket getBy2Key(int accountId, int coachLineId);

    boolean addOrUpdate(Ticket ticket);

    List<Ticket> getTickets(Map<String, String> params, int page, Integer customerId);

}
