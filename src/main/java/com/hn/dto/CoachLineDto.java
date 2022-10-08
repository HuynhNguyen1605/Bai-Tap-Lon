package com.hn.dto;

import com.hn.pojo.CoachWay;
import com.hn.pojo.Driver;
import com.hn.pojo.Ticket;

import java.util.Collection;
import java.util.Date;

public class CoachLineDto {

    private Integer id;
    private String name;
    private Long price;
    private Date departureDate;
    private Date arrivalDate;
    private Integer remainingSeats;
    private Collection<Ticket> ticketCollection;
    private Integer coachwayId;
    private Integer driverId;
}
