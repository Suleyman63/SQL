
---- QUERY ----
CREATE TABLE ogrenciler
(
std_id VARCHAR(4),
std_name VARCHAR2(20),
std_age NUMBER

)


INSERT INTO ogrenciler VALUES('1001', 'Mehmet Yilmaz', 25);
INSERT INTO ogrenciler VALUES('1002', 'Mahmut Sefer', 35);
INSERT INTO ogrenciler VALUES('1003', 'Kemal Yilman', 35);
INSERT INTO ogrenciler VALUES('1004', 'Yakup Kirkalti', 23);
INSERT INTO ogrenciler VALUES('1005', 'Betul Ozgur', 27);
INSERT INTO ogrenciler VALUES('1006', 'Mustafa Yavuz', 21);
INSERT INTO ogrenciler VALUES('1007', 'Hulya Yanliz', 29);

SELECT * FROM ogrenciler;

SELECT * FROM ogrenciler WHERE std_id IN('1001','1004');

SELECT * FROM ogrenciler WHERE std_id BETWEEN '1001' AND '1006';

SELECT std_id,std_name FROM ogrenciler WHERE std_name ='Mehmet Yilmaz';

SELECT std_name FROM ogrenciler WHERE std_id IN('1001','1003') ORDER BY std_age;

SELECT std_name FROM OGRENCILER o WHERE std_id BETWEEN '1001' AND '1005';

DROP TABLE OGRENCILER;




CREATE TABLE TALEBELER
(
ID NUMBER(5) PRIMARY KEY,
NAME VARCHAR(20),
SURNAME VARCHAR2(20),
AGE NUMBER(3) CHECK

);



INSERT INTO talebeler values('1','ali','kar',23);

SELECT * FROM TALEBELER;

ALTER TABLE TALEBELER ADD note NUMBER check;

UPDATE TALEBELER SET note=20 WHERE id='1';

DROP TABLE TALEBELER;



INSERT INTO TALEBELER VALUES(2, 'Mehmet', 'mutlu', 25, 80);
INSERT INTO TALEBELER VALUES(3, 'Mahmut', 'tur', 35, 90);
INSERT INTO TALEBELER VALUES(4, 'Kemal', 'er', 35, 78);
INSERT INTO TALEBELER VALUES(5, 'Yakup', 'ergul', 23, 77);
INSERT INTO TALEBELER VALUES(6, 'Betul', 'ersin', 27, 67);
INSERT INTO TALEBELER VALUES(7, 'Mustafa','inan', 21, 66);
INSERT INTO TALEBELER VALUES(8, 'Hulya', 'kartal', 29, 98);



SELECT AVG(note) FROM TALEBELER;


SELECT COUNT(age) FROM TALEBELER;


SELECT sum(note) FROM TALEBELER;



---- REGEXP ----

CREATE TABLE ogrenciler
(
id NUMBER(4),
name VARCHAR2(50),
adres VARCHAR2(100),
note NUMBER(3)
);


INSERT INTO ogrenciler VALUES(1001, 'Mehmet Yilmaz', 'Ankara', 75);
INSERT INTO ogrenciler VALUES(1002, 'Mahmut Sefer', 'Istanbul', 85);
INSERT INTO ogrenciler VALUES(1003, 'Kemal Yilman', 'Adana', 65);
INSERT INTO ogrenciler VALUES(1004, 'Yakup Kirkalti', 'Urfa', 73);
INSERT INTO ogrenciler VALUES(1005, 'Betul Ozgur', 'Antep', 87);
INSERT INTO ogrenciler VALUES(1006, 'Mustafa Yavuz', 'Maras', 91);
INSERT INTO ogrenciler VALUES(1007, 'Hulya Yanliz', 'Sinop', 69);


SELECT * FROM ogrenciler;


SELECT * FROM OGRENCILER WHERE note >80;


INSERT INTO OGRENCILER VAlues(1008, 'Halil Karma', 'Mersin', 77)


ALTER TABLE OGRENCILER ADD age NUMBER(2);


SELECT name, note FROM OGRENCILER WHERE note > 60;


SELECT * FROM OGRENCILER WHERE  id BETWEEN 1002 AND 1006;


SELECT * FROM OGRENCILER WHERE  id NOT BETWEEN 1002 AND 1006;


SELECT * FROM OGRENCILER WHERE id IN(1001,1003,1005,1007);


INSERT INTO OGRENCILER VAlues(1009, 'Cemile Kara', 'Mersin', 57, 13);


