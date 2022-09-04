package arbitifer.api;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/tickets")
public class Ticket {
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<arbitifer.models.Ticket> all() {
        final var ticket = arbitifer.models.Ticket
            .builder()
            .id(1)
            .story("As a user, I want to see a list of all tickets, so I can see what to work on")
            .build()
        ;
        final var tickets = new ArrayList<arbitifer.models.Ticket>();
        tickets.add(ticket);
        return tickets;
    }
}
