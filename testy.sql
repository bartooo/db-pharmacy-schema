set echo on
set linesize 300
set pagesize 500
spool BD2C008_TEST.LIS

/* Informacje o sprzedazy kazdego leku: 
    nazwa leku, 
    cena, 
    wielkosc opakowania, 
    ilosc sprzedanych sztuk,
    numer recepty,
    data_realizacji
    */
SELECT 
    l.nazwa AS nazwa_leku, 
    o.cena AS cena_opakowania, 
    o.wielkosc AS wielkosc_opakowania,
    s.ilosc AS ilosc_sztuk,
    s.numer_recepty AS numer_recepty,
    s.data_realizacji AS data
FROM sprzedaze s  JOIN opakowania o ON (s.kod_gtin = o.kod_gtin)
                  JOIN leki_refundowane l ON (o.id_leku_refundowanego = l.id_leku_refundowanego);

/* Sprawdzenie, jakie leki zostaly przepisane na receptach */
SELECT 
    r.numer_recepty AS numer_recepty, 
    r.data_wystawienia AS data_wystawienia, 
    l.nazwa AS nazwa_leku,
    o.wielkosc AS wielkosc_opakowania,
    s.ilosc AS ilosc,
    s.odplatnosc || '%' AS odplatnosc
FROM recepty r JOIN sprzedaze s ON (r.numer_recepty = s.numer_recepty)
               JOIN opakowania o ON (s.kod_gtin = o.kod_gtin)
               JOIN leki_refundowane l ON (o.id_leku_refundowanego = l.id_leku_refundowanego)
ORDER BY r.numer_recepty ASC;

/* Glowne informacje na recepcie */
SELECT
    r.numer_recepty AS numer_recepty, 
    r.data_wystawienia AS data_wystawienia,
    p.imie || ' ' || p.nazwisko AS personalia_pacjenta,
    p.data_urodzenia AS data_urodzenia_pacjenta,
    p.numer_telefonu AS numer_telefonu_pacjenta,
    p.pesel AS pesel_pacjenta,
    l.imie || ' ' || l.nazwisko AS personalia_lekarza,
    l.numer_umowy AS numer_umowy_lekarza,
    l.specjalizacja AS specjalizacja_lekarza
FROM recepty r JOIN lekarze l ON (r.id_lekarza = l.id_lekarza)
               JOIN pacjenci p ON (r.id_pacjenta = p.id_pacjenta);

/* Laczne wartosci kazdej recepty z uwzgledniona odplatnoscia */
SELECT
    r.numer_recepty AS numer_recepty,
    SUM (s.ilosc * o.cena * (100 - s.odplatnosc) * 0.01) || ' PLN' AS suma_do_zaplaty
    
FROM recepty r JOIN sprzedaze s ON (r.numer_recepty = s.numer_recepty)
               JOIN opakowania o ON (s.kod_gtin = o.kod_gtin)
GROUP BY r.numer_recepty;

/* Wszystkie warianty lekow */
SELECT
    o.kod_gtin AS kod_gtin_opakowania,
    l.nazwa AS nazwa_leku,
    l.postac AS postac_leku,
    o.wielkosc AS wielkosc_opakowania,
    o.cena AS cena_opakowania
FROM opakowania o JOIN leki_refundowane l ON (o.id_leku_refundowanego = l.id_leku_refundowanego);

spool off

