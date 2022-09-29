import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ticketsURL } from 'app/api';

import { Ticket } from 'app/ticket.model';

@Component({
  selector: 'app-tickets',
  templateUrl: './tickets.component.html',
  styleUrls: ['./tickets.component.scss']
})
export class TicketsComponent implements OnInit {
    public tickets! : Ticket[];

    constructor(httpClient : HttpClient) {
        httpClient.get<Ticket[]>(ticketsURL).subscribe(tickets => {
            this.tickets = tickets;
        });
    }

    ngOnInit(): void {
    }
}
