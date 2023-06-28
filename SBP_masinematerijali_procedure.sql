--Prva procedura
IF OBJECT_ID('MasineMaterijali.usluge_procedura','P') IS NOT NULL
DROP PROC MasineMaterijali.usluge_procedura

GO
CREATE PROC MasineMaterijali.usluge_procedura
@godina AS INT
AS
BEGIN
	DECLARE @brusluga AS INT
	SET @brusluga = (SELECT COUNT(vu.id_vrste_usluge) FROM vrsta_usluge vu
					 JOIN zahtev_za_ostale_usluge zou ON(vu.id_vrste_usluge=zou.id_vrste_usluge)
					 JOIN zahtev z ON(zou.id_zahteva_za_ostale_usluge=z.id_zahteva)
					 WHERE DATEPART(year,z.datum_podnosenja)=@godina)

	IF @brusluga > 0
	BEGIN
		PRINT 'U godini ' + CAST(@godina AS VARCHAR) + ' odradjene su sledece usluge : '
	DECLARE @id_usluge AS INT
	DECLARE @naziv_usluge AS VARCHAR(30)
	DECLARE @cena AS INT


	DECLARE usluge_cursor CURSOR FOR
		SELECT vu.id_vrste_usluge, naziv_vrste_usluge, cena FROM vrsta_usluge vu
		JOIN zahtev_za_ostale_usluge zou ON(vu.id_vrste_usluge=zou.id_vrste_usluge)
		JOIN zahtev z ON(zou.id_zahteva_za_ostale_usluge=z.id_zahteva)
		WHERE DATEPART(year,z.datum_podnosenja)=@godina
		ORDER BY vu.id_vrste_usluge ASC

	OPEN usluge_cursor
	FETCH NEXT FROM usluge_cursor INTO @id_usluge, @naziv_usluge, @cena
	WHILE @@FETCH_STATUS=0
		BEGIN
			DECLARE @braktivnosti AS INT
			SET @braktivnosti = (SELECT COUNT(rbr_aktivnosti) FROM aktivnost WHERE id_vrste_usluge=@id_usluge)

			IF @braktivnosti > 0
				BEGIN
					PRINT 'Usluga ' + CAST(@id_usluge AS VARCHAR) + ' sa nazivom ' + @naziv_usluge + ' i cenom ' + CAST(@cena AS VARCHAR) + 'rsd ima sledece aktivnosti : '
					DECLARE @rbrak AS INT
					DECLARE @nazak AS VARCHAR(30)
					DECLARE @trajanje AS INT
			
					DECLARE aktivnosti_cursor CURSOR FOR 
						SELECT rbr_aktivnosti, naziv_aktivnosti, trajanje_aktivnosti FROM aktivnost a
						JOIN vrsta_usluge vu ON(a.id_vrste_usluge=vu.id_vrste_usluge)
						JOIN zahtev_za_ostale_usluge zou ON(vu.id_vrste_usluge=zou.id_vrste_usluge)
						JOIN zahtev z ON(zou.id_zahteva_za_ostale_usluge=z.id_zahteva)
						WHERE a.id_vrste_usluge=@id_usluge AND DATEPART(year,z.datum_podnosenja)=@godina
						ORDER BY rbr_aktivnosti ASC

					OPEN aktivnosti_cursor
					FETCH NEXT FROM aktivnosti_cursor INTO @rbrak, @nazak, @trajanje
					WHILE @@FETCH_STATUS=0
						BEGIN
							PRINT '		' + CAST(@rbrak AS VARCHAR) + '. ' + @nazak + ' traje ' + CAST(@trajanje AS VARCHAR) + 'min.'
							FETCH NEXT FROM aktivnosti_cursor INTO @rbrak, @nazak, @trajanje
						END
					CLOSE aktivnosti_cursor
					DEALLOCATE aktivnosti_cursor
					
				END
			ELSE
				PRINT 'Usluga ' + CAST(@id_usluge AS VARCHAR) + ' sa nazivom ' + @naziv_usluge + ' i cenom ' + CAST(@cena AS VARCHAR) + 'rsd nema definisanih aktivnosti!'
			FETCH NEXT FROM usluge_cursor INTO @id_usluge, @naziv_usluge, @cena
		END
	CLOSE usluge_cursor
	DEALLOCATE usluge_cursor
	END
	ELSE
		PRINT 'U godini ' + CAST(@godina AS VARCHAR) + ' nije izvrsena nijedna usluga'
	
