package arbitifer.models;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TicketModel {
    private final int id;
    private final String story;
}
