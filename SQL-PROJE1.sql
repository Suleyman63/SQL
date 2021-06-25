CREATE TABLE calisanlar
(

id CHAR(4),
isim VARCHAR2(50),
maas NUMBER(5),
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000); 
INSERT INTO calisanlar VALUES( '1002', 'Mehmet Yılmaz' ,12000); 
INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);


CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR2(50),
ek_gelir NUMBER(5),
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);

INSERT INTO aileler VALUES('1001', 4, 2000); 
INSERT INTO aileler VALUES('1002', 2, 1500); 
INSERT INTO aileler VALUES('1003', 1, 2200); 
INSERT INTO aileler VALUES('1004', 3, 2400);

SELECT * FROM calisanlar;
SELECT * FROM aileler; 

/*==========================================================================================================================================
1-) Veli Han'ın maaşına %20 zam yapacak update komutunu yazınız. Güncellemeden sonra calisanlar tablosu aşağıda görüldüğü gibi olmalıdır.
============================================================================================================================================*/

 UPDATE CALISANLAR SET MAAS = MAAS*1.20 WHERE ISIM = 'Veli Han';



/*==========================================================================================================================================
2-) Maaşı ortalamanın altında olan çalışanların maaşına %20 zam yapınız. Komut sonrası görünüm aşağıdaki gibidir.
============================================================================================================================================*/

UPDATE CALISANLAR SET MAAS =MAAS*1.2 
WHERE MAAS<(SELECT AVG(MAAS) FROM CALISANLAR);

/*==========================================================================================================================================
3-) Çalışanların isim ve cocuk_sayisi'ni listeleyen bir sorgu yazınız. Komut sonrası görünüm aşağıdaki gibidir.
============================================================================================================================================*/
SELECT C.ISIM,A.COCUK_SAYISI 
FROM CALISANLAR C
FULL JOIN AILELER A 
ON C.ID=A.ID;

/*==========================================================================================================================================
4-) calisanlar' ın id, isim ve toplam_gelir'lerini gösteren bir sorgu yazınız. toplam_gelir = calisanlar.maas + aileler.ek_gelir
============================================================================================================================================*/

SELECT ID,ISIM (SELECT SUM(MAAS+EK_GELIR) 
FROM CALISANLAR WHERE AILELER=MAAS+EK_GELIR)
AS T_GELIR FROM AILELER;

/*==========================================================================================================================================
5-) Eğer bir ailenin kişi başı geliri 1000 TL den daha az ise o çalışanın -- maaşına ek %10 aile yardım zammı yapınız.
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
============================================================================================================================================*/

 UPDATE CALISANLAR SET MAAS=MAAS*1.1 WHERE 2000 > 
 (SELECT (EK_GELIR+CALISANLAR.MAAS)/(COCUK_SAYISI+2) 
 FROM AILELER WHERE AILELER.ID=CALISANLAR.ID);





