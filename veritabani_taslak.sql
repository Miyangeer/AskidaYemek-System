-- Proje Başlangıcı: Veritabanı ve Ana Tablo
CREATE DATABASE AskidaYemekDB;
GO
USE AskidaYemekDB;

CREATE TABLE Kullanicilar (
    KullaniciID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad NVARCHAR(100),
    Rol NVARCHAR(20) -- Musteri, Restoran
);
-- Adres tablosu eklendi, kullanıcılar ile ilişkilendirildi
CREATE TABLE Adresler (
    AdresID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    AdresDetay NVARCHAR(MAX)
);
-- Kurye rolü ve Sipariş takip yapısı eklendi
CREATE TABLE Siparisler (
    SiparisID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    KuryeID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    Durum NVARCHAR(50)
);
