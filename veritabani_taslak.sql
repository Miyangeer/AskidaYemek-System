-- SON GÜNCELLEMELER --

-- 1. Tablo: Adres Yönetimi (Birden fazla adres desteği ve il/ilçe ayrımı)
ALTER TABLE Adresler 
ADD Sehir NVARCHAR(50), 
    Ilce NVARCHAR(50), 
    PostaKodu CHAR(5),
    AdresBasligi NVARCHAR(20) DEFAULT 'Ev'; -- Ev, İş, Okul ayrımı

-- 2. Tablo: Yemek Kategorileri (Sistemi daha düzenli gösterir)
CREATE TABLE Kategoriler (
    KategoriID INT PRIMARY KEY IDENTITY(1,1),
    KategoriAd NVARCHAR(50) NOT NULL
);

-- 3. Tablo: Askıdaki Yemek Havuzu (Daha detaylı takip)
CREATE TABLE AskiHavuzu (
    AskiID INT PRIMARY KEY IDENTITY(1,1),
    YemekID INT FOREIGN KEY REFERENCES Yemekler(YemekID),
    BagislayanID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID), -- Kim bağışladı?
    BagisTarihi DATETIME DEFAULT GETDATE(),
    Durum BIT DEFAULT 1 -- 1: Bekliyor, 0: Alındı
);

-- 4. Tablo: Kurye Takip ve Performans
CREATE TABLE TeslimatTakip (
    TakipID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT FOREIGN KEY REFERENCES Siparisler(SiparisID),
    KuryeID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    CikisSaati DATETIME,
    VarisSaati DATETIME,
    Mesafe DECIMAL(5,2) -- KM cinsinden
);
