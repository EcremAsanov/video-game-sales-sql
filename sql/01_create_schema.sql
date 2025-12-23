-- ============================================
-- 01_create_schema.sql
-- Video Game Sales Analysis (SQL Server)
-- Purpose: Create database + tables + constraints
-- ============================================

-- Create database (run once)
CREATE DATABASE VideoGameSalesDB;
GO

USE VideoGameSalesDB;
GO

-- =========================
-- TABLE: Platforms
-- Purpose: Lookup table for platform/console names
-- =========================
CREATE TABLE Platforms (
    PlatformID INT IDENTITY(1,1) PRIMARY KEY,
    PlatformName VARCHAR(100) NOT NULL UNIQUE
);
GO

-- =========================
-- TABLE: Genres
-- Purpose: Lookup table for genres
-- =========================
CREATE TABLE Genres (
    GenreID INT IDENTITY(1,1) PRIMARY KEY,
    GenreName VARCHAR(100) NOT NULL UNIQUE
);
GO

-- =========================
-- TABLE: Publishers
-- Purpose: Lookup table for publishers
-- =========================
CREATE TABLE Publishers (
    PublisherID INT IDENTITY(1,1) PRIMARY KEY,
    PublisherName VARCHAR(150) NOT NULL UNIQUE
);
GO

-- =========================
-- TABLE: Games
-- Purpose: Main dimension table for game metadata
-- Notes: PublisherID is nullable (unknown publisher allowed)
-- =========================
CREATE TABLE Games (
    GameID INT IDENTITY(1,1) PRIMARY KEY,
    GameName VARCHAR(255) NOT NULL,
    YearOfRelease INT NULL,
    PlatformID INT NOT NULL,
    GenreID INT NOT NULL,
    PublisherID INT NULL,

    CONSTRAINT FK_Games_Platforms FOREIGN KEY (PlatformID)
        REFERENCES Platforms(PlatformID),

    CONSTRAINT FK_Games_Genres FOREIGN KEY (GenreID)
        REFERENCES Genres(GenreID),

    CONSTRAINT FK_Games_Publishers FOREIGN KEY (PublisherID)
        REFERENCES Publishers(PublisherID)
);
GO

-- =========================
-- TABLE: Sales
-- Purpose: Fact table for sales measures
-- Notes: Enforces 1-to-1 relationship with Games via UNIQUE(GameID)
-- =========================
CREATE TABLE Sales (
    SalesID INT IDENTITY(1,1) PRIMARY KEY,
    GameID INT NOT NULL UNIQUE,

    NA_Sales DECIMAL(10,2) NOT NULL DEFAULT 0,
    EU_Sales DECIMAL(10,2) NOT NULL DEFAULT 0,
    JP_Sales DECIMAL(10,2) NOT NULL DEFAULT 0,
    Other_Sales DECIMAL(10,2) NOT NULL DEFAULT 0,
    Global_Sales DECIMAL(10,2) NOT NULL DEFAULT 0,

    CONSTRAINT FK_Sales_Games FOREIGN KEY (GameID)
        REFERENCES Games(GameID)
);
GO
