
/* ========================== HASTA PROJESI =================================*/   
    
     
    CREATE TABLE hastaneler
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50),
        sehir VARCHAR2(10),
        ozel CHAR(1)
    );
    
    INSERT INTO hastaneler VALUES('H101', 'ACI MADEM HASTANESI', 'ISTANBUL', 'Y');
    INSERT INTO hastaneler VALUES('H102', 'HASZEKI HASTANESI', 'İSTANBUL', 'N');
    INSERT INTO hastaneler VALUES('H103', 'MEDIKOL HASTANESI', 'IZMIR', 'Y');
    INSERT INTO hastaneler VALUES('H104', 'NEMORYIL HASTANESI', 'ANKARA', 'Y');
    
    CREATE TABLE bolumler
    (
        bolum_id CHAR(5) PRIMARY KEY,
        bolum_adi VARCHAR2(20)
    ); 
    
    INSERT INTO bolumler VALUES('DHL', 'Dahiliye');
    INSERT INTO bolumler VALUES('KBB', 'Kulak-Burun-Boğaz');
    INSERT INTO bolumler VALUES('NRJ', 'Noroloji');
    INSERT INTO bolumler VALUES('GAST', 'Gastoroloji');
    INSERT INTO bolumler VALUES('KARD', 'Kardioloji');
    INSERT INTO bolumler VALUES('PSK', 'Psikiyatri');
    INSERT INTO bolumler VALUES('GOZ', 'Goz Hastaliklari');
     
   
   
   CREATE TABLE hastalar
    (
        kimlik_no CHAR(11) PRIMARY KEY,
        isim VARCHAR2(20),
        teshis VARCHAR2(30)
    );
    
    INSERT INTO hastalar VALUES('12345678901', 'Ali Can','Gizli Seker');
    INSERT INTO hastalar VALUES('45678901121', 'Ayşe Yılmaz','Hipertansiyon');
    INSERT INTO hastalar VALUES('78901123451', 'Steve Job','Pankreatit');
    INSERT INTO hastalar VALUES('12344321251', 'Tom Hanks','COVID19');
    
   
   
   CREATE TABLE hasta_kayitlar
    (
        kimlik_no CHAR(11),
        hast_isim VARCHAR2(20),
        hastane_adi VARCHAR2(50),
        bolum_adi VARCHAR2(20), 
        teshis VARCHAR2(30)
    ); 
    
    INSERT INTO hasta_kayıtlar VALUES('1111','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('2222','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('3333','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('4444','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('5555','NONAME','','','');
   
    DROP TABLE HASTA_KAYITLAR ;
    DROP TABLE HASTALAR ;
    DROP TABLE BOLUMLER;
    DROP TABLE HASTANELER 
   

    SELECT * FROM hastaneler;
    SELECT * FROM bolumler;
    SELECT * FROM hastalar;
    SELECT * FROM hasta_kayitlar;
   
   
   /*=================================================================================*/
   
    UPDATE HASTA_KAYITLAR SET 
    
    HAST_ISIM = (SELECT ISIM FROM HASTALAR WHERE ISIM = 'Ali Can'),
    
    HASTANE_ADI = (SELECT ISIM FROM HASTANELER WHERE ID = 'H104'),
    
    BOLUM_ADI = (SELECT BOLUM_ADI FROM BOLUMLER WHERE BOLUM_ID = 'DHL'),
    
    TESHIS = (SELECT TESHIS FROM HASTALAR WHERE ISIM = 'Ali Can'),
    
    KIMLIK_NO = (SELECT KIMLIK_NO FROM HASTALAR WHERE ISIM = 'Ali Can') 
   
    WHERE KIMLIK_NO = '1111';
   
   
   
   
  
  /*===================================================================================*/
   UPDATE HASTA_KAYITLAR SET 
  
   HAST_ISIM = (SELECT ISIM FROM HASTALAR WHERE ISIM = 'Ayse Yilmaz'),
  
  
   HASTANE_ADI = (SELECT ISIM FROM HASTANELER WHERE ID = 'H103'),
   
   
   BOLUM_ADI = (SELECT BOLUM_ADI FROM BOLUMLER WHERE BOLUM_ID = 'KBB'),
   
 
   TESHIS = (SELECT TESHIS FROM HASTALAR WHERE ISIM = 'Tom Hanks'),
    
 
   KIMLIK_NO = (SELECT KIMLIK_NO FROM HASTALAR WHERE ISIM = 'Steve Jobs')
   
   WHERE KIMLIK_NO = '2222'


/*=========================================================================================*/

	UPDATE HASTA_KAYITLAR SET 


	HAST_ISIM = 'Ali Kemal', 

	HASTANE_ADI = 'Izmir Hastanesi', 

	BOLUM_ADI = 'Noroloji', 

	TESHIS = 'Parkinson', 

	KIMLIK_NO = '9988776' 

	WHERE KIMLIK_NO = '3333';
  
  
  
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    