UPDATE OGRENCILER SET age=14 WHERE id=1001;


UPDATE OGRENCILER SET age=15 WHERE id IN(1002,1003,1004,1005,1006,1007,1008);


SELECT * FROM OGRENCILER WHERE id=1001 OR id=1002 OR id=1003 OR id=1005; 


SELECT * FROM ogrenciler WHERE name LIKE '_ah%';


SELECT * FROM ogrenciler WHERE name LIKE '_e%Y%';


SELECT * FROM ogrenciler WHERE name LIKE '__l%';


SELECT * FROM ogrenciler WHERE age LIKE 15;


SELECT * FROM ogrenciler WHERE note not LIKE 75;


SELECT * FROM ogrenciler WHERE note LIKE '___';


SELECT * FROM ogrenciler WHERE name LIKE 'M%';


SELECT * FROM OGRENCILER WHERE note LIKE '%5';


SELECT * FROM OGRENCILER WHERE name LIKE 'C_________a';


SELECT * FROM OGRENCILER WHERE name LIKE '%al%';


SELECT * FROM OGRENCILER WHERE note LIKE '--';



SELECT * FROM OGRENCILER WHERE REGEXP_LIKE(name, 'a$|p$', 'i'); 



SELECT * FROM OGRENCILER WHERE REGEXP_LIKE(name, 'h[a-z0-9]t','i'); 



---- UPDATE SET ----

DROP TABLE tedarikciler;

CREATE TABLE tedarikciler
(
vergi_no number(3),
firma_ismi varchar2(50),
irtibat_ismi varchar2(50),
CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
)

INSERT INTO TEDARIKCILER VALUES(101, 'APPLE', 'MERAL KUTLU');
INSERT INTO TEDARIKCILER VALUES(102, 'SONY', 'MURAT KUTLU');
INSERT INTO TEDARIKCILER VALUES(103, 'SAMSUNG', 'MELTEM KUTLU');
INSERT INTO TEDARIKCILER VALUES(104, 'SONY', 'MERAL KUTLU');
INSERT INTO TEDARIKCILER VALUES(105, 'LG', 'MERAL KUTLU');
INSERT INTO TEDARIKCILER VALUES(106, 'ERIKSON', 'MERAL KUTLU');
INSERT INTO TEDARIKCILER VALUES(107, 'APPLE', 'MERAL KUTLU');




CREATE TABLE urunler
(
vergi_no NUMBER(3),
urun_id Number(11),
urun_adi VARCHAR2(50),
musteri_adi VARCHAR2(50),
CONSTRAINT fk_urunler FOREIGN KEY(vergi_no) REFERENCES tedarikciler(vergi_no)
);


INSERT INTO URUNLER VALUES(101, 1001, 'LAPTOP', 'AYSE CAN');
INSERT INTO URUNLER VALUES(102, 1002, 'TABLET', 'ALI KAN');
INSERT INTO URUNLER VALUES(103, 1003, 'TELEFON', 'FATMA MUTLU');
INSERT INTO URUNLER VALUES(104, 1004, 'TV', 'AYSE CAN');
INSERT INTO URUNLER VALUES(105, 1005, 'KOLTUK', 'AYSE CAN');
INSERT INTO URUNLER VALUES(106, 1006, 'MASA', 'AYSE CAN');
INSERT INTO URUNLER VALUES(107, 1007, 'LAPTOP', 'AYSE CAN');



UPDATE TEDARIKCILER SET FIRMA_ISMI= 'LG' WHERE VERGI_NO=101;

UPDATE TEDARIKCILER SET firma_ismi ='samsung';

UPDATE TEDARIKCILER SET FIRMA_ISMI ='LG' WHERE VERGI_NO =102;

UPDATE TEDARIKCILER SET FIRMA_ISMI ='SONY', IRTIBAT_ISMI ='ALI VELI' WHERE VERGI_NO =103;

UPDATE TEDARIKCILER SET FIRMA_ISMI ='MOTOROLLA', IRTIBAT_ISMI ='MAHMUT SAGLAM' WHERE VERGI_NO =104;

UPDATE TEDARIKCILER SET IRTIBAT_ISMI ='AYSE YILMAZ' WHERE FIRMA_ISMI ='samsung';

UPDATE URUNLER SET URUN_ADI ='PHONE' WHERE URUN_ADI ='TELEFON';

UPDATE URUNLER SET URUN_ID=URUN_ID +1 WHERE URUN_ID >1004;

