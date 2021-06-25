/*======================= CONSTRAINTS - KISITLAMALAR ======================================
               
    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
    UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ olmasını garanti eder.  
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSİZ olmasını garanti eder.(NOT NULL ve UNIQUE birleşimi gibi)
    FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
                  Böylelikle, tablolar arasında ilişki kurulmuş olur. 
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir şartı sağlamasını garanti eder. 
    DEFAULT - Herhangi bir değer atanamadığında Başlangıç değerinin atanmasını sağlar.
 ========================================================================================*/
   
----------------------------------------------------------------
-- KISITLAMALAR (ORNEK1 - PRIMARY KEY)
----------------------------------------------------------------

CREATE TABLE calisanlar


id CHAR(5) PRIMARY KEY,
isim VARCHAR(50) UNIQUE,
maas  INT(5) NOT NULL,
ise_baslama DATE

);

 INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
 INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yılmaz' ,12000, '14-04-18');
 INSERT INTO calisanlar VALUES('10003', '', 5000, '14-04-18');
 INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-04-18');
 INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-04-18'); 
 INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '12-04-19');
    
   SELECT * FROM calisanlar;
   
   DROP TABLE calisanlar;
  
  
 
  
  CREATE TABLE adresler
  (
  
  adres_id CHAR(5),
  sokak VARCHAR(50),
  cadde VARCHAR(30),
  sehir VARCHAR(15),
  CONSTRAINT id_fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
  
  );
   
 
 INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
 INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
 INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep'); 
 INSERT INTO adresler VALUES('','Ağa Sok', '30.Cad.','Antep');
 INSERT INTO adresler VALUES('','Ağa Sok', '30.Cad.','Antep');
 INSERT INTO adresler VALUES('10004','Gel Sok', '60.Cad.','Van');
   
   SELECT * FROM adresler;
  
   DROP TABLE adresler;
   
  
  
  SELECT maas FROM calisanlar WHERE isim='Ahmet Aslan';
   
   
  SELECT sokak FROM ADRESLER WHERE adres_id = '10001';
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
  