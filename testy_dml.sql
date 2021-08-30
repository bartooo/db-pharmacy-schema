set echo on
set linesize 300
set pagesize 500
spool BD2C008_DML.LIS

/*** LEKARZE ***/

/* Testy ograniczen NOT NULL - zadne z polecen nie powinno sie wykonac */
/* Brak imienia */
INSERT INTO lekarze (nazwisko, numer_umowy, numer_telefonu, imie_2, specjalizacja, uwagi) VALUES ('Politowska', '761614356576', '+48757203668', '', 'ortopedia', '');
/* Brak nazwiska */
INSERT INTO lekarze (imie, numer_umowy, numer_telefonu, imie_2, specjalizacja, uwagi) VALUES ('Ada', '761614356576', '+48757203668', '', 'ortopedia', '');
/* Brak numeru umowy */
INSERT INTO lekarze (imie, nazwisko, numer_telefonu, imie_2, specjalizacja, uwagi) VALUES ('Ada', 'Politowska', '+48757203668', '', 'ortopedia', '');

/* Test 'lekarz_nr_tel_uk' */
INSERT INTO lekarze (imie, nazwisko, numer_umowy, numer_telefonu, imie_2, specjalizacja, uwagi) VALUES ('Ada', 'Politowska', '761614356576', '+48750606053', '', 'ortopedia', '');
/* Test 'lekarz_nr_um_uk' */
INSERT INTO lekarze (imie, nazwisko, numer_umowy, numer_telefonu, imie_2, specjalizacja, uwagi) VALUES ('Ada', 'Politowska', '717495165067', '+48757203668', '', 'ortopedia', '');


/*** PACJENCI ***/

/* Testy ograniczen NOT NULL - zadne z polecen nie powinno sie wykonac */
/* Brak imienia */
INSERT INTO pacjenci (nazwisko, data_urodzenia, imie_2, pesel, numer_telefonu, plec, uwagi) VALUES ('Domaradzka', TO_DATE('1990/03/25', 'yyyy/mm/dd'), '', '90032524279', '+48922806652', 'K', '');
/* Brak nazwiska */
INSERT INTO pacjenci (imie, data_urodzenia, imie_2, pesel, numer_telefonu, plec, uwagi) VALUES ('Magda', TO_DATE('1990/03/25', 'yyyy/mm/dd'), '', '90032524279', '+48922806652', 'K', '');
/* Brak daty urodzenia */
INSERT INTO pacjenci (imie, nazwisko, imie_2, pesel, numer_telefonu, plec, uwagi) VALUES ('Magda', 'Domaradzka', '', '90032524279', '+48922806652', 'K', '');

/* Test poprawnosci plci */
INSERT INTO pacjenci (imie, nazwisko, data_urodzenia, imie_2, pesel, numer_telefonu, plec, uwagi) VALUES ('Magda', 'Domaradzka', TO_DATE('1990/03/25', 'yyyy/mm/dd'), '', '90032524279', '+48922806652', 'A', '');
/* Test 'pacj_nr_tel_uk' */
INSERT INTO pacjenci (imie, nazwisko, data_urodzenia, imie_2, pesel, numer_telefonu, plec, uwagi) VALUES ('Magda', 'Domaradzka', TO_DATE('1990/03/25', 'yyyy/mm/dd'), '', '90032524279', '+48811450010', 'K', '');
/* Test 'pacj_pesel_uk' */
INSERT INTO pacjenci (imie, nazwisko, data_urodzenia, imie_2, pesel, numer_telefonu, plec, uwagi) VALUES ('Magda', 'Domaradzka', TO_DATE('1990/03/25', 'yyyy/mm/dd'), '', '86091601677', '+48922806652', 'K', '');
/* Test 'pacj_uk' */
INSERT INTO pacjenci (imie, nazwisko, data_urodzenia, imie_2, pesel, numer_telefonu, plec, uwagi) VALUES ('Irena', 'Politowska', TO_DATE('1984/03/11', 'yyyy/mm/dd'), '', '98111587550', '+48740303222', 'K', '');


/*** LEKI_REFUNDOWANE ***/