UPDATE URUNLER SET URUN_ID =URUN_ID + VERGI_NO;

UPDATE URUNLER SET URUN_ADI =
(SELECT FIRMA_ISMI FROM TEDARIKCILER WHERE irtibat_ismi ='MELTEM KUTLU')
WHERE MUSTERI_ADI ='AYSE CAN';


SELECT DISTINCT URUN_ID, URUN_ADI FROM URUNLER;


SELECT * FROM tedarikciler;


SELECT * FROM URUNLER;


---- DELETE ----

SELECT  * FROM OGRENCILER;

DELETE FROM OGRENCILER WHERE ID ='1001';

DELETE FROM OGRENCILER WHERE name ='Kemal Yilman';

DELETE FROM OGRENCILER WHERE name='Halil Karma' OR name='Cemile Kara';


DELETE FROM OGRENCILER WHERE id>'1004';


DELETE FROM OGRENCILER;


DROP TABLE OGRENCILER;




CREATE TABLE OGRENCILER
(
ID CHAR(3),
ISIM VARCHAR2(20),
VELI_ISIM VARCHAR2(20),
YAZILI_NOTU NUMBER(3),
CONSTRAINT TALEBE_PK PRIMARY KEY (ID)
)


INSERT INTO OGRENCILER VALUES(123,'ALI GEL','HASAN',75);
INSERT INTO OGRENCILER VALUES(124,'ALI CAN','HAKAN',55);
INSERT INTO OGRENCILER VALUES(125,'ALI KAN','HAVVA',45);
INSERT INTO OGRENCILER VALUES(126,'ALI CAN','HARUN',95);
INSERT INTO OGRENCILER VALUES(127,'AHMET GUL','HALIL',65);
INSERT INTO OGRENCILER VALUES(128,'MUSTAFA BAK','ALI',85);




CREATE TABLE NOTLAR
(
TALEBE_ID CHAR(3),
DERS_ADI VARCHAR2(20),
YAZILI_NOTU NUMBER(3),
CONSTRAINT NOTLAR_FK FOREIGN KEY (TALEBE_ID) REFERENCES OGRENCILER(ID) ON DELETE CASCADE
)


INSERT INTO NOTLAR VALUES('123','KIM',75);
INSERT INTO NOTLAR VALUES('124','FIZ',55);
INSERT INTO NOTLAR VALUES('125','MAT',45);
INSERT INTO NOTLAR VALUES('126','BIO',95);
INSERT INTO NOTLAR VALUES('127','SOS',65);
INSERT INTO NOTLAR VALUES('128','BIL',85);


SELECT ISIM, VELI_ISIM FROM OGRENCILER WHERE YAZILI_NOTU IN(SELECT DERS_ADI FROM NOTLAR WHERE NOTLAR.YAZILI_NOTU>55);



SELECT * FROM OGRENCILER;


SELECT * FROM NOTLAR; 




---- COUNT, SUM, MAX, MIN, ROUND, AVG ----

CREATE TABLE personel 
(
id NUMBER(9), 
isim VARCHAR2(50), 
sehir VARCHAR2(50), 
maas NUMBER(20), 
sirket VARCHAR2(20)
);
   
INSERT INTO personel VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO personel VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO personel VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
   
   
    
CREATE TABLE sirketler
(
sirket_id NUMBER(9), 
sirket_adi VARCHAR2(20), 
personel_sayisi NUMBER(20)
);
    
   
INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

SELECT *FROM sirketler;
SELECT * FROM personel;
   

   

SELECT sirket_adi, personel_sayisi,
(SELECT sum(maas) FROM personel 
WHERE sirket = sirketler.sirket_adi) AS toplam_maas
FROM sirketler;



SELECT sirket_adi, personel_sayisi,
(SELECT round (avg(maas)) FROM personel 
WHERE sirket = sirketler.sirket_adi) AS ort_maas
FROM sirketler;



SELECT sirket_adi, personel_sayisi, 
(SELECT max(maas) FROM personel WHERE sirket_adi = sirket) AS max_maas,
(SELECT MIN(maas) FROM personel WHERE sirket_adi = sirket) AS min_maas
FROM sirketler;



SELECT sirket_id, sirket_adi, 
(SELECT count(sehir) FROM personel WHERE sirket=sirketler.sirket_adi) AS sehir_sayisi
FROM sirketler;



---- WHERE EXISTS - WHERE NOT EXISTS ----

CREATE TABLE mart_satislar
(
urun_id number(10),
musteri_isim varchar2(50), 
urun_isim varchar2(50)
);
   
   
INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    
   
