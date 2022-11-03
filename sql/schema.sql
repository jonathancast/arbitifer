create sequence seq_ticket_no;

create or replace function arbitifer_user() returns text as $$
begin
    return coalesce(current_setting('arbitifer.username', true), current_user);
end;
$$ language 'plpgsql';

create table tickets (
    id integer primary key default nextval('seq_ticket_no'),
    story text not null,
    created_by text not null default arbitifer_user(),
    created_at timestamp with time zone not null default now(),
    updated_by text,
    updated_at timestamp with time zone
);

create or replace function update_modified_column()
returns trigger AS $$
begin
    NEW.updated_by = arbitifer_user();
    NEW.updated_at = now();
    return NEW;
end;
$$ language 'plpgsql';

create or replace trigger update_ticket_modtime before update on tickets for each row execute procedure update_modified_column();
