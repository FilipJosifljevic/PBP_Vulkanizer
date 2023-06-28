IF OBJECT_ID('MasineMaterijali.upotrebljava','U') IS NOT NULL
	DROP TABLE MasineMaterijali.upotrebljava

IF OBJECT_ID('MasineMaterijali.se_upotrebljava','U') IS NOT NULL
	DROP TABLE MasineMaterijali.se_upotrebljava

IF OBJECT_ID('MasineMaterijali.korak','U') IS NOT NULL
	DROP TABLE MasineMaterijali.korak

IF OBJECT_ID('MasineMaterijali.radni_nalog','U') IS NOT NULL
	DROP TABLE MasineMaterijali.radni_nalog

IF OBJECT_ID('MasineMaterijali.zahtev_za_ostale_usluge','U') IS NOT NULL
	DROP TABLE MasineMaterijali.zahtev_za_ostale_usluge

IF OBJECT_ID('MasineMaterijali.zahtev','U') IS NOT NULL
	DROP TABLE MasineMaterijali.zahtev

IF OBJECT_ID('MasineMaterijali.je_potreban','U') IS NOT NULL
	DROP TABLE MasineMaterijali.je_potreban

IF OBJECT_ID('MasineMaterijali.materijal','U') IS NOT NULL
	DROP TABLE MasineMaterijali.materijal

IF OBJECT_ID('MasineMaterijali.materijal_sequence','SO') IS NOT NULL
	DROP SEQUENCE MasineMaterijali.materijal_sequence

IF OBJECT_ID('MasineMaterijali.se_koristi','U') IS NOT NULL
	DROP TABLE MasineMaterijali.se_koristi

IF OBJECT_ID('MasineMaterijali.masina','U') IS NOT NULL
	DROP TABLE MasineMaterijali.masina

IF OBJECT_ID('MasineMaterijali.tip_masine','U') IS NOT NULL
	DROP TABLE MasineMaterijali.tip_masine

IF OBJECT_ID('MasineMaterijali.aktivnost','U') IS NOT NULL
	DROP TABLE MasineMaterijali.aktivnost

IF OBJECT_ID('MasineMaterijali.operacija','U') IS NOT NULL
	DROP TABLE MasineMaterijali.operacija

IF OBJECT_ID('MasineMaterijali.operacija_sequence','SO') IS NOT NULL
	DROP SEQUENCE MasineMaterijali.operacija_sequence

IF OBJECT_ID('MasineMaterijali.ostale_usluge','U') IS NOT NULL
	DROP TABLE MasineMaterijali.ostale_usluge

IF OBJECT_ID('MasineMaterijali.vrsta_usluge','U') IS NOT NULL
	DROP TABLE MasineMaterijali.vrsta_usluge

IF OBJECT_ID('MasineMaterijali.evidencija_mat','U') IS NOT NULL
	DROP TABLE MasineMaterijali.evidencija_mat


DROP SCHEMA IF EXISTS MasineMaterijali
GO
CREATE SCHEMA MasineMaterijali
GO


CREATE TABLE MasineMaterijali.vrsta_usluge
(
	id_vrste_usluge NUMERIC(8) PRIMARY KEY,
	naziv_vrste_usluge VARCHAR(30) NOT NULL UNIQUE,
	cena NUMERIC(8) NOT NULL
)

CREATE TABLE MasineMaterijali.ostale_usluge
(
	id_vrste_usluge NUMERIC(8),
	CONSTRAINT FK_vrsta_usluge_ostale_usluge FOREIGN KEY(id_vrste_usluge)
		REFERENCES MasineMaterijali.vrsta_usluge(id_vrste_usluge),
	CONSTRAINT PK_ostale_usluge PRIMARY KEY(id_vrste_usluge)
)

CREATE TABLE MasineMaterijali.operacija
(
	id_operacije NUMERIC(5) PRIMARY KEY,
	naziv_operacije VARCHAR(20) NOT NULL,
	trajanje_operacije NUMERIC(3) NOT NULL,
	CONSTRAINT CHK_id_operacije_value CHECK(id_operacije>0),
	CONSTRAINT CHK_trajanje_operacije_value CHECK(trajanje_operacije>0)
)

CREATE SEQUENCE MasineMaterijali.operacija_sequence AS INT
START WITH 1
MINVALUE 1
INCREMENT BY 1
CYCLE

ALTER TABLE MasineMaterijali.operacija
ADD CONSTRAINT DFT_id_operacije DEFAULT(NEXT VALUE FOR MasineMaterijali.operacija_sequence) FOR id_operacije