CREATE TABLE nisan_satislar 
(
urun_id number(10),
musteri_isim varchar2(50), 
urun_isim varchar2(50)
);
    
    
INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

SELECT * FROM mart_satislar;
SELECT * FROM nisan_satislar;


SELECT musteri_isim FROM MART_SATISLAR
WHERE EXISTS (SELECT urun_id FROM nisan_satislar WHERE MART_SATISLAR.urun_id = nisan_satislar.urun_id);
	
	
	
SELECT musteri_isim FROM nisan_satislar WHERE EXISTS (SELECT urun_isim FROM mart_satislar 
WHERE mart_satislar.urun_isim=nisan_satislar.urun_isim);
	
	
SELECT musteri_isim FROM MART_SATISLAR WHERE NOT EXISTS(SELECT URUN_ISIM FROM NISAN_SATISLAR WHERE mart_satislar.URUN_ISIM=nisan_satislar.URUN_ISIM);



---- ORDER BY ----

CREATE TABLE insanlar 
(
ssn CHAR(9),
isim VARCHAR2(50), 
adres VARCHAR2(50) 
);
	
    
INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
INSERT INTO insanlar (adres) VALUES('Sakarya');
INSERT INTO insanlar (ssn) VALUES('999111222');
	    
SELECT * FROM INSANLAR;
	   
	   
SELECT * FROM insanlar WHERE isim IS NULL;


SELECT * FROM insanlar WHERE isim IS not NULL;
  
  
UPDATE insanlar SET isim='NO NAME' WHERE isim IS NULL;
	 
	 
UPDATE insanlar SET 
isim=COALESCE(isim,'isim yok'), 
adres=COALESCE(adres,'adres yok'), 
ssn=COALESCE(ssn,'999999999');
	   
	   
   
CREATE TABLE kisiler 
(
ssn CHAR(9) PRIMARY KEY,
isim VARCHAR2(50), 
soyisim VARCHAR2(50), 
maas NUMBER,
adres VARCHAR2(50) 
);
    
   
INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');
   

SELECT * FROM kisiler;
   
   
SELECT * FROM KISILER ORDER BY adres;
  
SELECT * FROM KISILER ORDER BY adres DESC;
  
SELECT * FROM KISILER ORDER BY maas ASC;
  
SELECT * FROM kisiler WHERE isim='Mine' ORDER BY ssn DESC;
 
SELECT * FROM KISILER WHERE soyisim='Bulut' ORDER BY 2; --sutun sirasina gore sirala
 
SELECT * FROM KISILER ORDER BY maas DESC FETCH NEXT 3 ROWS ONLY;
  
SELECT * FROM KISILER ORDER BY maas ASC FETCH NEXT 2 ROWS ONLY;

SELECT * FROM KISILER ORDER BY maas DESC OFFSET 2 ROWS FETCH NEXT 3 ROWS only;



---- GROUP BY - HAVING - DISTINC ----

CREATE TABLE manav 
(
isim varchar2(50), 
urun_adi varchar2(50), 
urun_miktari number(9) 
);
    

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', '', 2);


   
SELECT isim, sum(urun_miktari) FROM manav GROUP BY isim;


SELECT urun_adi, count(isim) AS kisi_sayisi FROM manav WHERE urun_adi IS NOT NULL GROUP BY urun_adi ORDER BY count(isim) DESC;

SELECT urun_miktari, count(isim) AS top_urunmiktari FROM manav WHERE urun_miktari IS NOT NULL GROUP BY urun_miktari;


SELECT urun_adi, MIN(urun_miktari) AS min_urun_miktari, MAX(urun_miktari) AS max_urun_miktari
FROM manav WHERE urun_adi IS NOT NULL GROUP BY urun_adi ORDER BY MAX(urun_miktari) DESC;


SELECT isim, urun_adi, sum(urun_miktari) AS top_mik FROM manav GROUP BY isim, urun_adi ORDER BY isim DESC;


SELECT isim, urun_adi, sum(urun_miktari) AS top_mik FROM manav GROUP BY isim, urun_adi HAVING sum(urun_miktari) >=3 ORDER BY sum(urun_miktari) DESC;


SELECT urun_adi, MAX(urun_miktari) FROM manav
GROUP BY urun_adi HAVING MAX(urun_miktari) <> MIN(urun_miktari) ORDER BY max(urun_miktari);


SELECT count(DISTINCT urun_adi) FROM manav;


