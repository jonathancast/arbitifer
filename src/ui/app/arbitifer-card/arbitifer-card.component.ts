import { Component, Input, OnInit } from '@angular/core';
import { Ticket } from 'app/ticket.model';

@Component({
  selector: 'arbitifer-card',
  templateUrl: './arbitifer-card.component.html',
  styleUrls: ['./arbitifer-card.component.scss']
})
export class ArbitiferCardComponent implements OnInit {
    @Input()
    public ticket! : Ticket;

    constructor() { }

    ngOnInit(): void {
    }
}