END

	EXEC MasineMaterijali.usluge_procedura
	@godina = 2019 --ispravna

	EXEC MasineMaterijali.usluge_procedura
	@godina = 2020 --usluge koje nemaju aktivnosti

	EXEC MasineMaterijali.usluge_procedura
	@godina = 2018 -- nema usluga

--Druga procedura
IF OBJECT_ID('MasineMaterijali.masine_procedura','P') IS NOT NULL
DROP PROC MasineMaterijali.masine_procedura

GO
CREATE PROC MasineMaterijali.masine_procedura
@idzahteva AS INT
AS
BEGIN

	IF (@idzahteva NOT IN (SELECT id_zahteva_za_ostale_usluge_rn FROM MasineMaterijali.se_upotrebljava))
		PRINT 'Zahtev jos nije obradjen u radnom nalogu!'
	ELSE
		BEGIN
			DECLARE @idtipamasine AS INT
			DECLARE @nazivtipamasine AS VARCHAR(30)

			DECLARE tip_masine_cursor CURSOR FOR
				SELECT DISTINCT tm.id_tipa_masine, naziv_tipa_masine FROM MasineMaterijali.tip_masine tm
				JOIN MasineMaterijali.se_upotrebljava su ON(tm.id_tipa_masine=su.id_tipa_masine)
				JOIN zahtev z ON(su.id_zahteva_za_ostale_usluge_rn=z.id_zahteva)
				WHERE z.id_zahteva=@idzahteva
			OPEN tip_masine_cursor
			FETCH NEXT FROM tip_masine_cursor INTO @idtipamasine, @nazivtipamasine
			WHILE @@FETCH_STATUS=0
				BEGIN
					PRINT 'Iskoriscen je tip masine : ' + CAST(@idtipamasine AS VARCHAR) + '. ' + @nazivtipamasine
					DECLARE @rbrmasine AS INT
					DECLARE @oznaka_masine AS VARCHAR(20)
					DECLARE @snagamotora AS INT
					DECLARE @nivobuke AS INT
					DECLARE @napajanje AS INT
					DECLARE @tezina AS INT
					DECLARE @godinaproiz AS INT

					DECLARE masina_cursor CURSOR FOR
						SELECT DISTINCT m.rbr_masine, oznaka_masine, snaga_motora, nivo_buke, napajanje, tezina, godina_proizvodnje FROM MasineMaterijali.masina m
						JOIN MasineMaterijali.tip_masine tm ON(m.id_tipa_masine=tm.id_tipa_masine)
						JOIN MasineMaterijali.se_upotrebljava su ON(tm.id_tipa_masine=su.id_tipa_masine)
						JOIN zahtev z ON(su.id_zahteva_za_ostale_usluge_rn=z.id_zahteva)
						WHERE m.id_tipa_masine=@idtipamasine AND z.id_zahteva=@idzahteva
					OPEN masina_cursor
					FETCH NEXT FROM masina_cursor INTO @rbrmasine, @oznaka_masine, @snagamotora, @nivobuke, @napajanje, @tezina, @godinaproiz
					WHILE @@FETCH_STATUS=0
						BEGIN
							PRINT CAST(@rbrmasine AS VARCHAR) + '. ' + @oznaka_masine + ' sa snagom ' + CAST(@snagamotora AS VARCHAR) + ',nivoom buke ' + CAST(@nivobuke AS VARCHAR) + 'dB, napajanjem ' + CAST(@napajanje AS VARCHAR) + 'V, tezinom ' + CAST(@tezina AS VARCHAR) + 'kg, proizvedena ' + CAST(@godinaproiz AS VARCHAR) + '. godine'
							FETCH NEXT FROM masina_cursor INTO @rbrmasine, @oznaka_masine, @snagamotora, @nivobuke, @napajanje, @tezina, @godinaproiz
						END
					CLOSE masina_cursor
					DEALLOCATE masina_cursor
					FETCH NEXT FROM tip_masine_cursor INTO @idtipamasine, @nazivtipamasine
				END
			CLOSE tip_masine_cursor
			DEALLOCATE tip_masine_cursor
		END
	
END

	EXEC MasineMaterijali.masine_procedura
	@idzahteva = 2 --nije obradjen
	EXEC MasineMaterijali.masine_procedura
	@idzahteva = 4 --obradjen


SELECT * FROM MasineMaterijali.se_upotrebljava