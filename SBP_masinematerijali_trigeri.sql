--Prvi triger
IF OBJECT_ID('MasineMaterijali.radni_nalog_trigger','TR') IS NOT NULL
DROP TRIGGER MasineMaterijali.radni_nalog_trigger

GO
CREATE TRIGGER MasineMaterijali.radni_nalog_trigger
ON MasineMaterijali.radni_nalog
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @idnaloga AS INT
	SET @idnaloga = (SELECT id_radnog_naloga FROM inserted)
	DECLARE @termin AS TIME(7)
	SET @termin = (SELECT zakazan_termin FROM inserted)
	DECLARE @brojguma AS INT
	SET @brojguma = (SELECT broj_novih_guma FROM inserted)
	DECLARE @datumrn AS DATE
	SET @datumrn = (SELECT datum_kreiranja FROM inserted)
	DECLARE @idzahteva AS INT
	SET @idzahteva = (SELECT id_zahteva_za_ostale_usluge_rn FROM inserted)
	DECLARE @datumzahteva AS DATE
	SET @datumzahteva = (SELECT datum_podnosenja FROM zahtev z
						JOIN zahtev_za_ostale_usluge zou ON(z.id_zahteva=zou.id_zahteva_za_ostale_usluge)
						JOIN radni_nalog rn ON(zou.id_zahteva_za_ostale_usluge=rn.id_zahteva_za_ostale_usluge_rn)
						WHERE rn.id_zahteva_za_ostale_usluge_rn=@idzahteva)

	IF @datumrn < @datumzahteva
		BEGIN
			PRINT 'Datum kreiranja radnog naloga ne moze biti raniji od datuma podnosenja zahteva!'+CHAR(10)+'Datum ce biti podesen na sledeci moguci.'
			SET @datumrn = DATEADD(day,1,@datumzahteva)
			
			UPDATE MasineMaterijali.radni_nalog
			SET datum_kreiranja=@datumrn
			WHERE id_radnog_naloga=@idnaloga
		END
END
GO


DELETE FROM MasineMaterijali.radni_nalog WHERE id_radnog_naloga=11
DELETE FROM MasineMaterijali.zahtev_za_ostale_usluge WHERE id_zahteva_za_ostale_usluge=11
DELETE FROM MasineMaterijali.zahtev WHERE id_zahteva=11
INSERT INTO MasineMaterijali.zahtev(id_zahteva,registarski_broj,datum_podnosenja)
VALUES(11,'NS-1234-AA','2021-03-05')
INSERT INTO MasineMaterijali.zahtev_za_ostale_usluge(id_zahteva_za_ostale_usluge, id_vrste_usluge)
VALUES(11,4)

	INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma) --dobar datum
	VALUES(11,11,'2021-03-24',' 12:30:00',0)
	INSERT INTO MasineMaterijali.radni_nalog(id_radnog_naloga, id_zahteva_za_ostale_usluge_rn, datum_kreiranja, zakazan_termin, broj_novih_guma) --los datum
	VALUES(11,11,'2021-02-05',' 12:30:00',0)

SELECT * FROM MasineMaterijali.zahtev_za_ostale_usluge
SELECT * FROM MasineMaterijali.vrsta_usluge
SELECT * FROM MasineMaterijali.radni_nalog

--Drugi triger
IF OBJECT_ID('MasineMaterijali.evidencija_mat','U') IS NOT NULL
DROP TABLE MasineMaterijali.evidencija_mat

CREATE TABLE MasineMaterijali.evidencija_mat
(
	id_materijala INT,
	stara_kolicina INT,
	nova_kolicina INT,
	datum_izmene DATETIME
)

IF OBJECT_ID('MasineMaterijali.materijal_trigger','TR') IS NOT NULL
DROP TRIGGER MasineMaterijali.materijal_trigger

GO
CREATE TRIGGER MasineMaterijali.materijal_trigger
ON MasineMaterijali.materijal
AFTER UPDATE
AS
BEGIN
	IF UPDATE(kolicina_materijala)
	BEGIN
		DECLARE @idmat AS INT
		SET @idmat = (SELECT id_materijala FROM inserted)
		DECLARE @naziv AS VARCHAR(20)
		SET @naziv = (SELECT naziv_materijala FROM inserted)
		DECLARE @stara_kol AS INT
		SET @stara_kol = (SELECT kolicina_materijala FROM deleted)
		DECLARE @nova_kol AS INT
		SET @nova_kol = (SELECT kolicina_materijala FROM inserted)
		
		IF @nova_kol!=@stara_kol
			BEGIN
				IF @nova_kol<@stara_kol
					PRINT 'Oduzeto je ' + CAST((@stara_kol-@nova_kol) AS VARCHAR) + ' jedinica materijala ' + @naziv + ' sa skladista.'
				ELSE IF @nova_kol>@stara_kol
					PRINT 'Dodato je ' + CAST((@nova_kol-@stara_kol) AS VARCHAR) + ' jedinica materijala ' + @naziv + ' u skladiste.'
				ELSE IF @nova_kol = 0
					PRINT 'Nema vise materijala : ' + @naziv + ' na skladistu.'

				INSERT INTO evidencija_mat(id_materijala,stara_kolicina,nova_kolicina,datum_izmene)
				VALUES(@idmat,@stara_kol,@nova_kol,SYSDATETIME())
			END
		ELSE
			PRINT 'Kolicina materijala ' + @naziv + ' je nepromenjena!'
	END
END

	UPDATE MasineMaterijali.materijal
	SET kolicina_materijala=60
	WHERE id_materijala=1

SELECT * FROM MasineMaterijali.evidencija_mat