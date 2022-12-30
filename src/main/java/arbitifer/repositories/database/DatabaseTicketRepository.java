package arbitifer.repositories.database;

import java.util.List;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import org.jooq.DSLContext;

import arbitifer.models.TicketModel;
import arbitifer.repositories.TicketRepository;

import static arbitifer.datasource.database.Tables.TICKETS;

@ApplicationScoped
public class DatabaseTicketRepository implements TicketRepository {
    @Inject
    DSLContext dsl;

    @Override
    public List<TicketModel> getAllTickets() {
        return dsl.selectFrom(TICKETS).fetch().map(r -> 
            TicketModel.builder()
                .id(r.getId())
                .story(r.getStory())
                .build()
        );
    }

}
