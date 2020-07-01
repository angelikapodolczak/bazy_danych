select nazwisko, etat, P.id_zesp, nazwa
from PRACOWNICY p join ZESPOLY z
on z.ID_ZESP=p.ID_ZESP
order by nazwisko;

select nazwisko, etat, p.id_zesp, adres
from pracownicy p join zespoly z
on p.id_zesp=z.id_zesp
where adres='PIOTROWO 3A'
order by nazwisko;

select nazwisko, adres, nazwa
from pracownicy p join zespoly z
on p.id_zesp=z.id_zesp
where placa_pod>400
order by nazwisko;

select nazwisko, placa_pod, etat, nazwa as kat_plac, placa_min, placa_max
from pracownicy join etaty
on placa_pod between placa_min and placa_max
order by nazwisko, kat_plac;

select nazwisko, placa_pod, etat, nazwa as kat_plac, placa_min, placa_max
from pracownicy join etaty
on placa_pod between placa_min and placa_max
where nazwa='SEKRETARKA'
order by placa_pod;

select nazwisko, etat, placa_pod, nazwa as kat_plac, nazwa
from PRACOWNICY p join etaty e
on placa_pod between placa_min and placa_max
where etat!='ASYSTENT'
order by placa_pod desc;

select nazwisko, etat, 
(PLACA_pod*12)+coalesce(placa_dod,0) as roczna_placa, 
z.nazwa, e.nazwa as kat_plac
from PRACOWNICY p join etaty e
on placa_pod between placa_min and placa_max 
join zespoly z
on p.id_zesp=z.id_zesp
where etat IN ('ASYSTENT', 'ADIUNKT') 
 and (PLACA_pod*12)+coalesce(placa_dod,0)>5500
order by nazwisko;

select etat
from pracownicy 
where extract(year from zatrudniony)=1992
intersect
select etat
from pracownicy
where extract(year from zatrudniony)=1993;

select id_zesp
from zespoly
minus
select id_zesp
from pracownicy;

select nazwisko, placa_pod, 
'Ponizej 480 zlotych' as prog
from pracownicy
where placa_pod<480
union all
select nazwisko, placa_pod,
'Dokładnie 480 złotyc' as prog
from pracownicy
where placa_pod=480
union all
select nazwisko, placa_pod,
'Powyzej 480 złotych' as prog
from pracownicy
where placa_pod>480
order by placa_pod,nazwisko;

-----------07.11.2018-----------------------

select nazwisko, etat, id_zesp
from pracownicy
where id_zesp=
(select id_zesp
from pracownicy
where nazwisko='BRZEZINSKI');

select nazwisko, etat, zatrudniony
from pracownicy
where etat='PROFESOR' and zatrudniony = 
(select min(zatrudniony)
from pracownicy
where etat='PROFESOR');

select nazwisko, zatrudniony, id_zesp
from pracownicy
where (zatrudniony, id_zesp) in 
(select max(zatrudniony) , id_zesp
from pracownicy
group by id_zesp)
order by zatrudniony;

select id_zesp, nazwa, adres
from zespoly z
where id_zesp not in(
select id_zesp 
from pracownicy );

select id_zesp, nazwa, adres
from zespoly z
where not exists (
select 1 
from pracownicy
where id_zesp=z.id_zesp);

select nazwisko, placa_pod, etat
from pracownicy p
where placa_pod>(
select avg(placa_pod) from pracownicy
where etat=p.etat);


------------14.11.2018------------------------

select nazwisko, etat, placa_pod, 
    (select avg(placa_pod)
    from pracownicy
    where etat=p.etat )
from pracownicy p 
where placa_pod<(select avg(placa_pod) 
    from pracownicy 
    where etat=p.etat)
order by etat;


select p.nazwisko, 
(select nazwisko
from pracownicy
where p.id_szefa=id_prac) 
from pracownicy p
where etat='PROFESOR'




