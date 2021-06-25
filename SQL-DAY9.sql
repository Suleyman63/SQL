/*============================= GROUP BY =====================================
    
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
    
    
==============================================================================*/ 
    

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
    
/* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu 
  yazınız.
------------------------------------------------------------------------------*/  
   
   SELECT ISIM, SUM(URUN_MIKTARI) AS T_URUN FROM MANAV GROUP BY ISIM; 
   
/* ----------------------------------------------------------------------------
  ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
   SELECT URUN_ADI, COUNT(ISIM) AS K_SAYISI FROM MANAV 
  	WHERE URUN_ADI IS NOT NULL GROUP BY URUN_ADI;
  
  -- GROUP by ile birlikte WHERE cümleciği kullanılabilir.      
    
   
/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
  MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu 
  yazınız.
-----------------------------------------------------------------------------*/ 
    SELECT URUN_ADI, MAX(URUN_MIKTARI) AS MIN_URUN, MAX(URUN_MIKTARI) AS MAX_URUN
   FROM MANAV WHERE URUN_ADI IS NOT NULL GROUP BY ISIM, URUN_ADI ORDER BY ISIM DESC;
   
    
/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/ 
     
   SELECT ISIM,URUN_ADI, SUM(URUN_MIKTARI) AS T_MIKTAR 
   FROM MANAV GROUP BY ISIM,URUN_ADI ORDER BY ISIM DESC;
   
     
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adına göre satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/  
    SELECT ISIM,URUN_ADI, SUM(URUN_MIKTARI) AS T_URUN FROM MANAV  
    GROUP BY ISIM,URUN_ADI 
    HAVING SUM(URUN_MIKTARI)>=3 
    ORDER BY SUM(URUN_MIKTARI) DESC;
   
   
     
    -- AGGREGATE fonksiyonları ile ilgili bir koşul koymak için GROUP BY'dan 
    -- sonra HAVING cümleciği kullanılır.
 
 /* ----------------------------------------------------------------------------
  ORNEK6: satılan urun_adi'na göre MAX urun sayılarını sıralayarak listeyen 
  sorguyu yazınız. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarına 
  eşit olmayan kayıtları listelemelidir.
 -----------------------------------------------------------------------------*/    
     
   SELECT URUN_ADI, MAX(URUN_MIKTARI) AS MAX_URUN FROM MANAV 
   GROUP BY URUN_ADI
   HAVING MAX(URUN_MIKTARI)!=MIN(URUN_MIKTARI) 
   ORDER BY MAX(URUN_MIKTARI);
   


 /*============================= DISTINCT =====================================
    
    DISTINCT cümleciği bir SORGU ifadesinde benzer olan satırları flitrelemek
    için kullanılır. Dolayısıyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satırlar oluşturmaya yarar.
   
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, satin_adi3
    FROM  tablo_adı;
==============================================================================*/

     
/* ----------------------------------------------------------------------------
  ORNEK1: satılan farklı meyve türlerinin sayısını listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/   
        SELECT DISTINCT URUN_ADI FROM MANAV;
   
  		SELECT COUNT(DISTINCT URUN_ADI) AS URUN_SAYISI FROM MANAV; 

/* -----------------------------------------------------------------------------
  ORNEK2: satılan meyve ve isimlerin farklı olanlarını listeyen sorguyu yazınız.
------------------------------------------------------------------------------*/
    SELECT DISTINCT URUN_ADI,ISIM FROM MANAV;
   								
   -- 2 sutun icin beraber degerlendirirek
   -- benzerli olanları cikariyor.
    

     
/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyvelerin urun_mikarlarinin benzersiz  olanlarının 
  toplamlarini listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/ 
   
   SELECT DISTINCT SUM(URUN_MIKTARI) AS TOP_MIK FROM MANAV;
   
     
      