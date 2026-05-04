# Video Game Sales SQL Analysis Project

## Overview
This project demonstrates SQL database design, relational modeling, and business-style analysis using a video game sales dataset. The goal was to design a normalized SQL Server database, analyze global and regional video game sales, and visualize key sales insights in Power BI.

---

## Tools Used
- SQL Server
- SQL Server Management Studio (SSMS)
- Power BI
- Git & GitHub

---

## Project Goals
- Design a normalized relational database
- Create tables with primary keys and foreign keys
- Analyze sales performance by platform, genre, publisher, and game
- Practice SQL concepts used in real analyst roles
- Build Power BI visuals to summarize key insights

---

## Database Schema

### Tables
- **Games**
- **Platforms**
- **Genres**
- **Publishers**
- **Sales**

### Relationships
- Platforms → Games
- Genres → Games
- Publishers → Games
- Games → Sales

---

## Key Analysis Performed
- Total global sales by platform
- Average global sales by genre
- Top 10 games by global sales
- Sales breakdown by region
- Publisher and genre performance analysis

---

## SQL Skills Demonstrated
- SELECT, WHERE, ORDER BY
- INNER JOIN, LEFT JOIN, RIGHT JOIN
- GROUP BY and HAVING
- Aggregate functions: SUM, AVG, COUNT
- Pagination using OFFSET / FETCH
- Relational database design
- Primary keys and foreign keys

---

## Dashboard Preview

![Dashboard Overview](Video_Game_Sales.jpg)

---

## Power BI Visuals

### Total Global Sales by Platform
![Platform Sales](Platform_Sales.jpg)

### Average Global Sales by Genre
![Genre Average Sales](Genre_AVG_Sales.jpg)

### Top 10 Games by Global Sales
![Top 10 Games](Top10_Games.jpg)

---

## Project Files
- `01_create_schema.sql` → Creates database tables and relationships
- `02_insert_seed_data.sql` → Inserts sample video game sales data
- `03_analysis_queries.sql` → SQL analysis queries
- `Video_Game_Sales.pbix` → Power BI dashboard
- `Video_Game_Sales.jpg` → Dashboard overview image
- `Platform_Sales.jpg` → Platform sales visual
- `Genre_AVG_Sales.jpg` → Genre sales visual
- `Top10_Games.jpg` → Top 10 games visual

---

## Key Skills Demonstrated
- SQL database design
- SQL querying and analysis
- Data aggregation
- Relational joins
- Power BI dashboarding
- Business insight reporting

---

## Notes
This project uses mock video game sales data created for learning and portfolio purposes.
