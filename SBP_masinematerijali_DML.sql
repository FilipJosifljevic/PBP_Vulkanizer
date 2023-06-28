
--insert Zahtev
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(1,'NS-1071-FH','2019-07-21');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(2,'NS-9899-JI','2019-08-15');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(3,'NS-2234-GG','2019-10-22');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(4,'BG-1023-PO','2019-03-03');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(5,'PO-2643-TR','2019-11-21');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(6,'KV-7889-CV','2019-05-25');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(7,'NI-6538-XV','2019-01-26');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(8,'KV-3445-LI','2019-08-08');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(9,'VB-8788-FI','2020-01-21');
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(10,'NP-4456-KH','2020-02-01');

--insert Materijal

INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Bakar', 50);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Aluminijum', 30);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Cink', 40);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Aktivna pena', 20);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Cepovi', 10);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Ulozak ventila', 70);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Kapica ventila', 55);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Olovni tegovi', 30);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Celični teg', 60);
INSERT INTO MasineMaterijali.materijal(id_materijala, naziv_materijala, kolicina_materijala)
VALUES(NEXT VALUE FOR MasineMaterijali.materijal_sequence, 'Sirova guma', 75);

-- insert Vrsta usluge
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(1,'Unutrašnje pranje',5000);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(2,'Spoljašnje pranje',4000);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(3,'Ručno pranje',10000);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(4,'Zamena pneumatika',12000);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(5,'Poliranje',11000);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(6,'Balansiranje gume',250);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(7,'Krpljenje unutrašnje gume',1500);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(8,'Čepovanje guma',3000);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(9,'Skidanje-nameštanje tocka',2500);
INSERT INTO MasineMaterijali.vrsta_usluge(id_vrste_usluge, naziv_vrste_usluge, cena)
VALUES(10,'Brušenje i presovanje fleke',500);

--insert Ostale usluge

INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(3);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(4);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(2);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(5);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(7);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(1);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(6);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(10);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(9);
INSERT INTO MasineMaterijali.ostale_usluge(id_vrste_usluge)
VALUES(8);

--insert Operacija
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Pranje volana',5);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Pranje poda',10);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Pranje sedišta',15);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Skidanje gume',7);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Montiranje gume',6);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Skidanje točka',12);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Montiranje točka',13);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Poliranje haube',7);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Poliranje vrata',5);
INSERT INTO MasineMaterijali.operacija(id_operacije, naziv_operacije, trajanje_operacije)
VALUES(NEXT VALUE FOR MasineMaterijali.operacija_sequence,'Montiranje tegova',9);

--insert Aktivnost
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(1,1,'Prskanje tečnosti', 2,1);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(1,2,'Brisanje volana', 3,1);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(3,1,'Usisavanje sedišta', 5,3);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(3,2,'Prebrisavanje sedišta', 7,3);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(3,3,'Sušenje sedišta', 3,3);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(9,1,'Odvrtanje šrafova', 11,6);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(9,2,'Skidanje točka', 1,6);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(5,1,'Stavljanje paste', 3,7);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(6,1,'Skidanje gume sa točka', 3,4);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(6,2,'Stavljanje tegova', 1,4);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(6,3,'Balansiranje', 3,4);
INSERT INTO MasineMaterijali.aktivnost(id_vrste_usluge, rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti, id_operacije)
VALUES(6,4,'Montiranje gume', 6,5);

--insert Tip masine
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(1,'Mašina za ispravljanje felni',2);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(2,'Mašina za punjenje guma azotom',1);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(3,'Dizalica za teretne gume',4);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(4,'Alat za demontažu guma',2);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(5,'Mašina za balansiranje točkova',2);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(6,'Mašina za reglazu trapa',1);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(7,'Demonterka 24'' poluautomatska',1);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(8,'Perač pod pritiskom',1);
INSERT INTO MasineMaterijali.tip_masine(id_tipa_masine,naziv_tipa_masine,ukupan_broj_masina)
VALUES(9,'Brusilica za poliranje',1);


