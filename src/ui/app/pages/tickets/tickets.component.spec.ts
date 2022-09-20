import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TicketsComponent } from './tickets.component';
import { CardComponent } from 'app/components/card/card.component';

describe('TicketsComponent', () => {
    let component: TicketsComponent;
    let fixture: ComponentFixture<TicketsComponent>;

    beforeEach(async () => {
        await TestBed.configureTestingModule({
            declarations: [ CardComponent, TicketsComponent, ]
        })
        .compileComponents();

        fixture = TestBed.createComponent(TicketsComponent);
        component = fixture.componentInstance;
        fixture.detectChanges();
    });

    it('should create', () => {
        expect(component).toBeTruthy();
    });

    it('should have tickets', () => {
        expect(component.tickets).toEqual([
            { id: 1, story: "As a user, I want to see a list of all tickets, so I can see what to work on", },
        ]);
    })
});
