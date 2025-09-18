# JavaApplication5

This is a Java application that connects to a PostgreSQL database named **TestDB** to manage and query a library database. The project benefits from a typical NetBeans structure with Ant build support.

## Features

- **Retrieve all available books:** Query the `Book` table for available books.
- **Find books by patron:** Retrieve books borrowed by a specific patron.
- **Count books per storage section:** Use a `LEFT JOIN` between `StorageSection` and `Book`.
- **Detailed book information:** Retrieve books along with their edition, availability, and related details from other tables.
- **Total late fees:** Calculate and display the sum of late fees from the `LateFee` table.

## Prerequisites

- **Java 20:** Ensure you have Java JDK 20 installed.
- **PostgreSQL Database:** A PostgreSQL server running with a database named `TestDB`.
- **PostgreSQL JDBC Driver:** Included in your build classpath via `javac.modulepath` or manually added.
- **Ant:** The project uses Ant for building (see `build.xml` and `nbproject/build-impl.xml`).

## How to Build

1. Open the project in NetBeans or your preferred IDE.
2. Use the Ant targets available:
   - **Clean:** Run the `clean` target.
   - **Compile:** Run the `compile` target.
   - **Jar:** Run the `jar` target.
3. Alternatively, you can build from the command line:
   ```sh
   ant clean compile jar
   ```

## How to Run

- **From the IDE:** Run the `run` target or simply execute the `main` method in the `JavaApplication5` class.
- **From Command Line:** After building the jar (`JavaApplication5.jar` located in the `dist` directory), run it with:
  ```sh
  java -jar dist/JavaApplication5.jar
  ```

## Database Setup

The file `Scripts.sql` contains all SQL statements to build your library schema and seed initial data into tables such as:
- `StorageSection`
- `LibraryAdministrator`
- `Catalog`
- `Publisher`
- `Author`
- `Patron`
- `Reservation`
- `LateFee`
- `TransactionReport`
- `Loan`
- `Renewal`
- `Book`

Run the SQL script in your PostgreSQL client to set up the project database.

## Project Structure

```
build.xml
manifest.mf
Scripts.sql
nbproject/
  ├─ build-impl.xml
  ├─ genfiles.properties
  ├─ project.properties
  └─ project.xml
src/
  └─ javaapplication5/
      └─ JavaApplication5.java
test/
```

## JDBC Configuration

The connection parameters are defined in `JavaApplication5.java`:

```java
String url = "jdbc:postgresql://localhost:5432/TestDB";
String user = "postgres";
String password = "error@123";
```

Adjust these values if your database configuration is different.
