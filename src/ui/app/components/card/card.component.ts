import { Component, Input, OnInit } from '@angular/core';
import { Ticket } from 'app/ticket.model';

@Component({
  selector: 'arbitifer-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.scss']
})
export class CardComponent implements OnInit {
    @Input()
    public ticket! : Ticket;

    constructor() { }

    ngOnInit(): void {
    }
}