/* Testy ograniczen NOT NULL - zadne z polecen nie powinno sie wykonac */
/* Brak mocy */
INSERT INTO leki_refundowane (nazwa, nazwa_substancji_czynnej, postac, sposob_podania, opis) VALUES ('Ketonal Active', 'Ketoprofenum', 'bledna_postac', 'doustnie', '');
/* Brak nazwy */
INSERT INTO leki_refundowane (nazwa_substancji_czynnej, moc, postac, sposob_podania, opis) VALUES ('Ketoprofenum', '50mg', 'bledna_postac', 'doustnie', '');
/* Brak nazwy substancji czynnej */
INSERT INTO leki_refundowane (nazwa, moc, postac, sposob_podania, opis) VALUES ('Ketonal Active', '50mg', 'bledna_postac', 'doustnie', '');
/* Brak postaci */
INSERT INTO leki_refundowane (nazwa, nazwa_substancji_czynnej, moc, sposob_podania, opis) VALUES ('Ketonal Active', 'Ketoprofenum', '50mg', 'doustnie', '');
/* Test poprawnosci postaci */
INSERT INTO leki_refundowane (nazwa, nazwa_substancji_czynnej, moc, postac, sposob_podania, opis) VALUES ('Ketonal Active', 'Ketoprofenum', '50mg', 'bledna_postac', 'doustnie', '');
/* Test 'lek_uk' */
INSERT INTO leki_refundowane (nazwa, nazwa_substancji_czynnej, moc, postac, sposob_podania, opis) VALUES ('Apap', 'Paracetamolum', '50mg', 'tabletka', 'doustnie', '');


/*** OPAKOWANIA ***/

/* Testy ograniczen NOT NULL - zadne z polecen nie powinno sie wykonac */
/* Brak ceny */
INSERT INTO opakowania (kod_gtin, numer_pozwolenia, id_leku_refundowanego, wielkosc, termin_waznosci, podmiot_odpowiedzialny, opis) VALUES ('9183669814065', 'Q/534711', 1, 20, TO_DATE('2023/08/15', 'yyyy/mm/dd'), 'US Pharmacia', '');
/* Brak id leku refundowanego */
INSERT INTO opakowania (kod_gtin, numer_pozwolenia, wielkosc, cena, termin_waznosci, podmiot_odpowiedzialny, opis) VALUES ('9183669814065', 'Q/534711', 20, 6.99, TO_DATE('2023/08/15', 'yyyy/mm/dd'), 'US Pharmacia', '');
/* Brak kodu gtin */
INSERT INTO opakowania (numer_pozwolenia, id_leku_refundowanego, wielkosc, cena, termin_waznosci, podmiot_odpowiedzialny, opis) VALUES ('Q/534711', 1, 20, 6.99, TO_DATE('2023/08/15', 'yyyy/mm/dd'), 'US Pharmacia', '');
/* Brak numeru pozwolenia */
INSERT INTO opakowania (kod_gtin, id_leku_refundowanego, wielkosc, cena, termin_waznosci, podmiot_odpowiedzialny, opis) VALUES ('9183669814065', 1, 20, 6.99, TO_DATE('2023/08/15', 'yyyy/mm/dd'), 'US Pharmacia', '');
/* Brak podmiotu odpowiedzialnego */
INSERT INTO opakowania (kod_gtin, numer_pozwolenia, id_leku_refundowanego, wielkosc, cena, termin_waznosci, opis) VALUES ('9183669814065', 'Q/534711', 1, 20, 6.99, TO_DATE('2023/08/15', 'yyyy/mm/dd'), '');
/* Brak terminu waznosci */
INSERT INTO opakowania (kod_gtin, numer_pozwolenia, id_leku_refundowanego, wielkosc, cena, podmiot_odpowiedzialny, opis) VALUES ('9183669814065', 'Q/534711', 1, 20, 6.99, 'US Pharmacia', '');
/* Brak wielkosci */
INSERT INTO opakowania (kod_gtin, numer_pozwolenia, id_leku_refundowanego, cena, termin_waznosci, podmiot_odpowiedzialny, opis) VALUES ('9183669814065', 'Q/534711', 1, 6.99, TO_DATE('2023/08/15', 'yyyy/mm/dd'), 'US Pharmacia', '');
/* Sprawdzenie czy wielkosc jest wieksza od zera */
INSERT INTO opakowania (kod_gtin, numer_pozwolenia, id_leku_refundowanego, wielkosc, cena, termin_waznosci, podmiot_odpowiedzialny, opis) VALUES ('9183669814065', 'Q/534711', 1, -20, 6.99, TO_DATE('2023/08/15', 'yyyy/mm/dd'), 'US Pharmacia', '');
/* Test 'opak_uk' */
INSERT INTO opakowania VALUES ('9183645000065', 'Q/534711', 1, 50, 10.99, TO_DATE('2023/08/16', 'yyyy/mm/dd'), 'US Pharmacia', '');
/* Test wyzwalacza 'fkntm_opakowania' */
UPDATE opakowania SET id_leku_refundowanego = 25 WHERE id_leku_refundowanego = 1;
/* Test usuniecia klucza obcego */
DELETE FROM leki_refundowane WHERE id_leku_refundowanego = 11; 
/* Test kaskady kasowania */
SELECT COUNT(*) FROM opakowania where id_leku_refundowanego = 10;
DELETE FROM leki_refundowane WHERE id_leku_refundowanego = 10;
SELECT COUNT(*) FROM opakowania where id_leku_refundowanego = 10;

