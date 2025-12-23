-- ============================================
-- 02_insert_seed_data.sql
-- Video Game Sales Analysis (SQL Server)
-- Purpose: Insert curated seed data (platforms, genres, publishers, games, sales)
-- Notes: Sales are mock values (Global = NA + EU + JP + Other)
-- ============================================

USE VideoGameSalesDB;
GO

-- ============================================
-- Insert Platforms
-- ============================================
INSERT INTO Platforms (PlatformName)
VALUES
('SEGA Dreamcast'),
('GameCube'),
('PlayStation 2');
GO

-- ============================================
-- Insert Genres
-- ============================================
INSERT INTO Genres (GenreName)
VALUES
('Platformer'),
('Action-Adventure'),
('Fighting'),
('Racing'),
('RPG'),
('Shooter'),
('Stealth'),
('Survival Horror'),
('Party');
GO

-- ============================================
-- Insert Publishers
-- ============================================
INSERT INTO Publishers (PublisherName)
VALUES
('Sega'),
('Nintendo'),
('Capcom'),
('Ubisoft'),
('Rockstar Games'),
('Konami'),
('Electronic Arts'),
('Sony Computer Entertainment'),
('Acclaim Entertainment'),
('Majesco Entertainment');
GO

-- ============================================
-- Insert Games (resolves IDs by joining on names)
-- ============================================
INSERT INTO Games (GameName, YearOfRelease, PlatformID, GenreID, PublisherID)
SELECT v.GameName, v.YearOfRelease,
       p.PlatformID, g.GenreID, pub.PublisherID
FROM (VALUES
-- ======================
-- SEGA Dreamcast
-- ======================
('Sonic Adventure', 1998, 'SEGA Dreamcast', 'Platformer', 'Sega'),
('Sonic Adventure 2', 2001, 'SEGA Dreamcast', 'Platformer', 'Sega'),
('Marvel vs. Capcom 2', 2000, 'SEGA Dreamcast', 'Fighting', 'Capcom'),
('Jet Set Radio', 2000, 'SEGA Dreamcast', 'Action-Adventure', 'Sega'),
('Crazy Taxi', 1999, 'SEGA Dreamcast', 'Racing', 'Sega'),
('Time Stalkers', 1999, 'SEGA Dreamcast', 'RPG', 'Sega'),
('Fur Fighters', 2000, 'SEGA Dreamcast', 'Shooter', 'Acclaim Entertainment'),
('Sonic Shuffle', 2000, 'SEGA Dreamcast', 'Party', 'Sega'),
('Evolution: The World of Sacred Device', 1999, 'SEGA Dreamcast', 'RPG', 'Sega'),

-- ======================
-- GameCube
-- ======================
('Super Smash Bros. Melee', 2001, 'GameCube', 'Fighting', 'Nintendo'),
('The Legend of Zelda: The Wind Waker', 2002, 'GameCube', 'Action-Adventure', 'Nintendo'),
('Paper Mario: The Thousand-Year Door', 2004, 'GameCube', 'RPG', 'Nintendo'),
('Resident Evil 4', 2005, 'GameCube', 'Survival Horror', 'Capcom'),
('Super Mario Sunshine', 2002, 'GameCube', 'Platformer', 'Nintendo'),
('Prince of Persia: The Sands of Time', 2003, 'GameCube', 'Action-Adventure', 'Ubisoft'),
('Mario Kart: Double Dash', 2003, 'GameCube', 'Racing', 'Nintendo'),

-- ======================
-- PlayStation 2
-- ======================
('Grand Theft Auto III', 2001, 'PlayStation 2', 'Action-Adventure', 'Rockstar Games'),
('Metal Gear Solid 3: Snake Eater', 2004, 'PlayStation 2', 'Stealth', 'Konami'),
('Burnout 3: Takedown', 2004, 'PlayStation 2', 'Racing', 'Electronic Arts'),
('Ratchet & Clank: Up Your Arsenal', 2004, 'PlayStation 2', 'Shooter', 'Sony Computer Entertainment'),
('Jak II', 2003, 'PlayStation 2', 'Action-Adventure', 'Sony Computer Entertainment'),
('Sly 2: Band of Thieves', 2004, 'PlayStation 2', 'Stealth', 'Sony Computer Entertainment'),
('Psychonauts', 2005, 'PlayStation 2', 'Platformer', 'Majesco Entertainment')
) v(GameName, YearOfRelease, PlatformName, GenreName, PublisherName)
JOIN Platforms  p   ON p.PlatformName = v.PlatformName
JOIN Genres     g   ON g.GenreName     = v.GenreName
JOIN Publishers pub ON pub.PublisherName = v.PublisherName;
GO

-- ============================================
-- Insert Sales (resolves GameID by matching GameName)
-- ============================================
INSERT INTO Sales (GameID, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales)
SELECT g.GameID, s.NA, s.EU, s.JP, s.Other,
       (s.NA + s.EU + s.JP + s.Other) AS Global
FROM Games g
JOIN (VALUES
('Sonic Adventure', 1.20, 0.90, 0.35, 0.15),
('Sonic Adventure 2', 1.05, 0.85, 0.25, 0.12),
('Marvel vs. Capcom 2', 0.55, 0.25, 0.40, 0.05),
('Jet Set Radio', 0.45, 0.35, 0.18, 0.06),
('Crazy Taxi', 0.95, 0.55, 0.22, 0.10),
('Time Stalkers', 0.12, 0.08, 0.06, 0.02),
('Fur Fighters', 0.18, 0.14, 0.03, 0.03),
('Sonic Shuffle', 0.22, 0.15, 0.10, 0.04),
('Evolution: The World of Sacred Device', 0.15, 0.10, 0.06, 0.03),

('Super Smash Bros. Melee', 2.80, 1.70, 0.55, 0.25),
('The Legend of Zelda: The Wind Waker', 1.60, 1.10, 0.45, 0.20),
('Paper Mario: The Thousand-Year Door', 0.95, 0.55, 0.30, 0.12),
('Resident Evil 4', 1.20, 0.95, 0.25, 0.18),
('Super Mario Sunshine', 1.65, 1.05, 0.55, 0.22),
('Prince of Persia: The Sands of Time', 0.85, 0.75, 0.05, 0.10),
('Mario Kart: Double Dash', 1.90, 1.15, 0.48, 0.22),

('Grand Theft Auto III', 4.20, 2.40, 0.10, 0.35),
('Metal Gear Solid 3: Snake Eater', 1.55, 1.10, 0.75, 0.20),
('Burnout 3: Takedown', 1.35, 1.05, 0.05, 0.15),
('Ratchet & Clank: Up Your Arsenal', 1.05, 0.65, 0.08, 0.12),
('Jak II', 1.00, 0.60, 0.12, 0.10),
('Sly 2: Band of Thieves', 0.85, 0.50, 0.10, 0.10),
('Psychonauts', 0.30, 0.22, 0.05, 0.05)
) s(GameName, NA, EU, JP, Other)
ON s.GameName = g.GameName;
GO
