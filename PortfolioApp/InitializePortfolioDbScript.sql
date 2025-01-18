-- Veritabaný yaratma operasyonu baþlýyor
use master
go

if DB_ID('PortfolioDb') is not null
begin
	alter database PortfolioDb set single_user with rollback immediate
	drop database PortfolioDb
end
go

create database PortfolioDb collate Turkish_CI_AS
go

use PortfolioDb
go
--Veritabaný yaratma operasyonu sona erdi

--Uygulamanýn genel ayarlarý için Settings tablosu oluþturuluyor
create table Settings(
	Id int default 1,

	SiteName nvarchar(MAX) not null,
	FooterText nvarchar(MAX) not null,
	

	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

--Contacts tablosu oluþturuluyor
create table Contacts(
	Id int default 1,

	Address nvarchar(MAX) not null,
	PhoneNumber nvarchar(MAX) not null,
	Email nvarchar(MAX) not null,
	GoogleMap nvarchar(MAX) not null,

	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

--Abouts tablosu oluþturuluyor
create table Abouts(
	Id int default 1,

	AboutTitle nvarchar(MAX) not null,
	AboutText nvarchar(MAX) not null,
	AboutCvUrl nvarchar(MAX) not null,
	AboutImageUrl nvarchar(MAX) not null,

	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

--HomeBanners tablosu oluþturuluyor
create table HomeBanners(
	Id int default 1,

	HomeBannerTitle nvarchar(MAX) not null,
	HomeBannerSubTitle nvarchar(MAX) not null,
	HomeBannerText nvarchar(MAX) not null,
	HomeBannerImageUrl nvarchar(MAX) not null,

	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

create table ServiceInfos(
	Id int default 1,

	Title nvarchar(MAX) not null,
	SubTitle nvarchar(MAX) not null,
	
	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

create table Services(
	Id int primary key identity,

	Icon nvarchar(max) not null default '~/ui/img/services/s1.png',
	Title nvarchar(max) not null,
	SubTitle nvarchar(max) not null,
	Description nvarchar(max) not null,

	IsDeleted bit not null default 0,
	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

create table Categories(
	Id int primary key identity,

	Name nvarchar(max) not null,
	Description nvarchar(max) null default 'Kategori açýklamasý',

	IsDeleted bit not null default 0,
	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

create table Projects(
	Id int primary key identity,

	Title nvarchar(max) not null,
	SubTitle nvarchar(max) not null,
	Description nvarchar(max) null default 'Proje açýklamasý',
	ImageUrl nvarchar(max) not null,
	Team nvarchar(max) not null,
	Url nvarchar(max),
	GithubUrl nvarchar(max),
	ZipFileUrl nvarchar(max),
	CategoryId int not null foreign key references Categories(Id),

	IsDeleted bit not null default 0,
	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

create table Messages(
	Id int primary key identity,

	Name nvarchar(max) not null,
	Email nvarchar(max) not null,
	Subject nvarchar(max) not null,
	Content nvarchar(max) not null,

	IsDeleted bit not null default 0,
	IsRead bit not null default 0,
	SendingDate datetime2(3) default getdate(),
	ReadingDate datetime2(3)
)
go

create table SocialMediaAccounts(
	Id int primary key identity,

	Title nvarchar(max) not null,
	AccountUrl nvarchar(max) not null,
	Icon nvarchar(max) not null,

	IsDeleted bit not null default 0,
	CreatedAt datetime2(3) not null default getdate(),
	UpdatedAt datetime2(3)
)
go

INSERT INTO Settings (SiteName, FooterText, CreatedAt)
VALUES 
('Portföy Sitesi', '© 2024 Tüm Haklarý Saklýdýr', GETDATE());
go

INSERT INTO Contacts (Address, PhoneNumber, Email, GoogleMap, CreatedAt)
VALUES 
('Ankara, Türkiye', '+90 312 123 45 67', 'iletisim@portfoy.com', 'https://maps.google.com?q=Ankara', GETDATE());
go

INSERT INTO Abouts (AboutTitle, AboutText, AboutCvUrl, AboutImageUrl, CreatedAt)
VALUES 
('Hakkýmda', 'Yazýlým geliþtirme alanýnda uzmanlaþmýþ bir profesyonelim.', '~/ui/images/about-cv.png', '~/ui/images/about-image.png', GETDATE());
go

INSERT INTO HomeBanners (HomeBannerTitle, HomeBannerSubTitle, HomeBannerText, HomeBannerImageUrl, CreatedAt)
VALUES 
('Hoþ Geldiniz', 'Yazýlým Portföyüm', 'Projelerimi ve deneyimlerimi keþfedin.', '~/ui/images/home-banner.png', GETDATE());
go

INSERT INTO ServiceInfos (Title, SubTitle, CreatedAt)
VALUES 
('Hizmetlerimiz', 'Yazýlým geliþtirme, tasarým ve daha fazlasý.', GETDATE());
go

INSERT INTO Services (Title, SubTitle, Description, CreatedAt)
VALUES 
('Web Geliþtirme', 'Modern ve etkili çözümler', 'Responsive ve kullanýcý dostu web siteleri.', GETDATE()),
('Mobil Uygulama Geliþtirme', 'Yenilikçi ve hýzlý', 'iOS ve Android için modern mobil uygulamalar.', GETDATE()),
('SEO Optimizasyonu', 'Daha fazla görünürlük', 'Arama motoru optimizasyonu ile daha fazla eriþim.', GETDATE()),
('E-Ticaret Çözümleri', 'Satýþlarýnýzý artýrýn', 'Kapsamlý ve güvenilir e-ticaret platformlarý.', GETDATE());
go

INSERT INTO Categories (Name, Description, CreatedAt)
VALUES 
('Web Geliþtirme', 'Web tabanlý uygulama ve site geliþtirme teknolojileri.', GETDATE()),
('Mobil Geliþtirme', 'Mobil cihazlar için uygulama geliþtirme teknolojileri.', GETDATE()),
('Yapay Zeka', 'Yapay zeka ve makine öðrenimi uygulamalarý.', GETDATE()),
('Veri Bilimi', 'Büyük veri analizi ve veri bilimine yönelik çözümler.', GETDATE());
go

INSERT INTO Projects (Title, SubTitle, Description, ImageUrl, Team, Url, GithubUrl, ZipFileUrl, CategoryId, CreatedAt)
VALUES 
('Blog Platformu', 'Kiþisel blog sitesi.', 'ASP.NET Core ve Angular ile geliþtirilmiþ.', '~/ui/images/projects/blog.png', '3 Kiþilik Ekip', 'https://github.com/blog-platform', 'https://github.com/blog-platform', '~/ui/projects/blog.zip', 1, GETDATE()),
('Þirket Web Sitesi', 'Kurumsal bir web sitesi.', 'HTML, CSS, JavaScript ve PHP tabanlý.', '~/ui/images/projects/sirket.png', 'Tek Kiþilik Ekip', 'https://github.com/sirket-web', 'https://github.com/sirket-web', '~/ui/projects/sirket.zip', 1, GETDATE()),
('Haber Portalý', 'Haber sitesi uygulamasý.', 'Django ve Bootstrap ile tasarlanmýþ.', '~/ui/images/projects/haber.png', '2 Kiþilik Ekip', 'https://github.com/haber-portal', 'https://github.com/haber-portal', '~/ui/projects/haber.zip', 1, GETDATE());
go

INSERT INTO Projects (Title, SubTitle, Description, ImageUrl, Team, Url, GithubUrl, ZipFileUrl, CategoryId, CreatedAt)
VALUES 
('Mobil Alýþveriþ Uygulamasý', 'E-ticaret mobil uygulamasý.', 'Flutter ile geliþtirilmiþ.', '~/ui/images/projects/mobil-alisveris.png', '4 Kiþilik Ekip', 'https://github.com/mobil-alisveris', 'https://github.com/mobil-alisveris', '~/ui/projects/mobil-alisveris.zip', 2, GETDATE()),
('Fitness Takip Uygulamasý', 'Kiþisel fitness takip sistemi.', 'React Native ile tasarlanmýþ.', '~/ui/images/projects/fitness.png', '2 Kiþilik Ekip', 'https://github.com/fitness-takip', 'https://github.com/fitness-takip', '~/ui/projects/fitness.zip', 2, GETDATE()),
('Hava Durumu Uygulamasý', 'Lokasyon bazlý hava durumu tahmini.', 'Swift ve iOS için geliþtirilmiþ.', '~/ui/images/projects/hava-durumu.png', 'Tek Kiþilik Ekip', 'https://github.com/hava-durumu', 'https://github.com/hava-durumu', '~/ui/projects/hava-durumu.zip', 2, GETDATE());
go
INSERT INTO Projects (Title, SubTitle, Description, ImageUrl, Team, Url, GithubUrl, ZipFileUrl, CategoryId, CreatedAt)
VALUES 
('Görüntü Tanýma Sistemi', 'Resimlerdeki nesneleri tanýyan uygulama.', 'Python ve TensorFlow kullanýlmýþ.', '~/ui/images/projects/goruntu-tanima.png', '5 Kiþilik Ekip', 'https://github.com/goruntu-tanima', 'https://github.com/goruntu-tanima', '~/ui/projects/goruntu-tanima.zip', 3, GETDATE()),
('Chatbot Uygulamasý', 'Doðal dil iþleme tabanlý chatbot.', 'Python ve Rasa Framework.', '~/ui/images/projects/chatbot.png', '3 Kiþilik Ekip', 'https://github.com/chatbot', 'https://github.com/chatbot', '~/ui/projects/chatbot.zip', 3, GETDATE()),
('Tahmin Modeli', 'Satýþ tahmini için makine öðrenimi modeli.', 'Scikit-learn ve Pandas kullanýlmýþ.', '~/ui/images/projects/tahmin-modeli.png', '2 Kiþilik Ekip', 'https://github.com/tahmin-modeli', 'https://github.com/tahmin-modeli', '~/ui/projects/tahmin-modeli.zip', 3, GETDATE());
go

INSERT INTO Projects (Title, SubTitle, Description, ImageUrl, Team, Url, GithubUrl, ZipFileUrl, CategoryId, CreatedAt)
VALUES 
('Satýþ Analiz Sistemi', 'Satýþ verilerini analiz eden platform.', 'Tableau ve Python tabanlý.', '~/ui/images/projects/satis-analiz.png', '2 Kiþilik Ekip', 'https://github.com/satis-analiz', 'https://github.com/satis-analiz', '~/ui/projects/satis-analiz.zip', 4, GETDATE()),
('Veri Görselleþtirme Araçlarý', 'Büyük veriyi görselleþtiren uygulama.', 'D3.js ve Python ile geliþtirilmiþ.', '~/ui/images/projects/veri-gorsellestirme.png', '3 Kiþilik Ekip', 'https://github.com/veri-gorsellestirme', 'https://github.com/veri-gorsellestirme', '~/ui/projects/veri-gorsellestirme.zip', 4, GETDATE()),
('Makine Öðrenimi Araç Kutusu', 'Kullanýma hazýr ML araçlarý sunan bir platform.', 'Sklearn, Flask ve React kullanýlmýþ.', '~/ui/images/projects/ml-arac-kutusu.png', 'Tek Kiþilik Ekip', 'https://github.com/ml-arac-kutusu', 'https://github.com/ml-arac-kutusu', '~/ui/projects/ml-arac-kutusu.zip', 4, GETDATE());
go

INSERT INTO SocialMediaAccounts (Title, AccountUrl, Icon, CreatedAt)
VALUES 
('Instagram', 'https://instagram.com/portfoy', 'fa-instagram', GETDATE()),
('Facebook', 'https://facebook.com/portfoy', 'fa-facebook', GETDATE()),
('LinkedIn', 'https://linkedin.com/in/portfoy', 'fa-linkedin', GETDATE()),
('Medium', 'https://medium.com/@portfoy', 'fa-medium', GETDATE());
go

INSERT INTO Messages (Name, Email, Subject, Content, IsDeleted, IsRead, SendingDate)
VALUES 
('Ahmet Yýlmaz', 'ahmet@ornek.com', 'Portföyünü çok beðendim!', 'Projelerin çok ilham verici, tebrik ederim!', 0, 0, GETDATE()),
('Zeynep Kaya', 'zeynep@ornek.com', 'Ýþbirliði Hakkýnda', 'Birlikte çalýþmak isterim, iletiþime geçebilir misiniz?', 0, 0, GETDATE()),
('Mehmet Öz', 'mehmet@ornek.com', 'Proje Önerisi', 'Yeni bir fikirle ilgilenebileceðinizi düþündüm.', 0, 0, GETDATE()),
('Elif Demir', 'elif@ornek.com', 'Destek Hakkýnda', 'Portföyünüzü çok beðendim, bazý sorularým var.', 0, 0, GETDATE()),
('Canan Arslan', 'canan@ornek.com', 'Proje Sunumu', 'Birlikte bir sunum hazýrlamak isterim.', 0, 0, GETDATE()),
('Hakan Çelik', 'hakan@ornek.com', 'Tasarým Hakkýnda', 'Web tasarýmýnýz ilham verici!', 0, 0, GETDATE()),
('Ayþe Kurt', 'ayse@ornek.com', 'Teþekkürler', 'Projelerinizden çok þey öðrendim, teþekkür ederim!', 0, 0, GETDATE()),
('Berkay Koç', 'berkay@ornek.com', 'Ýletiþim', 'Bir iþ fýrsatýyla ilgileniyor musunuz?', 0, 0, GETDATE()),
('Merve Þahin', 'merve@ornek.com', 'Soru', 'Backend geliþtirme hakkýnda önerileriniz var mý?', 0, 0, GETDATE()),
('Fatih Kýlýç', 'fatih@ornek.com', 'Teknik Destek', 'Projenizde bir hata fark ettim, yardýmcý olabilir misiniz?', 0, 0, GETDATE()),
('Gizem Yýldýz', 'gizem@ornek.com', 'Harika Ýþler', 'Portföyünüzdeki projelere hayran kaldým.', 0, 0, GETDATE()),
('Ali Vural', 'ali@ornek.com', 'Yardým Talebi', 'Bir konuda yardýma ihtiyacým var.', 0, 0, GETDATE()),
('Cansu Uçar', 'cansu@ornek.com', 'Eðitim Tavsiyesi', 'Hangi kaynaklarý önerirsiniz?', 0, 0, GETDATE()),
('Burak Ak', 'burak@ornek.com', 'Görüþme Talebi', 'Bir toplantý yapabilir miyiz?', 0, 0, GETDATE()),
('Seda Öztürk', 'seda@ornek.com', 'Önerileriniz', 'Portföy geliþtirme için önerileriniz var mý?', 0, 0, GETDATE()),
('Yunus Emre', 'yunus@ornek.com', 'Ýþbirliði', 'Birlikte çalýþabileceðimiz bir alan var mý?', 0, 0, GETDATE()),
('Pelin Koç', 'pelin@ornek.com', 'Proje Yorumu', 'Son projeniz harika görünüyor!', 0, 0, GETDATE()),
('Oðuzhan Çýnar', 'oguzhan@ornek.com', 'Eðitim Hakkýnda', 'Portföy oluþturma eðitimleri veriyor musunuz?', 0, 0, GETDATE()),
('Aslý Taþ', 'asli@ornek.com', 'Web Sitesi', 'Web sitenizi geliþtirmek için bir önerim var.', 0, 0, GETDATE()),
('Efe Yýldýrým', 'efe@ornek.com', 'Sorularým Var', 'Size birkaç teknik soru sormak istiyorum.', 0, 0, GETDATE()),
('Beyza Kaya', 'beyza@ornek.com', 'Projeleriniz', 'Projeleriniz gerçekten çok etkileyici.', 0, 0, GETDATE()),
('Mert Deniz', 'mert@ornek.com', 'Ýþbirliði', 'Yeni bir proje üzerinde birlikte çalýþabiliriz.', 0, 0, GETDATE()),
('Deniz Akýn', 'deniz@ornek.com', 'Tebrikler', 'Portföyünüzü inceledim ve çok beðendim.', 0, 0, GETDATE()),
('Serkan Demir', 'serkan@ornek.com', 'Yeni Fikirler', 'Birlikte yeni projeler geliþtirmek isterim.', 0, 0, GETDATE()),
('Gamze Özkan', 'gamze@ornek.com', 'Etkileyici Projeler', 'Projelerinizi çok ilham verici buluyorum.', 0, 0, GETDATE());
go

create table Skills(
	Id int primary key identity,

	Name nvarchar(max) not null,
	Rate tinyint not null,

)
go
Insert Into Skills(Name,Rate)
VALUES
('HTML',95),
('PHYTON',90),
('JAVA',85),
('CSS',75)
go



--TRÝGGER ABOUTS---
create trigger trg_UpdateAt_Abouts --about tablosunda update iþlemi gerçekleþtirilirse 
on Abouts
after update 
as 
begin
update Abouts
set UpdatedAt=GETDATE()
from Abouts a
inner join inserted i  on a.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go



--TRÝGGER CATEGORÝES---
create trigger trg_UpdateAt_Categories --Category tablosunda update iþlemi gerçekleþtirilirse 
on Categories
after update 
as 
begin
update Categories
set UpdatedAt=GETDATE()
from Categories x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go

--Contact---
create trigger trg_UpdateAt_Contacts--Contacts tablosunda update iþlemi gerçekleþtirilirse 
on Contacts
after update 
as 
begin
update Contacts
set UpdatedAt=GETDATE()
from Contacts x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go


--Home Banner---
create trigger trg_UpdateAt_HomeBanners--HomeBanners tablosunda update iþlemi gerçekleþtirilirse 
on HomeBanners
after update 
as 
begin
update HomeBanners
set UpdatedAt=GETDATE()
from HomeBanners x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go

--Projects---
create trigger trg_UpdateAt_Projects--Projects tablosunda update iþlemi gerçekleþtirilirse 
on Projects
after update 
as 
begin
update Projects
set UpdatedAt=GETDATE()
from Projects x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go



--ServiceInfos---
create trigger trg_UpdateAt_ServiceInfos--Projects tablosunda update iþlemi gerçekleþtirilirse 
on ServiceInfos
after update 
as 
begin
update ServiceInfos
set UpdatedAt=GETDATE()
from ServiceInfos x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go



create trigger trg_UpdateAt_Services     --Projects tablosunda update iþlemi gerçekleþtirilirse 
on Services
after update 
as 
begin
update Services
set UpdatedAt=GETDATE()
from ServiceInfos x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go




create trigger trg_UpdateAt_SocialMediaAccounts--Projects tablosunda update iþlemi gerçekleþtirilirse 
on SocialMediaAccounts
after update 
as 
begin
update SocialMediaAccounts
set UpdatedAt=GETDATE()
from SocialMediaAccounts x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go

create trigger trg_UpdateAt_Settings--Projects tablosunda update iþlemi gerçekleþtirilirse 
on Settings
after update 
as 
begin
update Settings
set UpdatedAt=GETDATE()
from Settings x
inner join inserted i  on x.Id=i.Id  
--inserted tablosu bir geçici tablodur bilgileri ilk burada tutar,
--o sýrada hangi kaydýn güncellendiði tespit edildi, birleþtirdi

end
go

