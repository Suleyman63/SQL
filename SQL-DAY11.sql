/*=============================== ALTER TABLE ==================================
    
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin 
    kullanilir.
    
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de
    kullanilir.
   
==============================================================================*/

    CREATE TABLE personel 
    (
        id NUMBER(9), 
        isim VARCHAR2(50), 
        sehir VARCHAR2(50), 
        maas NUMBER(20), 
        sirket VARCHAR2(20),
        CONSTRAINT personel_pk PRIMARY KEY (id)
    );


    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
  
    
      SELECT * FROM PERSONEL;
/* -----------------------------------------------------------------------------
  ORNEK1: personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan 
  yeni bir sutun ekleyiniz.
------------------------------------------------------------------------------*/ 
    ALTER TABLE PERSONEL ADD ULKE_ISIM VARCHAR(20) DEFAULT 'TURKIYE';
   
      SELECT * FROM PERSONEL;
/* -----------------------------------------------------------------------------
  ORNEK2: personel tablosuna cinsiyet Varchar2(20) ve yas Number(3) seklinde 
  yeni sutunlar ekleyiniz.
------------------------------------------------------------------------------*/  
   ALTER TABLE PERSONEL ADD (CINSIYET VARCHAR2(20), YAS NUMBER(3));
    
/* -----------------------------------------------------------------------------
  ORNEK3: personel tablosundan yas sutununu siliniz. 
------------------------------------------------------------------------------*/ 
  ALTER TABLE PERSONEL DROP COLUMN YAS;
    
    
/* -----------------------------------------------------------------------------
  ORNEK4: personel tablosundaki ulke_isim sutununun adini ulke_adi olarak 
  degistiriniz. 
------------------------------------------------------------------------------*/  
    ALTER TABLE PERSONEL RENAME COLUMN ULKE_ISIM TO ULKE_ADI;
    
   
/* -----------------------------------------------------------------------------
  ORNEK5: personel tablosunun adini isciler olarak degistiriniz. 
------------------------------------------------------------------------------*/  
    ALTER TABLE PERSONEL RENAME TO ISCILER; 
   
   ALTER TABLE ISCILER RENAME TO PERSONEL;
    
/* -----------------------------------------------------------------------------
  ORNEK6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz. 
------------------------------------------------------------------------------*/ 
   ALTER TABLE PERSONEL MODIFY ULKE_ADI VARCHAR2(20) NOT NULL;   
   											-- Hme veri tipini degistirik hem de 
                                            -- NOT NULL kisitlamasi ekledik.
    
    ALTER TABLE PERSONEL MODIFY ISIM CHAR(100);    -- Veritipini CHAR(100) olarak degistirdik.
    
    ALTER TABLE PERSONEL MODIFY MAAS CHECK (MAAS>=3500);  -- Maas alt limit kisitlamasi atadik.
   
    INSERT INTO PERSONEL VALUES(123452310, 'Hatice Sahin', 'Bursa', 3000,'Almanya', 'Kadın');
    