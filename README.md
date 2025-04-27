# 📋 Sportymate SQL Project

This project defines the complete structure, initial data, and advanced database operations for the `sportymate-sql-project` database, designed for organizing amateur basketball leagues, tracking player and team statistics, supporting a basic fantasy sports system, and implementing advanced SQL features.

The database supports management of sports halls, leagues, teams, matches, players, fantasy team selections, and news publishing related to matches. Additionally, the project includes the implementation of advanced SQL Server features, such as views, stored procedures, triggers, transactions, indexing, and XML/JSON data handling.

## 📂 Database Structure
- **hale**: Stores sports hall information (name, location).
- **lige**: Represents different leagues and their competitive ranks.
- **timovi**: Stores team data, each linked to a league.
- **igraci**: Stores player data (jersey number, name, surname, and team assignment).
- **utakmice**: Stores matches (linked to hall, league, and round).
- **utakmice_timovi**: Links matches with teams and stores the match winner.
- **utakmice_igraci**: Stores detailed per-player statistics for each match and quarter (points, assists, steals, rebounds, blocks, etc.).
- **fantasy_korisnici**: Stores users registered in the fantasy application (username and password).
- **fantasy_timovi**: Links users to selected players for their fantasy teams.
- **vesti**: Stores news articles related to matches (title, content, date and time).

## 🛠️ Technologies Used
- Microsoft SQL Server
- T-SQL (Transact-SQL)

## 📈 Main Features
- Creation and management of amateur basketball leagues.
- Tracking of detailed match and player statistics across quarters.
- Simple fantasy team system (users select players).
- News system for publishing articles related to matches.
- Advanced SQL Server features, including:
  - Views (standard and indexed).
  - Stored procedures with validation and error handling.
  - Triggers for data integrity and logging.
  - XML/JSON data handling.
  - Transactions and concurrency control.

## 🧠 Advanced SQL Features Implemented

### Views
- **1 Standard View**: A complex view with multiple JOINs and at least one aggregate function.
- **1 Indexed View**: A materialized view to optimize performance.

### Stored Procedures
- **INSERT Procedure**: Includes validation logic and error handling.
- **UPDATE Procedure**: Checks correctness of data before updating.
- **DELETE Procedure**: Verifies conditions before deleting records.
- **Error Handling Procedure**: Logs errors into a dedicated `greske` table.
- **Pagination Procedure**: Supports paging query results based on selected page number and rows per page.
- **Transaction Procedure**: Demonstrates transaction management with COMMIT and ROLLBACK logic.

### Triggers
- **AFTER Trigger**: Controls redundancy by updating related data after insert/update.
- **INSTEAD OF Trigger**: Modifies behavior of insert/update/delete operations.
- **DDL Trigger**: Monitors and logs schema changes.

### Concurrency and Isolation
- **Deadlock Simulation**: Simulates a deadlock situation between two transactions.
- **Read Uncommitted**: Demonstrates reading dirty data under the lowest isolation.
- **Read Committed**: Ensures only committed data is read.
- **Repeatable Read**: Locks data to prevent non-repeatable reads.

### XML and JSON Handling
- **Return Query Result as XML**: Using FOR XML.
- **Parse and Transform XML**: Using OPENXML function.
- **Return Query Result as JSON**: Using FOR JSON.
- **Parse and Transform JSON**: Using OPENJSON function.

## 📥 How to Use
1. Open Microsoft SQL Server Management Studio (SSMS).
2. Execute the provided SQL file `sportymate-sql-project.sql`.
3. The `sportymate-sql-project` database with all tables and initial data will be created.
4. You can then start inserting additional data or connecting the database to a backend application.

## 📌 Notes
- All tables are connected with foreign key constraints to ensure relational integrity.
- Initial datasets (halls, leagues, teams) are provided.
- The structure allows for easy scaling (e.g., adding tournaments, different sports, advanced fantasy features).
- The second part of the project demonstrates practical application of advanced SQL features, enhancing the database management and query performance.

---

## 📝 Opis na srpskom jeziku

Ovaj projekat definiše strukturu baze podataka `sportymate-sql-project`, namenjene za organizaciju amaterskih košarkaških liga, praćenje statistika igrača i timova, kao i podršku jednostavnom fantasy sistemu.

Baza obuhvata:
- upravljanje sportskim halama, ligama i timovima,
- evidenciju utakmica i detaljnih statistika igrača,
- kreiranje fantasy timova od strane korisnika,
- objavljivanje vesti vezanih za odigrane utakmice.

U drugom delu projekta realizovana je implementacija naprednih SQL funkcionalnosti, uključujući:
- kreiranje standardnih i indeksiranih pogleda,
- pisanje procedura sa validacijom podataka i obradom grešaka,
- rad sa transakcijama i strančenjem,
- upotrebu AFTER, INSTEAD OF i DDL okidača,
- simulaciju deadlock-a i rada sa različitim izolacionim nivoima,
- rad sa XML i JSON podacima (eksport i parsiranje).

Za korišćenje baze potrebno je izvršiti priloženi `.sql` fajl u Microsoft SQL Server Management Studio (SSMS).

---

## 📜 Future Work
- Development of a frontend or backend application connected to this database.
- Extension of fantasy system with more detailed points and rankings.
- Addition of new modules (e.g., tournament brackets, player awards).

---

# 🏆 Status
✅ Database schema complete  
✅ Advanced SQL functionalities implemented  
✅ Scripts for testing and simulation included

---

# 📧 Contact
Created by **Andrija Racić**  
Third-year student @ Računarski fakultet (RAF), Information Technologies

---

