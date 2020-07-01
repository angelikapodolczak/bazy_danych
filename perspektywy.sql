CREATE OR REPLACE VIEW ASYSTENCI 
(ID,NAZWISKO,PLACA,STAZ_PRACY)
AS
SELECT ID_PRAC, NAZWISKO, PLACA_POD, (CURRENT_DATE-ZATRUDNIONY) YEAR TO MONTH
FROM PRACOWNICY WHERE ETAT='ASYSTENT';

SELECT * FROM ASYSTENCI ORDER BY NAZWISKO;

CREATE VIEW PLACE
(ID_ZESP,SREDNIA,MINIMUM,MAXIMUM,FUNDUSZ,L_PENSJI,L_DODATKOW)
AS
SELECT 
 ID_ZESP, 
 AVG(PLACA_POD+NVL(PLACA_DOD,0)), 
 MIN(PLACA_POD+NVL(PLACA_DOD,0)), 
 MAX(PLACA_POD+NVL(PLACA_DOD,0)),
 SUM(PLACA_POD+NVL(PLACA_DOD,0)),
 COUNT(PLACA_POD),
 COUNT(PLACA_DOD)
FROM PRACOWNICY
GROUP BY ID_ZESP
ORDER BY ID_ZESP;

SELECT * FROM PLACE ORDER BY ID_ZESP;

SELECT NAZWISKO, PLACA_POD
FROM PLACE pl JOIN PRACOWNICY pr using (id_zesp)
WHERE pr.PLACA_POD<pl.SREDNIA;

CREATE VIEW PLACE_MINIMALNE
AS
SELECT ID_PRAC, NAZWISKO, ETAT, PLACA_POD 
FROM PRACOWNICY
WHERE PLACA_POD<700
WITH CHECK OPTION CONSTRAINT za_wysoka_placa;

UPDATE PLACE_MINIMALNE
SET PLACA_POD=800 WHERE NAZWISKO='HAPKE';

CREATE OR REPLACE VIEW PRAC_SZEF
(ID_PRAC, ID_SZEFA, PRACOWNIK, ETAT, SZEF)
AS
SELECT p.ID_PRAC, p.ID_SZEFA, p.NAZWISKO, p.ETAT, s.NAZWISKO
FROM PRACOWNICY p join PRACOWNICY s
ON p.ID_SZEFA=s.ID_PRAC
order by p.NAZWISKO;

SELECT * FROM PRAC_SZEF;

INSERT INTO PRAC_SZEF (ID_PRAC, ID_SZEFA, PRACOWNIK, ETAT)
 VALUES (280,150, 'MORZY','ASYSTENT'); 
 
UPDATE PRAC_SZEF SET ID_SZEFA = 130 WHERE ID_PRAC = 280;

DELETE FROM PRAC_SZEF WHERE ID_PRAC = 280; 

CREATE VIEW ZAROBKI AS
SELECT p.ID_PRAC, p.NAZWISKO, p.ETAT, p.PLACA_POD
FROM PRACOWNICY p join PRACOWNICY s
ON p.ID_SZEFA=s.ID_PRAC
WHERE p.PLACA_POD<s.PLACA_POD
WITH CHECK OPTION CONSTRAINT za_wysoka_placa_prac;