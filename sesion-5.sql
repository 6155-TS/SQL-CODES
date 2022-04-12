/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*------------------------------------------------------------------------------------------
/*  CREATE TABLE
/*------------------------------------------------------------------------------------------
	
/*personel adinda bir tablo oluşturunuz.  Tabloda first_name, last_name 
age(INT) ve hire_date (Date) sutunuları bulunmalıdır.	*/

CREATE TABLE personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
  );
  
 /* Aynı isimle yeniden bir veritabanı oluşturulmak istenirse hata verir. Bu hatayı
almamak için IF NOT EXISTS keywordu kullanılabilir */
CREATE TABLE IF NOT  EXISTS personel(
  first_name TEXT,
  last_name TEXT,
  age INT,
  hire_date DATE
  );
  
/*Veritabanında vacation_plan adında yeni bir tablo oluşturunuz.  Sutun isimleri
place_id, country, hotel_name, employee_id, vacation_length,budget 	*/ 
CREATE TABLE vacation_plan(
 place_id INT
 country NVARCHAR(50), 
 hotel_name NVARCHAR(100),
 employee_id INTEGER ,
 vacation_length INTEGER,
 budget REAL
  );

  
/*------------------------------------------------------------------------------------------
/*  DROP TABLE
/*------------------------------------------------------------------------------------------
/* personel tablosunu siliniz */
drop TABLE personel;

 /* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatayı görmemek için IF EXISTS keywordu kullanılabilir.*/
 DROP TABLE IF EXISTS personel;
 
 
-- NOT: SQL'de TRUNCATE TABLE komutu bulunmasına karşın SQLite bu komutu 
-- desteklememektedir. Truncate komutu  bir tabloyu değil içindeki tüm verileri 
-- silmek için kullanılır.

--(tabloda var ise içindeki verileri siler)

TRUNCATE TABLE personel;
  
  
INSERT INTO vacation_plan VALUES(34, "TURKEY", 'HOTEL ISTANBUL',1, 7, 4000);
-- NOT: Aynı komut tekrar çalıştırılırsa herhangi bir kısıt yoksa ise aynı veriler
-- tekrar tabloya girilmiş olur. 

INSERT INTO vacation_plan VALUES(42, "TURKEY", 'HOTEL MEVLANA',2, 4, 2000);

/*vacation_plan tablosuna vacation_lenght ve budget sutunlarını eksik olarak veri girişi 
yapınız*/

INSERT INTO vacation_plan (place_id,country, hotel_name, employee_id)

VALUES(06, "TURKEY", 'HOTEL BAŞKENT',3);