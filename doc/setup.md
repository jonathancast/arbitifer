This just documents what I did to create the Arbitifer Arbitifer database.

* Connect to Postgres

      postgres=# create user arbitifer_arbitifer;
      CREATE ROLE
      
      postgres=# create database arbitifer_arbitifer owner = arbitifer_arbitifer ;
      CREATE DATABASE
      
      postgres=# alter user arbitifer_arbitifer with password 'HAH HAH YEAH RIGHT';
      ALTER ROLE
      
      postgres=# \c arbitifer_arbitifer arbitifer_arbitifer 
      Password for user arbitifer_arbitifer: 
      SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
      You are now connected to database "arbitifer_arbitifer" as user "arbitifer_arbitifer".
      
      arbitifer_arbitifer=> create sequence seq_ticket_no;
      CREATE SEQUENCE
      
      arbitifer_arbitifer=> create table tickets (
          id integer primary key default nextval('seq_ticket_no'),
          story text not null
      );
      CREATE TABLE
      
      arbitifer_arbitifer=> insert into tickets (story) values ('As a user, I want to see a list of all tickets, so I can see what to work on');
      INSERT 0 1
      
      arbitifer_arbitifer=> select * from tickets;
       id |                                    story                                     
      ----+------------------------------------------------------------------------------
        1 | As a user, I want to see a list of all tickets, so I can see what to work on
      (1 row)

* I made the initial DB export via

      $ pg_dump -h $hostname -U arbitifer_arbitifer arbitifer_arbitifer > dbexport.sql