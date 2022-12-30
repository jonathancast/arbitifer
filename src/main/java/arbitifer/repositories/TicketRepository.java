package arbitifer.repositories;

import java.util.List;

import arbitifer.models.TicketModel;

public interface TicketRepository {
    List<TicketModel> getAllTickets();
}