CREATE TABLE MasineMaterijali.aktivnost
(
	id_vrste_usluge NUMERIC(8),
	rbr_aktivnosti NUMERIC(5) NOT NULL,
	naziv_aktivnosti VARCHAR(30) NOT NULL,
	trajanje_aktivnosti NUMERIC(3) NOT NULL,
	id_operacije NUMERIC(5) NOT NULL,
	CONSTRAINT FK_vrsta_usluge_aktivnost FOREIGN KEY(id_vrste_usluge)
		REFERENCES MasineMaterijali.vrsta_usluge(id_vrste_usluge),
	CONSTRAINT FK_operacija_aktivnost FOREIGN KEY(id_operacije)
		REFERENCES MasineMaterijali.operacija(id_operacije),
	CONSTRAINT PK_aktivnost PRIMARY KEY(id_vrste_usluge,rbr_aktivnosti),
	CONSTRAINT CHK_rbr_aktivnosti_value CHECK(rbr_aktivnosti>0),
	CONSTRAINT CHK_trajanje_aktivnosti CHECK(trajanje_aktivnosti>0)
)
CREATE TABLE MasineMaterijali.tip_masine
(
	id_tipa_masine NUMERIC(2) PRIMARY KEY,
	naziv_tipa_masine VARCHAR(30) NOT NULL,
	ukupan_broj_masina NUMERIC(2) NOT NULL,
	CONSTRAINT CHK_id_tipa_masine_value CHECK(id_tipa_masine>0),
	CONSTRAINT CHK_ukupan_broj_masina CHECK(ukupan_broj_masina>0)
)

CREATE TABLE MasineMaterijali.masina
(
	id_tipa_masine NUMERIC(2),
	rbr_masine NUMERIC(5),
	oznaka_masine VARCHAR(20) NOT NULL,
	snaga_motora NUMERIC(3),
	nivo_buke NUMERIC(3) NOT NULL,
	napajanje NUMERIC(3),
	tezina NUMERIC(4),
	godina_proizvodnje NUMERIC(4) NOT NULL,
	CONSTRAINT FK_tip_masine_masina FOREIGN KEY(id_tipa_masine)
		REFERENCES MasineMaterijali.tip_masine(id_tipa_masine),
	CONSTRAINT PK_masina PRIMARY KEY(id_tipa_masine,rbr_masine),
	CONSTRAINT CHK_rbr_masine_value CHECK(rbr_masine>0),
	CONSTRAINT CHK_snaga_motora_value CHECK(snaga_motora>=0),
	CONSTRAINT CHK_nivo_buke_value CHECK(nivo_buke>0),
	CONSTRAINT CHK_napajanje_value CHECK(napajanje>=0),
	CONSTRAINT CHK_tezina_value CHECK(tezina>0),
	CONSTRAINT CHK_godina_proizvodnje CHECK(godina_proizvodnje>0)
)

CREATE TABLE MasineMaterijali.se_koristi
(
	broj_masina NUMERIC(2),
	id_operacije NUMERIC(5),
	id_tipa_masine NUMERIC(2),
	CONSTRAINT FK_operacija_se_koristi FOREIGN KEY(id_operacije)
		REFERENCES MasineMaterijali.operacija(id_operacije),
	CONSTRAINT FK_tip_masine_se_koristi FOREIGN KEY(id_tipa_masine)
		REFERENCES MasineMaterijali.tip_masine(id_tipa_masine),
	CONSTRAINT PK_se_koristi PRIMARY KEY(id_operacije,id_tipa_masine),
	CONSTRAINT CHK_broj_masina_value CHECK(broj_masina>=0)
)

CREATE TABLE MasineMaterijali.materijal
(
	id_materijala NUMERIC(5) PRIMARY KEY,
	naziv_materijala VARCHAR(20) NOT NULL,
	kolicina_materijala VARCHAR(3) NOT NULL,
	CONSTRAINT CHK_id_materijala_value CHECK(id_materijala>0)
)

CREATE SEQUENCE MasineMaterijali.materijal_sequence AS INT
START WITH 1
MINVALUE 1
INCREMENT BY 1
CYCLE

ALTER TABLE MasineMaterijali.materijal
ADD CONSTRAINT DFT_id_materijala DEFAULT(NEXT VALUE FOR MasineMaterijali.materijal_sequence) FOR id_materijala

CREATE TABLE MasineMaterijali.je_potreban
(
	potrebna_kolicina VARCHAR(8) NOT NULL,
	id_operacije NUMERIC(5),
	id_materijala NUMERIC(5),
	CONSTRAINT FK_operacija_je_potreban FOREIGN KEY(id_operacije)
		REFERENCES MasineMaterijali.operacija(id_operacije),
	CONSTRAINT FK_materijal_je_potreban FOREIGN KEY(id_materijala)
		REFERENCES MasineMaterijali.materijal(id_materijala),
	CONSTRAINT PK_je_potreban PRIMARY KEY(id_operacije,id_materijala)
)

CREATE TABLE MasineMaterijali.zahtev
(
	id_zahteva NUMERIC(8) PRIMARY KEY,
	registarski_broj VARCHAR(10),
	datum_podnosenja DATE NOT NULL,
	CONSTRAINT CHK_id_zahteva_value CHECK(id_zahteva>0)
)

