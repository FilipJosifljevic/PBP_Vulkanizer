--Prva funkcija
IF OBJECT_ID('MasineMaterijali.vrati_udeo','FN') IS NOT NULL
DROP FUNCTION MasineMaterijali.vrati_udeo
GO

CREATE FUNCTION MasineMaterijali.vrati_udeo
(
	@id_vrste_usluge AS INT,
	@datum AS DATE
)
RETURNS VARCHAR(150)
AS
BEGIN
	DECLARE @ukupnoodusluge AS NUMERIC(5)
	SET @ukupnoodusluge = (SELECT SUM(cena) FROM vrsta_usluge vu
						   JOIN zahtev_za_ostale_usluge zou ON (vu.id_vrste_usluge=zou.id_vrste_usluge)
						   JOIN zahtev z ON(zou.id_zahteva_za_ostale_usluge=z.id_zahteva)
						   WHERE z.datum_podnosenja<@datum)
	DECLARE @prosledjenausluga AS NUMERIC(5)
	SET @prosledjenausluga = (SELECT SUM(cena) FROM vrsta_usluge vu
						   JOIN zahtev_za_ostale_usluge zou ON (vu.id_vrste_usluge=zou.id_vrste_usluge)
						   JOIN zahtev z ON(zou.id_zahteva_za_ostale_usluge=z.id_zahteva)
						   WHERE z.datum_podnosenja<@datum AND vu.id_vrste_usluge=@id_vrste_usluge)
	DECLARE @udeo AS NUMERIC(5,2) = (@prosledjenausluga/@ukupnoodusluge)
	DECLARE @naziv AS VARCHAR(30) = (SELECT naziv_vrste_usluge FROM vrsta_usluge WHERE id_vrste_usluge=@id_vrste_usluge)
	RETURN CONCAT('Usluga ',@id_vrste_usluge,' sa nazivom ',@naziv,' ima udeo od ',ISNULL(CAST((@udeo*100) AS VARCHAR),0),'% od svih usluga izvršenih pre ', CAST(@datum AS VARCHAR))
END
GO

SELECT MasineMaterijali.vrati_udeo(2,'2020-01-01') AS Udeo

--Druga funkcija
IF OBJECT_ID('MasineMaterijali.vrati_materijal','FN') IS NOT NULL
DROP FUNCTION MasineMaterijali.vrati_materijal
GO


CREATE FUNCTION MasineMaterijali.vrati_materijal
(
	@grad AS VARCHAR(20),
	@godina AS INT
)
RETURNS INT
AS
BEGIN
	DECLARE @reg AS VARCHAR(2)
	SET @reg =
	CASE
		WHEN LOWER(@grad) = 'novi sad' THEN 'NS'
		WHEN LOWER(@grad) = 'beograd' THEN 'BG'
		WHEN LOWER(@grad) = 'pozarevac' THEN 'PO'
		WHEN LOWER(@grad) = 'kraljevo' THEN 'KV'
		WHEN LOWER(@grad) = 'nis' THEN 'NI'
		WHEN LOWER(@grad) = 'vrnjacka banja' THEN 'VB'
		WHEN LOWER(@grad)= 'novi pazar' THEN 'NP'
		ELSE NULL
	END
	
	DECLARE @materijal AS INT
	SET @materijal = (SELECT COUNT(DISTINCT naziv_materijala) FROM MasineMaterijali.materijal m
					  JOIN MasineMaterijali.upotrebljava u ON(m.id_materijala=u.id_materijala)
					  JOIN MasineMaterijali.zahtev z ON(u.id_zahteva_za_ostale_usluge_rn=z.id_zahteva)
					  WHERE LEFT(z.registarski_broj,2)=@reg AND DATEPART(year,z.datum_podnosenja)=@godina)
	RETURN @materijal
END
GO

PRINT CONCAT('Iskorisceno je ',MasineMaterijali.vrati_materijal('beograd',2019),' razlicitih materijala u zahtevima za vozila registrovana u prosledjenom gradu za prosledjenu godinu')