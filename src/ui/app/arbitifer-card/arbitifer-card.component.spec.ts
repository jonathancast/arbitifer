import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ArbitiferCardComponent } from './arbitifer-card.component';

describe('ArbitiferCardComponent', () => {
  let component: ArbitiferCardComponent;
  let fixture: ComponentFixture<ArbitiferCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ArbitiferCardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ArbitiferCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
