/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operatorü bir Boolean operatördür ve true - false değer döndürür. 
    EXISTS operatorü sıklıkla Subquery'lerde satırların doğruluğunu test etmek 
    için kullanılır.
    
    Eğer bir subquery (altsorgu) bir satırı döndürürse EXISTS operatörü de TRUE 
    değer döndürür. Aksi takdirde, FALSE değer döndürecektir.
    
    Özellikle altsorgularda hızlı kontrol işlemi gerçekleştirmek için kullanılır
==============================================================================*/
   
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
   
    DELETE FROM nisan_satislar;
    
       
/* -----------------------------------------------------------------------------
  ORNEK1: MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/       
    -- tablolara kısa isim vermek mümkündür. Böylece sorgularımızın daha kısa 
    -- gözükmesini sağlabiliriz.
    
    -- AS  -> bir sutuna kısa isim veriyor.
    -- Bir sorgu içerisinde  tabloya da kısa isim vermek mümkün. 
    -- tablo_Adi kısa_isim
    
    SELECT URUN_ID, MUSTERI_ISIM FROM MART_SATISLAR WHERE EXISTS 
    (SELECT URUN_ID FROM NISAN_SATISLAR WHERE MART_SATISLAR.URUN_ID=NISAN_SATISLAR.URUN_ID);

   
/* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
  NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/
 
   SELECT URUN_ISIM, MUSTERI_ISIM FROM NISAN_SATISLAR WHERE EXISTS 
   (SELECT URUN_ISIM FROM MART_SATISLAR WHERE NISAN_SATISLAR.URUN_ISIM =MART_SATISLAR.URUN_ISIM);
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak satılmayan ürünlerin URUN_ISIM'lerini 
  ve bu ürünleri NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
    SELECT URUN_ISIM,MUSTERI_ISIM FROM NISAN_SATISLAR WHERE NOT EXISTS 
    (SELECT URUN_ID FROM MART_SATISLAR WHERE NISAN_SATISLAR.URUN_ISIM=MART_SATISLAR.URUN_ISIM);
   
       
 /*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadığını kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eğer aldığı tüm ifadeler NULL ise NULL döndürürür.
    
    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

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
/* ----------------------------------------------------------------------------
    ORNEK1: isim 'i NULL olanları sorgulayınız.
 -----------------------------------------------------------------------------*/     
    SELECT * FROM INSANLAR WHERE ISIM IS NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK2: isim 'i NULL olmayanları sorgulayınız.
 -----------------------------------------------------------------------------*/  
   
    SELECT * FROM INSANLAR WHERE ISIM IS NOT NULL;
   
/* ----------------------------------------------------------------------------
  ORNEK3: isim 'i NULL olan kişilerin isim'ine NO NAME atayınız. 
-----------------------------------------------------------------------------*/   
   UPDATE INSANLAR SET ISIM='NO NAME' WHERE ISIM IS NULL;
  
/* ----------------------------------------------------------------------------
  ORNEK4:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayalım.
-----------------------------------------------------------------------------*/    
  UPDATE INSANLAR SET ADRES='ADRES GIRILMEDI' WHERE ADRES IS NULL; 
  
  
  UPDATE INSANLAR SET SSN='SSN GIR' WHERE SSN IS NULL;
       
    
/*================================ ORDER BY  ===================================
   ORDER BY cümleciği bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/       
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
    
/* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres'e göre sıralayarak sorgulayınız.
 -----------------------------------------------------------------------------*/ 
 
   SELECT * FROM KISILER ORDER BY ADRES;
       --- ASC gibi sıradı.

/* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas'a göre sıralayarak sorgulayınız.
 -----------------------------------------------------------------------------*/  
   SELECT * FROM KISILER ORDER BY MAAS;
 
 /* ----------------------------------------------------------------------------
  ORNEK3: kisiler tablosunu maas'a göre AZALAN sırada sorgulayınız.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM KISILER ORDER BY MAAS DESC ;
    -- Azalan
 
/* ----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanları, SSN'e göre AZALAN sırada sorgulayınız.
-----------------------------------------------------------------------------*/
    SELECT * FROM KISILER WHERE ISIM='Mine' ORDER BY SSN DESC ;
   
   
/* ----------------------------------------------------------------------------
  ORNEK5: soyismi 'i Bulut olanları isim sıralı olarak sorgulayınız.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM KISILER WHERE SOYISIM ='Bulut' ORDER BY ISIM;
   
   -- isim'e göre sıralanmış
     
       
/*====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ) ======================
   FETCH cümleciği ile listelenecek kayıtları sınırlandırabiliriz. İstersek 
   satır sayısına göre istersek de toplam satır sayısının belli bir yüzdesine 
   göre sınırlandırma koymak mümkündür. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET Cümleciği ile de listenecek olan satırlardan sırasıyla istediğimiz 
   kadarını atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET satır_sayisi ROWS;
  
==============================================================================*/ 
/* ----------------------------------------------------------------------------
  ORNEK1: MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyen sorguyu yazınız.
-----------------------------------------------------------------------------*/
    
    SELECT * FROM KISILER ORDER BY MAAS DESC FETCH NEXT 3 ROWS ONLY; 
   
   
/* ----------------------------------------------------------------------------
  ORNEK2: MAAŞ'ı en DÜŞÜK 2 kişinin bilgilerini listeleyen sorguyu yazınız.
-----------------------------------------------------------------------------*/
    SELECT * FROM KISILER ORDER BY MAAS ASC FETCH NEXT 2 ROWS ONLY;
    
   
/* ----------------------------------------------------------------------------
  ORNEK3: MAAŞ'a göre sıralamada 4. ile 6. kişilerin bilgilerini listeleyen 
  sorguyu yazınız.
-----------------------------------------------------------------------------*/     
    SELECT * FROM KISILER ORDER BY MAAS DESC OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;
            -- ilk 3 kaydı atladık
   			 -- sonraki 3 kaydı seçtik.
    
   
   
   
   
   
   
   
   
   
   