/*** RECEPTY ***/

/* Testy ograniczen NOT NULL - zadne z polecen nie powinno sie wykonac */
/* Brak id lekarza */
INSERT INTO recepty (id_pacjenta, uwagi) VALUES (23, '');
/* Brak id pacjenta */
INSERT INTO recepty (id_lekarza, uwagi) VALUES (8, '');
/* Test wstawienia domyslnej wartosci w przypadku braku daty wystawienia - wiersz powinien zostac wstawiony pomyslnie */
INSERT INTO recepty (id_pacjenta, id_lekarza, uwagi) VALUES (23, 8, '');
/* Test wyzwalacza 'fkntm_recepty' */
UPDATE recepty SET id_lekarza = 43 WHERE id_lekarza = 26;
/* Test wyzwalacza 'fkntm_recepty' */
UPDATE recepty SET id_pacjenta = 13 WHERE id_pacjenta = 34;
/* Test usuniecia kluczy obcych */
DELETE FROM lekarze WHERE id_lekarza = 43;
DELETE FROM pacjenci WHERE id_pacjenta = 44;

/*** SPRZEDAZE ***/

/* Testy ograniczen NOT NULL - zadne z polecen nie powinno sie wykonac */
/* Brak ilosci */
INSERT INTO sprzedaze (kod_gtin, numer_recepty, odplatnosc, metoda_platnosci, uwagi) VALUES ('9181100114065', 1, 0, 'gotowka', '');
/* Brak numeru recepty */
INSERT INTO sprzedaze (kod_gtin, ilosc, odplatnosc, metoda_platnosci, uwagi) VALUES ('9181100114065', 2, 0, 'gotowka', '');
/* Brak odplatnosci */
INSERT INTO sprzedaze (kod_gtin, numer_recepty, ilosc, metoda_platnosci, uwagi) VALUES ('9181100114065', 1, 2, 'gotowka', '');
/* Test wstawienia domyslnej wartosci w przypadku braku daty realizacji - wiersz powinien zostac wstawiony pomyslnie */
INSERT INTO sprzedaze (kod_gtin, numer_recepty, ilosc, odplatnosc, metoda_platnosci, uwagi) VALUES ('8853347021292', 23, 1, 0, 'gotowka', '');
/* Test ilosci wiekszej od zera */
INSERT INTO sprzedaze (kod_gtin, numer_recepty, ilosc, odplatnosc, metoda_platnosci, uwagi) VALUES ('9183600114065', 1, -2, 0, 'gotowka', '');
/* Test poprawnosci metody platnosci */
INSERT INTO sprzedaze (kod_gtin, numer_recepty, ilosc, odplatnosc, metoda_platnosci, uwagi) VALUES ('9183600114065', 1, 80, 0, 'bledna_metoda', '');
/* Test poprawnosci odplatnosci */
INSERT INTO sprzedaze (kod_gtin, numer_recepty, ilosc, odplatnosc, metoda_platnosci, uwagi) VALUES ('9183600114065', 1, 80, 150, 'gotowka', '');
/* Test wyzwalacza 'fkntm_sprzedaze' */
UPDATE sprzedaze SET kod_gtin = '8853312321292' WHERE kod_gtin = '7277098145012';
UPDATE sprzedaze SET numer_recepty = 4 WHERE numer_recepty= 31;
/* Test usuniecia kluczy obcych */
DELETE FROM recepty WHERE numer_recepty = 10;
DELETE FROM opakowania WHERE kod_gtin = '5429285296546';
rollback;
spool off