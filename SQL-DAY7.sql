/* ============================= SUBQUERIES ====================================
    SORGU içinde çalışan SORGUYA SUBQUERY (ALT SORGU) denilir.
==============================================================================*/

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
/* -----------------------------------------------------------------------------
  ORNEK1: Personel sayısı 15.000’den cok olan sirketlerin isimlerini ve bu 
  sirkette calisan personelin isimlerini ve maaşlarını listeleyin
 -----------------------------------------------------------------------------*/ 
 
 SELECT SIRKET,ISIM,MAAS FROM PERSONEL WHERE SIRKET 
 IN(SELECT SIRKET_ADI FROM SIRKETLER WHERE PERSONEL_SAYISI>15000);
  
 /* ----------------------------------------------------------------------------
  ORNEK2: sirket_id’si 101’den büyük olan şirket çalışanlarının isim, maaş ve 
  şehirlerini listeleyiniz. 
  
  -----------------------------------------------------------------------------*/
   SELECT ISIM,MAAS,SEHIR FROM PERSONEL WHERE SIRKET 
   IN(SELECT SIRKET_ADI FROM SIRKETLER WHERE SIRKET_ID > 101);
   
  /* -----------------------------------------------------------------------------
  ORNEK3: Ankara’da personeli olan şirketlerin şirket id'lerini ve personel 
  sayılarını listeleyiniz.
  
  -----------------------------------------------------------------------------*/ 
   SELECT SIRKET_ID, PERSONEL_SAYISI FROM SIRKETLER WHERE SIRKET_ADI 
   IN(SELECT SIRKET_ADI FROM PERSONEL WHERE SEHIR='Ankara');
  
  /* -----------------------------------------------------------------------------
  ORNEK4: Her şirketin ismini, personel sayısını ve o şirkete ait personelin
  toplam maaşını listeleyen bir Sorgu yazınız.
 -----------------------------------------------------------------------------*/
       SELECT SIRKET_ADI, PERSONEL_SAYISI,
       (SELECT SUM(MAAS) FROM PERSONEL WHERE SIRKET = SIRKETLER.SIRKET_ADI) 
       AS TOPLAM_MAAS FROM SIRKETLER;
      
      
      
      
 /* ===================== AGGREGATE METOT KULLANIMI ===========================
    Aggregate Metotları(SUM,COUNT, MIN,MAX, AVG) Subquery içinde kullanılabilir.
    Ancak, Sorgu tek bir değer döndüryor olmalıdır.
==============================================================================*/   
    
   
/* -----------------------------------------------------------------------------
  ORNEK5: Her şirketin ismini, personel sayısını ve o şirkete ait personelin
  ortalama maaşını listeleyen bir Sorgu yazınız.
 -----------------------------------------------------------------------------*/
 
     SELECT SIRKET_ADI,PERSONEL_SAYISI, 
    (SELECT ROUND(AVG(MAAS)) FROM PERSONEL WHERE SIRKET = SIRKETLER.SIRKET_ADI) 
     AS ORT_MAAS FROM SIRKETLER; 
    
 /* ----------------------------------------------------------------------------
  ORNEK6: Her şirketin ismini, personel sayısını ve o şirkete ait personelin
  maksimum ve minumum maaşını listeleyen bir Sorgu yazınız.
 -----------------------------------------------------------------------------*/          
    SELECT SIRKET_ADI,PERSONEL_SAYISI, 
    (SELECT MAX(MAAS) FROM PERSONEL WHERE SIRKET_ADI=SIRKET) AS MAX_MAAS,
    (SELECT MIN(MAAS) FROM PERSONEL WHERE SIRKET_ADI=SIRKET) AS MIN_MMAS
    FROM SIRKETLER;
    
      
/* -----------------------------------------------------------------------------
  ORNEK7: Her sirketin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
  listeleyen bir SORGU yazınız.
 -----------------------------------------------------------------------------*/
    SELECT SIRKET_ID, SIRKET_ADI, 
    (SELECT COUNT(SEHIR) FROM PERSONEL WHERE SIRKET=SIRKETLER.SIRKET_ADI) 
     AS SEHIR_SAYISI FROM SIRKETLER;
   
   
   
   
   
   
   
   
   
    
    