/*============================== JOIN İSLEMLERİ ===============================
    
    Set Operatorleri (Union,Intersect,Minus) farklı tablolardaki sutunlari 
    birlestirmek kullanilir.
    
    Join islemleri ise farklı Tablolari birlestirmek icin kullanilir. Diger 
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo 
    olusturmak icin kullanilabilir.
    
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
    icin JOIN islemleri kullanilabilir.
    
    ORACLE SQL'de 4 Cesit Join isemi kullanilabilmektedir.
    1) FULL JOIN:  Tablodaki tum sonuclari gosterir
    2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir
   
==============================================================================*/   
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
    
    INSERT INTO siparisler VALUES(11, 101, '17-Apr-2020');
    INSERT INTO siparisler VALUES(22, 102, '18-Apr-2020');
    INSERT INTO siparisler VALUES(33, 103, '19-Apr-2020');
    INSERT INTO siparisler VALUES(44, 104, '20-Apr-2020');
    INSERT INTO siparisler VALUES(55, 105, '21-Apr-2020');

    SELECT * FROM siparisler;
    SELECT * FROM sirketler;
    
  
      
/*=============================== FULL JOIN  ==================================
    
    FULL JOIN, Her iki tablo icin secilen sutunlara ait olan tum satirlari 
    getirmek icin kullanilir. 
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    FULL JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/   
   
/* -----------------------------------------------------------------------------
  ORNEK1: sirketler ve siparisler adındaki tablolarda yer alan sirket_isim, 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/ 
    
   SELECT S.SIRKET_ISIM,SIP.SIPARIS_ID,SIP.SIPARIS_TARIHI,SIP.SIRKET_ID 
   FROM SIRKETLER S 
   FULL JOIN SIPARISLER SIP 
   ON SIP.SIRKET_ID=S.SIRKET_ID;
    
    -- FULL Join'de iki tabloda var olan tum satirlar gosterilir.
    -- Bir olupda digerlerine olmayan alanlar bo birakildi.
    -- Join isleminde genelde iki tablodaki ortak olarak bulunan sutun, ON 
    -- cumleciginde kosul yapisi kullanilir.
    
    
      
 /*=============================== INNER JOIN  ==================================
    
    Iki tablonun kesisim kumesi ile yeni bir tablo olusturmak icin kullanilir.
    
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    INNER JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
================================================================================  
    
  
/* -----------------------------------------------------------------------------
  ORNEK2: Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve 
  siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/  
    SELECT S.SIRKET_ISIM,SIP.SIPARIS_ID,SIP.SIPARIS_TARIHI,SIP.SIRKET_ID
    FROM SIRKETLER s 
    INNER JOIN SIPARISLER SIP 
    ON S.SIRKET_ID=SIP.SIRKET_ID;
    
    -- INNER JOIN ile sadece iki tabloki ortak olan satilar secilir.
    -- Diger ifadeyle iki tablodaki ortak olan sirket_id degerleri icin ilgili 
    -- sutunlar listenir.
    
    -- INNER anahtar kelimesi opsiyoneldir.
    
        
/*=============================== LEFT JOIN  ==================================
    
    LEFT JOIN, 1. tablodan (sol tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
        
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    LEFT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/  
            
/* -----------------------------------------------------------------------------
  ORNEK3: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan 
  siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
    
    SELECT SIP.SIPARIS_ID, SIP.SIPARIS_TARIHI, S.SIRKET_ISIM, SIP.SIRKET_ID
    FROM SIRKETLER S 
    LEFT JOIN SIPARISLER SIP 
    ON SIP.SIRKET_ID =S.SIRKET_ID;
    
    -- Left Join’de ilk tablodaki tum satirlar gosterilir.
    -- Ilk tablodaki satirlara 2.tablodan kosula uyan ortak satirlar gosterilir
    -- ancak ortak olmayan kisimlar bos kalir
          
/*=============================== RIGHT JOIN  ==================================
    
    RIGHT JOIN, 2. tablodan (sag tablo) SELECT ile ifade edilen sutunlara ait tum
    satirlari getirir. 
    Ancak, diger tablodan sadece ON ile belirtilen kosula uyan satirlari getirir. 
        
    Syntax
    -----------
    SELECT sutun1,sutun2....sutunN
    FROM tablo1 
    RIGHT JOIN tablo2
    ON tablo1.sutun = tablo2.sutun;
==============================================================================*/   
      
/* -----------------------------------------------------------------------------
  ORNEK4: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile 
  bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
------------------------------------------------------------------------------*/   
     SELECT S.SIRKET_ISIM, SIP.SIPARIS_ID, SIP.SIPARIS_TARIHI, SIP.SIRKET_ID FROM SIRKETLER S 
     RIGHT JOIN SIPARISLER SIP 
     ON SIP.SIRKET_ID=S.SIRKET_ID;
    
    
    -- Right Join’de 2. tablodaki tum satirlar gosterilir.
    -- 2 tablodaki satirlara 1.tablodan kosula uyan ortak satirlar gosterilir
    -- ancak ortak olmayan kisimlar bos kalirir.
    
    
    
    
    CREATE TABLE bolumler (
    
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
    CREATE TABLE personel (
    
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

 /* -----------------------------------------------------------------------------
  ORNEK1: SATIS ve MUHASABE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum sonra isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 

	SELECT B.BOLUM_ISIM,P.PERSONEL_ISIM 
	FROM BOLUMLER B
	JOIN PERSONEL P
	ON P.BOLUM_ID=B.BOLUM_ID
    WHERE B.BOLUM_ID IN(10, 30)
   ORDER BY B.BOLUM_ISIM, P.PERSONEL_ISIM;
  
/* -----------------------------------------------------------------------------
  ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini ve ise_baslama tarihlerini isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  

	SELECT B.BOLUM_ISIM, P.PERSONEL_ISIM, P.ISE_BASLAMA 
	FROM BOLUMLER B
	LEFT JOIN PERSONEL P
	ON P.BOLUM_ID=B.BOLUM_ID
	WHERE B.BOLUM_ID IN(40, 30, 50)
	ORDER BY B.BOLUM_ISIM;
	
/* -----------------------------------------------------------------------------
  ORNEK3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini bolum ve maas siraali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/
	SELECT P.PERSONEL_ISIM, B.BOLUM_ISIM, P.MAAS 
	FROM PERSONEL P 
	RIGHT JOIN BOLUMLER B 
	ON P.BOLUM_ID=B.BOLUM_ID
	ORDER BY B.BOLUM_ISIM, P.MAAS;
	
	
/* -----------------------------------------------------------------------------
  ORNEK4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------------------*/ 
	SELECT B.BOLUM_ISIM, P.PERSONEL_ISIM, P.MAAS
	FROM PERSONEL P 
	JOIN BOLUMLER B 
	ON P.BOLUM_ID=B.BOLUM_ID
	WHERE B.BOLUM_ISIM IN('SATIS', 'MUDURLUK') AND MAAS>2000
    ORDER BY B.BOLUM_ISIM;
	
    
    
    
    