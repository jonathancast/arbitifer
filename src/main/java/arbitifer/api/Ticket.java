package arbitifer.api;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import arbitifer.models.TicketModel;
import arbitifer.repositories.TicketRepository;

@Path("/tickets")
public class Ticket {
    private final TicketRepository ticketRepository;

    public Ticket(TicketRepository ticketRepository) {
        this.ticketRepository = ticketRepository;
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<TicketModel> all() {
        return ticketRepository.getAllTickets();
    }
}
