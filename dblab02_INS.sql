INSERT INTO pracownicy
VALUES (250, 'KOWALSKI', 'ASYSTENT', NULL, DATE'2015-01-13', 1500, NULL, 10);
INSERT INTO pracownicy
VALUES (260, 'ADAMSKI', 'ASYSTENT', NULL, DATE'2014-09-10', 1500, NULL, 10);
INSERT INTO pracownicy
VALUES (270, 'NOWAK', 'ADIUNKT', NULL, DATE'1990-05-01', 2050, 540, 20);
COMMIT;

UPDATE PRACOWNICY p
SET PLACA_POD=PLACA_POD+0.1*PLACA_POD,
    p.PLACA_DOD=NVL(p.PLACA_DOD,100)+0.2*NVL(p.PLACA_DOD,0)
WHERE ID_PRAC>=250;

SELECT * FROM PRACOWNICY
WHERE ID_PRAC>=250;

INSERT INTO ZESPOLY
VALUES(60,'BAZY DANYCH','PIOTROWO 2');

SELECT *FROM ZESPOLY
WHERE ID_ZESP=60;






update pracownicy
set placa_dod=null
where id_prac>=250 and id_prac<270;