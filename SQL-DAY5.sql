/* ============================== UPDATE SET ===================================    
    
   Aşağıdaki gibi tedarikciler adında bir tablo oluşturunuz ve vergi_no
   sutununu primary key yapınız. Ayrıca aşağıdaki verileri tabloya giriniz.
        
==============================================================================*/  
    CREATE TABLE tedarikciler
    (
        vergi_no NUMBER(3),
        firma_ismi VARCHAR2(50),
        irtibat_ismi VARCHAR2(50),
        CONSTRAINT pk_ted PRIMARY KEY (vergi_no)
    ); 
    
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
    
    CREATE TABLE urunler
    (
        ted_vergino NUMBER(3), 
        urun_id NUMBER(11), 
        urun_isim VARCHAR2(50), 
        musteri_isim VARCHAR2(50),
        CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no) 
    );    
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
    
    SELECT * FROM tedarikciler;
    SELECT * FROM urunler;
   
    
    -- SYNTAX
    ----------
    -- UPDATE tablo_adı
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE koşul;
      
/* -----------------------------------------------------------------------------
  ORNEK1: vergi_no’su 101 olan tedarikcinin ismini 'LG' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
 UPDATE TEDARIKCILER SET FIRMA_ISMI='LG' WHERE VERGI_NO=101;
    
/* -----------------------------------------------------------------------------
  ORNEK2: Tedarikciler tablosundak tüm firma isimlerini 'Samsung' olarak 
  güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
    UPDATE TEDARIKCILER SET FIRMA_ISMI = 'SAMSUNG';
    
    DELETE FROM TEDARIKCILER;  
    
/* -----------------------------------------------------------------------------
  ORNEK3: vergi_no’su 102 olan tedarikcinin ismini 'Samsung' ve irtibat_ismi’ni 
  'Ali Veli' olarak güncelleyeniz. 
 -----------------------------------------------------------------------------*/ 
    UPDATE TEDARIKCILER SET FIRMA_ISMI='Samsung', IRTIBAT_ISMI='Ali Veli';
   
/* -----------------------------------------------------------------------------
  ORNEK4: firma_ismi Samsung olan tedarikcinin irtibat_ismini 'Ayşe Yılmaz' 
  olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/ 
   UPDATE TEDARIKCILER SET IRTIBAT_ISMI='Ayse Yilmaz' WHERE FIRMA_ISMI='Samsung';
    
/* -----------------------------------------------------------------------------
  ORNEK5: urunler tablosundaki 'Phone' değerlerini Telefon olarak güncelleyiniz.
 -----------------------------------------------------------------------------*/
   UPDATE URUNLER SET URUN_ISIM='Telefon' WHERE URUN_ISIM='Phone';
 
/* -----------------------------------------------------------------------------
  ORNEK6: urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id
  değerlerini bir arttırınız
 -----------------------------------------------------------------------------*/ 
     UPDATE URUNLER SET URUN_ID = URUN_ID+1 WHERE URUN_ID > 1004;
  
 /* ----------------------------------------------------------------------------
  ORNEK7: urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
  sutun değerleri ile toplayarak güncelleyiniz.
 -----------------------------------------------------------------------------*/  
   UPDATE URUNLER SET URUN_ID = URUN_ID + TED_VERGINO;
    
/*-----------------------------------------------------------------------------
 ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci 
 tablosunda irtibat_ismi 'Adam Eve' olan firmanın ismi (firma_ismi) ile 
 degistiriniz.
 -----------------------------------------------------------------------------*/
   UPDATE URUNLER SET URUN_ISIM =
   (SELECT FIRMA_ISMI FROM TEDARIKCILER WHERE IRTIBAT_ISMI ='Adam Eve')
   WHERE MUSTERI_ISIM = 'Ali Bak';
  
/*------------------------------------------------------------------------------
 ORNEK9: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
 degistirin
 -----------------------------------------------------------------------------*/
  
  UPDATE URUNLER SET MUSTERI_ISIM=
  (SELECT IRTIBAT_ISMI FROM TEDARIKCILER WHERE FIRMA_ISMI = 'Apple')
  	WHERE URUN_ISIM='Apple';
  
  
  
  
  
  
  
  
  
  

    