--insert Masina
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(1,1,'UNI-TROL PO22',75,75,200,450,2011);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(1,2,'UNI-TROL PO14S',55,75,400,165,209);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(2,1,'HP-1370A/EN',22,45,220,91,2014);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(3,1,'TX12002',0,10,0,120,2016);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(3,2,'TX12004',0,10,0,122,2017);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(3,3,'TX13003',0,10,0,116,2013);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(3,4,'TX22006',0,10,0,127,2016);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(4,1,'TRK60001',0,10,0,50,2017);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(4,2,'TRS70006',0,10,0,53,2018);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(5,1,'U579',15,30,220,78,2018);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(5,2,'U584',20,35,220,83,2018);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(6,1,'MANATEC FOX 3D',18,20,220,66,2015);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(7,1,'U201',15,20,220,57,2019);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(8,1,'VHW 80 055830',20,10,220,42,2020);
INSERT INTO MasineMaterijali.masina(id_tipa_masine,rbr_masine,oznaka_masine,snaga_motora,nivo_buke,napajanje,tezina,godina_proizvodnje)
VALUES(9,1,'VHW 80 055830',95,20,220,4,2021);

--insert Se_koristi
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,5,4);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(4,5,3);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,5,2);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,7,1);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,6,7);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,7,7);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(2,10,3);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,2,8);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,9,9);
INSERT INTO MasineMaterijali.se_koristi(broj_masina,id_operacije,id_tipa_masine)
VALUES(1,8,9);

--insert Zahtev za ostale usluge
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(5,1);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(8,10);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(3,6);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(9,4);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(6,3);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(1,5);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(2,10);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(4,9);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(10,8);
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(7,4);

--insert Radni nalog
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(1,1,'2020-03-22','09:30:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(2,6,'2020-03-15','14:30:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(3,4,'2020-03-21','09:30:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(4,9,'2020-04-27','08:00:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(5,3,'2020-07-05','10:00:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(6,7,'2020-03-12','09:00:00',4);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(7,2,'2020-07-09','16:30:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(8,5,'2020-08-08','17:00:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(9,8,'2020-10-20','11:30:00',0);
INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma)
VALUES(10,10,'2020-08-17','14:30:00',0);

--insert Korak
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(1,1,5,1,1);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(1,3,6,1,3);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(2,3,6,2,3);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(3,3,6,3,3);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(4,3,6,4,3);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(1,4,9,1,4);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(2,4,9,2,4);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(1,6,3,1,6);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(2,6,3,2,6);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(3,6,3,3,6);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(1,5,1,1,5);
INSERT INTO MasineMaterijali.korak(rbr_koraka,id_zahteva_za_ostale_usluge_rn,id_vrste_usluge,rbr_aktivnosti,id_zahteva_za_ostale_usluge)
VALUES(2,5,1,2,5);

--insert Je potreban
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(1,1,4);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(2,2,4);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(2,3,4);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(4,8,4);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(4,7,8);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(4,10,9);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(1,5,6);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(1,5,7);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(2,9,4);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(1,5,10);
INSERT INTO MasineMaterijali.je_potreban(potrebna_kolicina,id_operacije,id_materijala)
VALUES(4,5,5);

--insert Upotrebljava
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(5,1,1,4);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(0,3,1,8);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(8,3,2,8);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(8,3,3,8);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(8,3,4,8);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(0,4,1,6);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(0,4,1,7);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(4,4,2,6);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(4,4,2,7);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(1,5,1,4);
INSERT INTO MasineMaterijali.upotrebljava(kolicina_iskoriscenog_mat,id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
VALUES(1,5,2,4);
--insert Se upotrebljava
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(5,1,9,1);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(5,2,9,1);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(4,1,3,1);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(4,1,4,1);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(4,2,3,2);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(4,2,4,2);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(6,1,8,1);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(6,2,8,1);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(6,3,8,1);
INSERT INTO MasineMaterijali.se_upotrebljava(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
VALUES(1,1,8,1);



