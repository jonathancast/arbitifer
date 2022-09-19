import { Component, OnInit } from '@angular/core';

import { Ticket } from 'app/ticket.model';

@Component({
  selector: 'app-tickets',
  templateUrl: './tickets.component.html',
  styleUrls: ['./tickets.component.scss']
})
export class TicketsComponent implements OnInit {
    public tickets : Ticket[];

    constructor() {
        this.tickets = [
            { id: 1, story: "As a user, I want to see a list of all tickets, so I can see what to work on", },
        ];
    }

    ngOnInit(): void {
    }
}
