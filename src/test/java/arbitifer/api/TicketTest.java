package arbitifer.api;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.mockito.Mockito.when;

import arbitifer.models.TicketModel;
import arbitifer.repositories.TicketRepository;

@ExtendWith(MockitoExtension.class)
class TicketTest {
    @InjectMocks
    private Ticket ticket;

    @Mock
    TicketRepository ticketRepository;

    @Test
    void testAll() {
        @SuppressWarnings("unused")
        final var expected = Arrays.asList(
            TicketModel.builder()
                .id(1)
                .story("As a user, I want to see a list of all tickets, so I can see what to work on")
                .build(),
            TicketModel.builder()
                .id(2)
                .story("As a user, I want the list of tickets to come from the database, so it's real")
                .build()
        );

        when(ticketRepository.getAllTickets()).thenReturn(expected);

        final var actual = ticket.all();

        assertEquals(expected, actual, "Got the right list of tickets");
    }
}
