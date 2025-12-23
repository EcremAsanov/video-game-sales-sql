-- ============================================
-- 03_analysis_queries.sql
-- Video Game Sales Analysis (SQL Server)
-- Purpose: Portfolio query set (Q1–Q9)
-- ============================================

USE VideoGameSalesDB;
GO

-- Q1: Top 10 games by Global Sales
-- Concepts: SELECT, INNER JOIN, ORDER BY, TOP
SELECT TOP 10
    g.GameName,
    p.PlatformName,
    s.Global_Sales
FROM dbo.Games g
INNER JOIN dbo.Sales s
    ON g.GameID = s.GameID
INNER JOIN dbo.Platforms p
    ON g.PlatformID = p.PlatformID
ORDER BY
    s.Global_Sales DESC;
GO

-- Q2: PlayStation 2 games only (Top 10 by sales)
-- Concepts: WHERE
SELECT TOP 10
    g.GameName,
    p.PlatformName,
    s.Global_Sales
FROM dbo.Games g
INNER JOIN dbo.Sales s
    ON g.GameID = s.GameID
INNER JOIN dbo.Platforms p
    ON g.PlatformID = p.PlatformID
WHERE
    p.PlatformName = 'PlayStation 2'
ORDER BY
    s.Global_Sales DESC;
GO

-- Q3: Games released between 1998 and 2005
-- Concepts: WHERE, BETWEEN
SELECT
    g.GameName,
    g.YearOfRelease,
    p.PlatformName,
    s.Global_Sales
FROM dbo.Games g
INNER JOIN dbo.Sales s
    ON g.GameID = s.GameID
INNER JOIN dbo.Platforms p
    ON g.PlatformID = p.PlatformID
WHERE
    g.YearOfRelease BETWEEN 1998 AND 2005
ORDER BY
    g.YearOfRelease;
GO

-- Q4: Which platform has the highest total Global Sales?
-- Concepts: SUM, GROUP BY
SELECT
    p.PlatformName,
    SUM(s.Global_Sales) AS TotalGlobalSales
FROM dbo.Sales s
INNER JOIN dbo.Games g
    ON s.GameID = g.GameID
INNER JOIN dbo.Platforms p
    ON g.PlatformID = p.PlatformID
GROUP BY
    p.PlatformName
ORDER BY
    TotalGlobalSales DESC;
GO

-- Q5: Average Global Sales per Genre
-- Concepts: AVG, GROUP BY
SELECT
    ge.GenreName,
    AVG(s.Global_Sales) AS AvgGlobalSales
FROM dbo.Sales s
INNER JOIN dbo.Games g
    ON s.GameID = g.GameID
INNER JOIN dbo.Genres ge
    ON g.GenreID = ge.GenreID
GROUP BY
    ge.GenreName
ORDER BY
    AvgGlobalSales DESC;
GO

-- Q6: Genres with total Global Sales above a threshold
-- Concepts: HAVING
SELECT
    ge.GenreName,
    SUM(s.Global_Sales) AS TotalGlobalSales
FROM dbo.Sales s
INNER JOIN dbo.Games g
    ON s.GameID = g.GameID
INNER JOIN dbo.Genres ge
    ON g.GenreID = ge.GenreID
GROUP BY
    ge.GenreName
HAVING
    SUM(s.Global_Sales) > 3
ORDER BY
    TotalGlobalSales DESC;
GO

-- Q7: LEFT JOIN demo (show all platforms even if no games)
-- Concepts: LEFT JOIN
-- Note: Add an extra platform with no games to see NULLs in GameName.
-- Example:
-- INSERT INTO Platforms (PlatformName) VALUES ('PSP');
SELECT
    p.PlatformName,
    g.GameName
FROM dbo.Platforms p
LEFT JOIN dbo.Games g
    ON p.PlatformID = g.PlatformID
ORDER BY
    p.PlatformName, g.GameName;
GO

-- Q8: RIGHT JOIN demo (show all publishers even if no games)
-- Concepts: RIGHT JOIN
-- Note: Add an extra publisher with no games to see NULLs in GameName.
-- Example:
-- INSERT INTO Publishers (PublisherName) VALUES ('Square Enix');
SELECT
    pub.PublisherName,
    g.GameName
FROM dbo.Games g
RIGHT JOIN dbo.Publishers pub
    ON g.PublisherID = pub.PublisherID
ORDER BY
    pub.PublisherName, g.GameName;
GO

-- Q9: Pagination (SQL Server version of LIMIT / OFFSET)
-- Concepts: ORDER BY, OFFSET, FETCH NEXT
-- Page 1 (rows 1-5)
SELECT
    g.GameName,
    s.Global_Sales
FROM dbo.Games g
INNER JOIN dbo.Sales s
    ON g.GameID = s.GameID
ORDER BY
    s.Global_Sales DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
GO

-- Page 2 (rows 6-10)
SELECT
    g.GameName,
    s.Global_Sales
FROM dbo.Games g
INNER JOIN dbo.Sales s
    ON g.GameID = s.GameID
ORDER BY
    s.Global_Sales DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
GO