SELECT DISTINCT urun_adi,isim FROM manav;


SELECT sum(DISTINCT urun_miktari) AS urun_sayisi FROM manav;



---- SET OPERATORLERI // UNION, UNION ALL, INTERSECT, MINUS----
	

CREATE TABLE personel 
(
id NUMBER(9), 
isim VARCHAR2(50), 
sehir VARCHAR2(50), 
maas NUMBER(20), 
sirket VARCHAR2(20),
CONSTRAINT personel_pk PRIMARY KEY(id)
);
    


INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');

SELECT * FROM personel;



SELECT isim AS isim_veya_sehir FROM PERSONEL WHERE maas >4000 
UNION 
SELECT sehir FROM PERSONEL WHERE maas >5000;



SELECT isim AS isim_veya_sehir FROM PERSONEL WHERE maas >4000 
UNION ALL
SELECT sehir FROM PERSONEL WHERE maas >5000;



SELECT maas,isim AS isim_veya_sehir FROM PERSONEL WHERE isim='Mehmet Ozturk'
UNION ALL 
SELECT maas,SEHIR FROM PERSONEL WHERE SEHIR='Istanbul'
ORDER BY maas DESC;




CREATE TABLE personel_bilgi 
(
id NUMBER(9), 
tel char(10) UNIQUE , 
cocuk_sayisi NUMBER(2), 
CONSTRAINT fk_personel FOREIGN KEY (id) REFERENCES personel(id) 
); 



INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5);
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3); 
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(453445611, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

SELECT * FROM personel_bilgi;



SELECT sehir AS sehir_tel, maas AS maas_cocuk_sayisi FROM PERSONEL WHERE id = 123456789
UNION 
SELECT tel, cocuk_sayisi FROM personel_bilgi WHERE id = 123456789;



SELECT ID FROM PERSONEL WHERE SEHIR IN('Ankara', 'Istanbul')
INTERSECT 
SELECT ID FROM PERSONEL_BILGI WHERE COCUK_SAYISI IN(2,3);



SELECT isim FROM PERSONEL WHERE SIRKET='Honda'
INTERSECT 
SELECT isim FROM PERSONEL WHERE SIRKET='Tofas'
INTERSECT 
SELECT isim FROM PERSONEL WHERE SIRKET='Ford';



SELECT maas FROM PERSONEL WHERE SIRKET='Ford'
INTERSECT 
SELECT maas FROM PERSONEL WHERE SIRKET='Toyota';



SELECT isim,maas,sirket FROM personel WHERE maas < 5000
MINUS 
SELECT isim,maas,sirket FROM PERSONEL WHERE SIRKET = 'Honda';



SELECT isim,maas,sirket FROM personel WHERE maas < 5000
INTERSECT 
SELECT isim,maas,sirket FROM PERSONEL WHERE SIRKET != 'Honda';



SELECT ISIM,sehir FROM PERSONEL WHERE ISIM='Mehmet Ozturk'
MINUS 
SELECT ISIM,sehir FROM PERSONEL WHERE sehir='Istanbul';




-- JOIN --

CREATE TABLE sirketler 
(
sirket_id NUMBER(9), 
sirket_isim VARCHAR2(20)
);
    
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');


    
CREATE TABLE siparisler
(
siparis_id NUMBER(9),
sirket_id NUMBER(9), 
siparis_tarihi DATE
);
    
INSERT INTO siparisler VALUES(11, 101, '17-04-2020');
INSERT INTO siparisler VALUES(22, 102, '18-04-2020');
INSERT INTO siparisler VALUES(33, 103, '19-04-2020');
INSERT INTO siparisler VALUES(44, 104, '20-04-2020');
INSERT INTO siparisler VALUES(55, 105, '21-04-2020');

SELECT * FROM siparisler;
SELECT * FROM sirketler;



SELECT S.SIRKET_ISIM, SP.SIPARIS_ID, SP.SIPARIS_TARIHI, SP.SIRKET_ID
FROM SIRKETLER S
FULL JOIN SIPARISLER SP
ON S.SIRKET_ID = SP.SIRKET_ID;



SELECT S.SIRKET_ISIM, SP.SIPARIS_ID, SP.SIPARIS_TARIHI, SP.SIRKET_ID
FROM SIRKETLER S
INNER JOIN SIPARISLER SP
ON S.SIRKET_ID=SP.SIRKET_ID;



SELECT S.SIRKET_ISIM, SP.SIPARIS_ID, SP.SIPARIS_TARIHI, SP.SIRKET_ID
FROM SIRKETLER s
LEFT JOIN SIPARISLER SP ON S.SIRKET_ID =SP.SIRKET_ID;



SELECT SP.SIPARIS_ID, SP.SIPARIS_TARIHI, SP.SIRKET_ID, S.SIRKET_ISIM
FROM SIPARISLER SP
RIGHT JOIN SIRKETLER s ON SP.SIRKET_ID =S.SIRKET_ID;




-- ALTER TABLE ADD,RENAME,MODIFY --

CREATE TABLE bolumler 
(
 bolum_id   NUMBER(2) CONSTRAINT bolum_pk PRIMARY KEY,
 bolum_isim VARCHAR2(14),
 konum      VARCHAR2(13)
);
    
INSERT INTO bolumler VALUES (10,'MUHASABE','IST');
INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
   
   
​
CREATE TABLE personel 
(
  personel_id   NUMBER(4) CONSTRAINT personel_pk PRIMARY KEY,
  personel_isim VARCHAR2(10),
  meslek        VARCHAR2(9),
  mudur_id      NUMBER(4),
  ise_baslama   DATE,
  maas          NUMBER(7,2),
  bolum_id      NUMBER(2) 
);
    
  
INSERT INTO personel VALUES (7369,'AHMET','KATIP',7902,'17-12-1980',800,20);
INSERT INTO personel VALUES (7499,'BAHATTIN','SATIS',7698,'20-2-1981',1600,30);
INSERT INTO personel VALUES (7521,'NESE','SATIS',7698,'22-2-1981',1250,30);
INSERT INTO personel VALUES (7566,'MUZAFFER','MUDUR',7839,'2-4-1981',2975,20);
INSERT INTO personel VALUES (7654,'MUHAMMET','SATIS',7698,'28-9-1981',1250,30);
INSERT INTO personel VALUES (7698,'EMINE','MUDUR',7839,'1-5-1981',2850,30);
INSERT INTO personel VALUES (7782,'HARUN','MUDUR',7839,'9-6-1981', 2450,10);
INSERT INTO personel VALUES (7788,'MESUT','ANALIST',7566,'13-07-87',3000,20);
INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,'17-11-1981',5000,10);
INSERT INTO personel VALUES (7844,'DUYGU','SATIS',7698,'8-9-1981',1500,30);
INSERT INTO personel VALUES (7876,'ALI','KATIP',7788,'13-07-87',1100,20);
INSERT INTO personel VALUES (7900,'MERVE','KATIP',7698,'3-12-1981',950,30);
INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',7566,'3-12-1981',3000,20);
INSERT INTO personel VALUES (7934,'EBRU','KATIP',7782,'23-1-1982',1300,10);
INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',7782,'29-1-1991',3300,60);
INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',7782,'26-1-1987',4300,60);
     
