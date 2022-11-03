create or replace function arbitifer_user() returns text as $$
begin
    return coalesce(current_setting('arbitifer.username', true), current_user);
end;
$$ language 'plpgsql';

create or replace function update_modified_column()
returns trigger AS $$
begin
    NEW.updated_by = arbitifer_user();
    NEW.updated_at = now();
    return NEW;
end;
$$ language 'plpgsql';

create sequence seq_ticket_no;

create table tickets (
    id integer primary key default nextval('seq_ticket_no'),
    story text not null,
    created_by text not null default arbitifer_user(),
    created_at timestamp with time zone not null default now(),
    updated_by text,
    updated_at timestamp with time zone
);

revoke update(id) on tickets from public;
revoke update(id) on tickets from current_user;

create sequence seq_audit_ticket_no;

create table audit_tickets (
    audit_id integer primary key default nextval('seq_audit_ticket_no'),
    id integer,
    action text not null check (action in ('INSERT', 'UPDATE', 'DELETE')),
    data jsonb,
    action_by text not null,
    action_at timestamp with time zone not null,
    check (action = 'DELETE' or data is not null)
);

create index if not exists idx_audit_tickets_id_action_action_at on audit_tickets (id, action, action_at);
create index if not exists idx_audit_tickets_id_action_at on audit_tickets (id, action_at);
create index if not exists idx_audit_tickets_action_at on audit_tickets (action_at);

revoke INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER on audit_tickets from public;

create or replace function update_audit_tickets() RETURNS trigger AS $$
DECLARE
    v_new_data jsonb;
BEGIN
    if (TG_OP = 'INSERT') then
        insert into audit_tickets values (NEW.id, 'INSERT', row_to_json(NEW.*), arbitifer_user(), now());
        RETURN NEW;
    elsif (TG_OP = 'UPDATE') then
        insert into audit_tickets values (NEW.id, 'UPDATE', row_to_json(NEW.*), arbitifer_user(), now());
        RETURN NEW;
    elsif (TG_OP = 'DELETE') then
        insert into audit_tickets values (OLD.id, 'DELETE', null, arbitifer_user(), now());
        RETURN OLD;
    end if;
END;
$$
LANGUAGE plpgsql
SECURITY DEFINER;

create or replace trigger audit_ticket_action
    after insert or update or delete on tickets
    for each row execute procedure update_audit_tickets()
;

create or replace trigger update_ticket_modtime before update on tickets for each row execute procedure update_modified_column();
