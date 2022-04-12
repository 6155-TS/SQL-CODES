/*===================================================
LIKE
====================================================*/
/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
listeyen sorguyu yazınız*/

SELECT name
FROM tracks
WHERE Composer like '%Bach';

/* albulms tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
listeyen sorguyu yazınız*/
SELECT * 
FROM albums
WHERE Title like "%Greatest%";

/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/

SELECT * 
FROM invoices
WHERE InvoiceDate like "201_-02%";


/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
LastName ve City bilgilerini	listeleyen sorguyu yazınız*/
SELECT FirstName,LastName,City
from customers
WHERE FirstName like "___";

/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
LastName ve City bilgilerini listeleyen sorguyu yazınız*/

SELECT FirstName,LastName,City
FROM customers
WHERE LastName like "Sch%" or LastName like "Go%";
/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */
SELECT count(*)
FROM invoices;

SELECT * FROM invoices;

SELECT count(BillingState)--NULL olanlar sayılmaz.
FROM invoices;

SELECT count(*) as num_of_null--NULL saydırmak için * kullanmalıyız
FROM invoices
WHERE BillingState is NULL;


/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
select count(DISTINCT Composer) as number_of_composer
FROM tracks;

/*-- MIN,MAX
-------------------------------------------------------------------------------------------------*/	
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
sorguyu yaziniz */
SELECT name, min(Milliseconds)/1000.0 as min_duration_sc
FROM tracks;

SELECT * FROM tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */
SELECT  min(Grade) as min_grade ,max(grade) as max_grade
FROM students;
-- SUM,AVG
-------------------------------------------------------------------------------------------------	
/* invoices  tablosundaki faturaların toplam değerini listeyiniz */
SELECT round(sum(total)) as total_amount
FROM invoices;

/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */

SELECT round(avg(total),3) as avg_amount
FROM invoices;

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */
SELECT avg(milliseconds) as avg_duration
FROM tracks;

SELECT name, Milliseconds
FROM tracks
WHERE Milliseconds > (SELECT avg(milliseconds) FROM tracks);
/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
SELECT name, Milliseconds
FROM tracks
WHERE Milliseconds > (SELECT avg(milliseconds) FROM tracks);

/*===================================================
 GROUP BY
====================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
SELECT composer,count(name)
FROM tracks 
WHERE Composer is NOT NULL
GROUP BY Composer;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.* sorguyu yazınız. */
SELECT BillingCountry, round(avg(total),2) as avg_amount
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31 00:00:00"
GROUP BY BillingCountry;

