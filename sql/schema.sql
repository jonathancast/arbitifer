create sequence seq_ticket_no;

create table tickets (
    id integer primary key default nextval('seq_ticket_no'),
    story text not null
);
