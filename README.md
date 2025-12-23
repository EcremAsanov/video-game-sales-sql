\# Video Game Sales Analysis (SQL Server)



This project demonstrates core SQL fundamentals by designing and querying a relational database from scratch using SQL Server.



The dataset focuses on a curated selection of SEGA Dreamcast, Nintendo GameCube, and PlayStation 2 games.



---



\## Project Goals

\- Design a normalized relational database

\- Practice SQL fundamentals used in analyst roles

\- Answer business-style questions using SQL

\- Prepare the database for future Power BI visualization



---



\## Database Schema



\### Tables

\- \*\*Platforms\*\*

&nbsp; - PlatformID (PK)

&nbsp; - PlatformName



\- \*\*Genres\*\*

&nbsp; - GenreID (PK)

&nbsp; - GenreName



\- \*\*Publishers\*\*

&nbsp; - PublisherID (PK)

&nbsp; - PublisherName



\- \*\*Games\*\*

&nbsp; - GameID (PK)

&nbsp; - GameName

&nbsp; - YearOfRelease

&nbsp; - PlatformID (FK)

&nbsp; - GenreID (FK)

&nbsp; - PublisherID (FK, nullable)



\- \*\*Sales\*\*

&nbsp; - SalesID (PK)

&nbsp; - GameID (FK, UNIQUE)

&nbsp; - NA\_Sales

&nbsp; - EU\_Sales

&nbsp; - JP\_Sales

&nbsp; - Other\_Sales

&nbsp; - Global\_Sales



---



\## Relationships

\- Platforms → Games (1-to-many)

\- Genres → Games (1-to-many)

\- Publishers → Games (1-to-many, optional)

\- Games → Sales (1-to-1)



---



\## SQL Concepts Demonstrated

\- SELECT, WHERE, ORDER BY, TOP

\- INNER JOIN, LEFT JOIN, RIGHT JOIN

\- GROUP BY, HAVING

\- Aggregate functions (SUM, AVG, COUNT)

\- Pagination using OFFSET / FETCH



---



\## How to Run This Project (SSMS)

1\. Run `sql/01\_create\_schema.sql`

2\. Run `sql/02\_insert\_seed\_data.sql`

3\. Run `sql/03\_analysis\_queries.sql`



---



\## Tools Used

\- SQL Server

\- SQL Server Management Studio (SSMS)

\- Git \& GitHub



---



\## Notes

Sales data is mock data created for learning and portfolio purposes.