SELECT * FROM personel;
   
SELECT * FROM bolumler;
   
   
ALTER TABLE personel ADD ulke_isim varchar2(20) DEFAULT 'Turkiye';

  
ALTER TABLE personel add(cinsiyet varchar2(20), yas NUMBER(3));


ALTER TABLE personel DROP COLUMN yas;


ALTER TABLE personel RENAME COLUMN ulke_isim TO ulke_adi;


ALTER TABLE personel RENAME TO isciler;


SELECT * FROM isciler;


DELETE FROM isciler WHERE personel_isim='AHMET';


ALTER TABLE isciler MODIFY ulke_adi VARCHAR2(40) NOT NULL;


ALTER TABLE ISCILER MODIFY MAAS CHECK (MAAS >= 3500);


DROP TABLE ISCILER;


ALTER TABLE PERSONEL MODIFY ulke_adi VARCHAR2(40) NOT NULL;


ALTER TABLE PERSONEL MODIFY maas CHECK (maas >= 3500);



SELECT P.personel_isim, B.BOLUM_ISIM
FROM BOLUMLER B
JOIN PERSONEL P 
ON B.BOLUM_ID =P.BOLUM_ID
WHERE B.BOLUM_ID IN(10,30)
ORDER BY B.BOLUM_ID, P.PERSONEL_ISIM;



SELECT B.BOLUM_ISIM, P.personel_isim, P.ise_baslama
FROM BOLUMLER B
FULL JOIN PERSONEL P 
ON B.BOLUM_ID =P.BOLUM_ID
WHERE B.BOLUM_ID IN(40,30,50)
ORDER BY P.PERSONEL_ISIM;

























