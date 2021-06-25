

/* ======================= SELECT - WHERE ==================================*/

	CREATE TABLE OGRENCILER 
	(
	id NUMBER(9),
	isim VARCHAR2(50),
	adres VARCHAR2(100),
	sinav_notu NUMBER(3)

	);

	INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Mersin',65);
    INSERT INTO ogrenciler VALUES(125, 'Kamil Alma', 'Yozgat',96);
    INSERT INTO ogrenciler VALUES(125, 'Yasin Bastik', 'Istanbul',87);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Armut', 'Istanbul',84);
      
    
    SELECT * FROM OGRENCILER;
    
   	DROP TABLE OGRENCILER;
   
 /* ---------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/  
   	
   	SELECT * FROM OGRENCILER WHERE SINAV_NOTU > 80;
   
  	SELECT ID,ISIM FROM OGRENCILER WHERE SINAV_NOTU<80;
  
 /* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/  
  
  SELECT ISIM,ADRES FROM OGRENCILER WHERE ADRES='Ankara';
  
  SELECT ISIM,ADRES FROM OGRENCILER WHERE ADRES !='Istanbul';
  
 /* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 
  SELECT * FROM OGRENCILER WHERE ID IN(124, 125);
  
 
 /*=================================================================================*/
 
 
   CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);

    SELECT * FROM personel;
    
   
 /* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasında olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
   
   
   SELECT * FROM PERSONEL WHERE ID BETWEEN '10002' AND '10005';
   
   SELECT * FROM PERSONEL WHERE ID >= '10003' AND ID <='10004';
   
   
   
  /* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
   
   SELECT * FROM PERSONEL WHERE ISIM BETWEEN 'Mehmet Yilmaz' AND 'Veli Han';
   
   SELECT * FROM PERSONEL WHERE ISIM NOT BETWEEN 'Mehmet Yilmaz' AND 'Veli Han';
   
   
  /* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   

  SELECT * FROM PERSONEL WHERE ID IN(10001, 10002, 10004);
   
   
   SELECT * FROM PERSONEL WHERE MAAS IN(7000, 12000);
   
   
   
   
   