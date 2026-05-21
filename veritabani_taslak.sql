-- Proje Başlangıcı: Veritabanı ve Ana Tablo
CREATE DATABASE AskidaYemekDB;
GO
USE AskidaYemekDB;

CREATE TABLE Kullanicilar (
    KullaniciID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad NVARCHAR(100),
    Rol NVARCHAR(20) -- Musteri, Restoran
);
