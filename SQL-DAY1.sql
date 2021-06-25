CREATE TABLE student
(

std_id VARCHAR(4),
std_name VARCHAR2(20),
std_age NUMBER

);

INSERT INTO student VALUES('1001', 'Mehmet Yilmaz', 25);
INSERT INTO student VALUES('1002', 'Mahmut Sefer', 35);
INSERT INTO student VALUES('1003', 'Kemal Yilman', 25);
INSERT INTO student VALUES('1004', 'Yakup Kirkalti', 23);
INSERT INTO student VALUES('1005', 'Betul Ozgur', 27);
INSERT INTO student VALUES('1006', 'Mustafa Yavuz', 21);
INSERT INTO student VALUES('1007', 'Hulya Yanliz', 29);

SELECT * FROM student;


-- Parcali veri girisi

INSERT INTO student VALUES('1008', 'Mehmet Aslan', 25);

-- veri girisi yapilmayan degiskenlere null atanir


/*================================================================================*/

CREATE TABLE urunler
(

urun_id NUMBER,
urun_adi VARCHAR(50),
fiyat NUMBER (5,2),
tett DATE,
stok_adedi NUMBER(10)

;)


INSERT INTO urunler VALUES(101, 'CIPS', 5.25, '01-05-2020', 1500);
INSERT INTO urunler VALUES(101, 'ELMA', 4.25, '01-05-2021', 100);
INSERT INTO urunler VALUES(101, 'ARMUT', 3.25, '01-05-2021', 500);
INSERT INTO urunler VALUES(101, 'KOLA', 6.25, '01-05-2022', 2500);
INSERT INTO urunler VALUES(101, 'UN', 9.25, '01-05-2023', 3500);
INSERT INTO urunler VALUES(101, 'BARDAK', 1.25, '01-05-2020', 1500);
INSERT INTO urunler VALUES(101, 'SEKER', 6.25, '01-05-2024', 4500);
INSERT INTO urunler VALUES(101, 'KAHVE', 7.25, '01-05-2026', 6500);

