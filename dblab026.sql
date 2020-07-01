create table PROJEKTY 
    (ID_PROJEKTU NUMBER(4,0) GENERATED ALWAYS AS IDENTITY,
     OPIS_PROJEKTU VARCHAR(20),
     DATA_ROZPOCZECIA DATE default current_date,
     DATA_ZAKONCZENIA DATE,
     FUNDUSZ NUMBER(7,2));

insert into PROJEKTY (OPIS_PROJEKTU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,FUNDUSZ)
values('Indeksy bitmapowe',date '1999-04-02', date '2001-08-31',25000); 

insert into PROJEKTY (OPIS_PROJEKTU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,FUNDUSZ)
values('Sieci kręgosłupowe',default,null,19000); 

select id_projektu, OPIS_PROJEKTU
from PROJEKTY;

insert into PROJEKTY (OPIS_PROJEKTU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,FUNDUSZ)
values('Indeksy drzewiaste',date '2013-12-24',date '2014-01-01',1200); 

select id_projektu, OPIS_PROJEKTU
from PROJEKTY;

create table PROJEKTY_KOPIA
as select * from projekty;

select * from projekty_kopia;

insert into projekty_kopia (id_projektu,OPIS_PROJEKTU,DATA_ROZPOCZECIA,DATA_ZAKONCZENIA,FUNDUSZ)
values (10, 'Sieci lokalne', current_date, current_date+interval'1'year, 24500);

delete from projekty
where opis_projektu='Indeksy drzewiaste';

select * from projekty;