CREATE TABLE MasineMaterijali.zahtev_za_ostale_usluge
(
	id_zahteva_za_ostale_usluge NUMERIC(8),
	id_vrste_usluge NUMERIC(8),
	CONSTRAINT FK_zahtev_zahtev_za_ostale_usluge FOREIGN KEY(id_zahteva_za_ostale_usluge)
		REFERENCES MasineMaterijali.zahtev(id_zahteva),
	CONSTRAINT PK_zahtev_za_ostale_usluge PRIMARY KEY(id_zahteva_za_ostale_usluge),
	CONSTRAINT FK_ostale_usluge_zahtev_za_ostale_usluge FOREIGN KEY(id_vrste_usluge)
		REFERENCES MasineMaterijali.ostale_usluge(id_vrste_usluge)
)

CREATE TABLE MasineMaterijali.radni_nalog
(
	id_radnog_naloga NUMERIC(8) NOT NULL UNIQUE,
	id_zahteva_za_ostale_usluge_rn NUMERIC(8),
	datum_kreiranja DATE NOT NULL,
	zakazan_termin TIME NOT NULL,
	broj_novih_guma NUMERIC(2),
	CONSTRAINT FK_zahtev_za_ostale_usluge_radni_nalog FOREIGN KEY(id_zahteva_za_ostale_usluge_rn)
		REFERENCES MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge),
	CONSTRAINT PK_radni_nalog PRIMARY KEY(id_zahteva_za_ostale_usluge_rn),
	CONSTRAINT CHK_id_radnog_naloga_value CHECK(id_radnog_naloga>0),
	CONSTRAINT CHK_broj_novih_guma_value CHECK(broj_novih_guma>=0)
)


CREATE TABLE MasineMaterijali.korak
(
	rbr_koraka NUMERIC(5) NOT NULL,
	id_zahteva_za_ostale_usluge_rn NUMERIC(8),
	id_vrste_usluge NUMERIC(8) NOT NULL,
	rbr_aktivnosti NUMERIC(5) NOT NULL,
	id_zahteva_za_ostale_usluge NUMERIC(8) NOT NULL,
	CONSTRAINT FK_aktivnost_korak FOREIGN KEY(id_vrste_usluge,rbr_aktivnosti)
		REFERENCES MasineMaterijali.aktivnost(id_vrste_usluge,rbr_aktivnosti),
	CONSTRAINT FK_zahtev_za_ostale_usluge_korak FOREIGN KEY(id_zahteva_za_ostale_usluge)
		REFERENCES MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge),
	CONSTRAINT FK_radni_nalog_korak FOREIGN KEY(id_zahteva_za_ostale_usluge_rn)
		REFERENCES MasineMaterijali.radni_nalog(id_zahteva_za_ostale_usluge_rn),
	CONSTRAINT PK_korak PRIMARY KEY(id_zahteva_za_ostale_usluge_rn,rbr_koraka),
	CONSTRAINT CHK_rbr_koraka_value CHECK(rbr_koraka>0)
)

CREATE TABLE MasineMaterijali.se_upotrebljava
(
	id_zahteva_za_ostale_usluge_rn NUMERIC(8),
	rbr_koraka NUMERIC(5),
	id_tipa_masine NUMERIC(2),
	rbr_masine NUMERIC(5),
	CONSTRAINT FK_korak_se_upotrebljava FOREIGN KEY(id_zahteva_za_ostale_usluge_rn,rbr_koraka)
		REFERENCES MasineMaterijali.korak(id_zahteva_za_ostale_usluge_rn,rbr_koraka),
	CONSTRAINT FK_masina_se_upotrebljava FOREIGN KEY(id_tipa_masine,rbr_masine)
		REFERENCES MasineMaterijali.masina(id_tipa_masine,rbr_masine),
	CONSTRAINT PK_se_upotrebljava PRIMARY KEY(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_tipa_masine,rbr_masine)
)

CREATE TABLE MasineMaterijali.upotrebljava
(
	kolicina_iskoriscenog_mat NUMERIC(10),
	id_zahteva_za_ostale_usluge_rn NUMERIC(8),
	rbr_koraka NUMERIC(5),
	id_materijala NUMERIC(5),
	CONSTRAINT FK_korak_upotrebljava FOREIGN KEY(id_zahteva_za_ostale_usluge_rn,rbr_koraka)
		REFERENCES MasineMaterijali.korak(id_zahteva_za_ostale_usluge_rn,rbr_koraka),
	CONSTRAINT FK_materijal_upotrebljava FOREIGN KEY(id_materijala)
		REFERENCES MasineMaterijali.materijal(id_materijala),
	CONSTRAINT PK_upotrebljava PRIMARY KEY(id_zahteva_za_ostale_usluge_rn,rbr_koraka,id_materijala)
)

