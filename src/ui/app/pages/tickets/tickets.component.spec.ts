import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HttpClientTestingModule, HttpTestingController, } from '@angular/common/http/testing';

import { TicketsComponent } from './tickets.component';
import { CardComponent } from 'app/components/card/card.component';

import { ticketsURL } from 'app/api';

describe('TicketsComponent', () => {
    let component: TicketsComponent;
    let fixture: ComponentFixture<TicketsComponent>;

    const tickets = [
        { id: 1, story: "As a user, I want to see a list of all tickets, so I can see what to work on", },
    ];

    beforeEach(async () => {
        await TestBed.configureTestingModule({
            declarations: [ CardComponent, TicketsComponent, ],
            providers: [],
            imports: [HttpClientTestingModule],
        })
        .compileComponents();

        fixture = TestBed.createComponent(TicketsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });

    it('should retreive tickets from the server', () => {
        TestBed.inject(HttpTestingController)
            .expectOne(ticketsURL)
            .flush(tickets)
        ;

        expect(component.tickets).toEqual(tickets);
    })
});
