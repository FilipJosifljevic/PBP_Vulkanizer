--Prvi upit
--Izlistati redni broj masine, naziv njenog tipa, njenu oznaku, tezinu i godinu proizvodnje za sve neelektricne masine proizvedene posle 2016. godine,
--sortirati po godini proizvodnje rastuce i tezini opadajuce

SELECT m.rbr_masine AS 'Redni broj',tm.naziv_tipa_masine AS 'Naziv tipa mašine', oznaka_masine AS Oznaka, tezina AS 'Težina', godina_proizvodnje AS 'Godina proizvodnje'
FROM MasineMaterijali.masina m 
JOIN MasineMaterijali.se_upotrebljava su ON(m.id_tipa_masine+m.rbr_masine=su.id_tipa_masine+su.rbr_masine)
JOIN MasineMaterijali.korak k ON(su.id_zahteva_za_ostale_usluge_rn+su.rbr_koraka=k.id_zahteva_za_ostale_usluge_rn+k.rbr_koraka)
JOIN MasineMaterijali.radni_nalog rn ON(k.id_zahteva_za_ostale_usluge_rn=rn.id_zahteva_za_ostale_usluge_rn)
JOIN MasineMaterijali.tip_masine tm ON(m.id_tipa_masine=tm.id_tipa_masine)
WHERE m.napajanje=0 AND m.godina_proizvodnje>2016
ORDER BY m.godina_proizvodnje ASC, m.tezina DESC

--Drugi upit
--Izlistati ukupan broj masina laksih od 80kg koriscenih u zahtevima podnetim pre 1. januara 2020. godine, grupisanih po nazivu tipa, tezini i godini proizvodnje
SELECT COUNT(m.oznaka_masine) AS 'Broj mašina',naziv_tipa_masine AS 'Naziv tipa mašine',CONCAT(tezina,'kg') AS 'Težina',godina_proizvodnje AS 'Godina proizvodnje' FROM MasineMaterijali.masina m
JOIN MasineMaterijali.tip_masine tm ON(m.id_tipa_masine=tm.id_tipa_masine)
JOIN MasineMaterijali.se_upotrebljava su ON(m.id_tipa_masine+m.rbr_masine=su.id_tipa_masine+su.rbr_masine)
JOIN MasineMaterijali.korak k ON(su.id_zahteva_za_ostale_usluge_rn+su.rbr_koraka=k.id_zahteva_za_ostale_usluge_rn+k.rbr_koraka)
JOIN MasineMaterijali.radni_nalog rn ON(k.id_zahteva_za_ostale_usluge_rn=rn.id_zahteva_za_ostale_usluge_rn)
JOIN MasineMaterijali.zahtev z ON(rn.id_zahteva_za_ostale_usluge_rn=z.id_zahteva)
WHERE z.datum_podnosenja<'2020-01-01'
GROUP BY tm.naziv_tipa_masine, tezina, godina_proizvodnje
HAVING m.tezina<80

--Treci upit
--Izlistati ukupnu kolicinu materijala koriscenog u radnim nalozima gde nisu menjane gume
SELECT CONCAT('Upotrebljeno je ',SUM(kolicina_iskoriscenog_mat),' materijala ',LOWER(naziv_materijala),' u radnom nalogu ', id_radnog_naloga) AS 'Ukupna količina' FROM MasineMaterijali.upotrebljava u
JOIN MasineMaterijali.materijal m ON(u.id_materijala=m.id_materijala)
JOIN MasineMaterijali.radni_nalog rn ON(u.id_zahteva_za_ostale_usluge_rn=rn.id_zahteva_za_ostale_usluge_rn)
WHERE broj_novih_guma=0
GROUP BY naziv_materijala,id_radnog_naloga

--Cetvrti upit
--Izlistati sve zahteve koji su odradjeni za sva vozila registrovana u istom gradu kao i vozilo koje je platilo najjeftiniju uslugu
SELECT id_zahteva AS Zahtev,datum_podnosenja AS 'Datum podnošenja',registarski_broj AS Registracija FROM MasineMaterijali.zahtev z
JOIN MasineMaterijali.zahtev_za_ostale_usluge zou ON(z.id_zahteva=zou.id_zahteva_za_ostale_usluge)
JOIN MasineMaterijali.vrsta_usluge vu ON(zou.id_vrste_usluge=vu.id_vrste_usluge)
WHERE LEFT(z.registarski_broj,2) = LEFT((SELECT z.registarski_broj FROM MasineMaterijali.zahtev z
									JOIN MasineMaterijali.zahtev_za_ostale_usluge zou ON(z.id_zahteva=zou.id_zahteva_za_ostale_usluge)
									JOIN MasineMaterijali.vrsta_usluge vu ON(zou.id_vrste_usluge=vu.id_vrste_usluge)
									WHERE vu.cena = (SELECT TOP 1 cena FROM MasineMaterijali.vrsta_usluge ORDER BY cena)),2)

--Peti upit
--Izlistati naziv, i ukupno trajanje svih aktivnosti koji se sadrze u uslugama za koje su koriscene masine glasnije od 10db
SELECT naziv_vrste_usluge AS Usluga,naziv_aktivnosti AS Aktivnost, CONCAT('Ukupno su trajale : ', SUM(trajanje_aktivnosti), ' minuta') AS 'Ukupno trajanje' FROM MasineMaterijali.aktivnost a
JOIN MasineMaterijali.vrsta_usluge vu ON(a.id_vrste_usluge=vu.id_vrste_usluge)
JOIN MasineMaterijali.zahtev_za_ostale_usluge zou ON(vu.id_vrste_usluge=zou.id_vrste_usluge)
JOIN MasineMaterijali.radni_nalog rn ON(zou.id_zahteva_za_ostale_usluge=rn.id_zahteva_za_ostale_usluge_rn)
JOIN MasineMaterijali.se_upotrebljava su ON(rn.id_zahteva_za_ostale_usluge_rn=su.id_zahteva_za_ostale_usluge_rn)
JOIN MasineMaterijali.masina m ON(su.id_tipa_masine+su.rbr_masine=m.id_tipa_masine+m.rbr_masine)
WHERE m.nivo_buke>10
GROUP BY naziv_vrste_usluge,naziv_aktivnosti
ORDER BY SUM(trajanje_aktivnosti) DESC