 
/*==============LIKE=========================================*/ 

	CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   
   	SELECT * FROM KELIMELER;
    
    DROP TABLE KELIMELER;
    
   
 /* -----------------------------------------------------------------------------
  ORNEK:  ismi A harfi ile başlayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
   
   SELECT * FROM KELIMELER WHERE KELIME LIKE 'a%';
   
  /* -----------------------------------------------------------------------------
  ORNEK:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
  
  SELECT * FROM KELIMELER WHERE KELIME LIKE '%t';
  
 /* -----------------------------------------------------------------------------
  ORNEK:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/ 
 
 	SELECT * FROM KELIMELER WHERE KELIME LIKE '_e%';
 	
 
  /* -----------------------------------------------------------------------------
   ORNEK:  isminin 2. harfi e olup diğer harflerinde i olanları listeleyiniz
  -----------------------------------------------------------------------------*/
 
    SELECT * FROM KELIMELER WHERE KELIME LIKE '_e%i%';
 

   /* -----------------------------------------------------------------------------
     ORNEK:  ismi A ile başlamayanları listeleyiniz
    -----------------------------------------------------------------------------*/    

	SELECT * FROM KELIMELER WHERE KELIME NOT LIKE 'a%';

	/* -----------------------------------------------------------------------------
  	ORNEK:  isminde a harfi olmayanları listeleyiniz
 	-----------------------------------------------------------------------------*/

 	SELECT * FROM KELIMELER WHERE KELIME NOT LIKE '%a%';



/*=======================REGEXP_LIKE===================================*/
 	
 /* -----------------------------------------------------------------------------
  ORNEK: İçerisinde 'hi' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
 	
 	SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, 'hi'); 
 
 
 /* -----------------------------------------------------------------------------
  ORNEK: İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyeniz
 -----------------------------------------------------------------------------*/ 
 
 	 -- 'c' => case-sentisitive demektir ve default case-sensitive aktiftir.
     -- 'i' => incase-sentisitive demektir.
 
 SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, 'ot|at', 'i'); 



/* -----------------------------------------------------------------------------
  ORNEK: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır.


	SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, '^ho|^hi', 'i'); 


/* -----------------------------------------------------------------------------
  ORNEK: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Bitişi göstermek için $ karakteri kullanılır.

SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, 'm$|t$', 'i'); 


/* -----------------------------------------------------------------------------
  ORNEK: h ile başlayıp t ile biten 3 harfli kelimeleri büyük-küçük harfe 
  dikkat etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 


 SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, 'h[a-zA-Z0-9]t', 'i'); 


/* -----------------------------------------------------------------------------
  ORNEK: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 


 SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, 'h[ai]t', 'i'); 



/* -----------------------------------------------------------------------------
  ORNEK: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     


 SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, '[mie](*)', 'i'); 


/* -----------------------------------------------------------------------------
  ORNEK: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 


 SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, '^[as]', 'i'); 


/* -----------------------------------------------------------------------------
  ORNEK: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 


  SELECT * FROM KELIMELER WHERE REGEXP_LIKE(KELIME, '[o]{2}', 'i'); 









