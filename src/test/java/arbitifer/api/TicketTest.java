package arbitifer.api;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class TicketTest {
    @InjectMocks
    private Ticket ticket;

    @Test
    void testAll() {
        final var tickets = ticket.all();

        assertEquals(1, tickets.size(), "Got right number of tickets");
        assertEquals(1, tickets.get(0).getId(), "This ticket has the right id");
        assertEquals(
            "As a user, I want to see a list of all tickets, so I can see what to work on",
            tickets.get(0).getStory(),
            "This ticket has the right story"
        );
    }
}
