package javaapplication5;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.ResultSetMetaData;
public class JavaApplication5 {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/TestDB";
        String user = "postgres";
        String password = "error@123";
        try {
            while(true)
            {
                System.out.println("1: Retrieve all books available in the library");
                System.out.println("2: Find books borrowed by a specific patron");
                System.out.println("3: Count the number of books in each storage section");
                System.out.println("4: Retrieve all books along with their availability status and storage section names");
                System.out.println("5: Retrieve the total late fees collected");
                Scanner s = new Scanner(System.in);
               int val = s.nextInt();
                Connection connection = DriverManager.getConnection(url, user, password);
                Statement statement = connection.createStatement();
               if(val == 1)
                {
            String query = "SELECT * FROM Book WHERE Availibility = true;";
            ResultSet resultSet = statement.executeQuery(query);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            while (resultSet.next()) {
             for (int i = 1; i <= columnCount; i++) {
                    Object columnValue = resultSet.getObject(i);
                    String columnName = metaData.getColumnName(i);
                    System.out.println(columnName + ": " + columnValue);
                }
             System.out.println("-----"); // Separate records with a line
            }    
         }
             else if (val == 2)
                {
            String query = "SELECT * FROM Book WHERE Patron_ID = 1;";
            ResultSet resultSet = statement.executeQuery(query);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            while (resultSet.next()) {
             for (int i = 1; i <= columnCount; i++) {
                    Object columnValue = resultSet.getObject(i);
                    String columnName = metaData.getColumnName(i);
                    System.out.println(columnName + ": " + columnValue);
                }
             System.out.println("-----"); // Separate records with a line
            }    
                }
                else if (val == 3)
                {
            String query = "SELECT\n" +
"    StorageSection.Section_Name,\n" +
"    COUNT(Book.Book_ID) AS Book_Count\n" +
"FROM\n" +
"    StorageSection\n" +
"LEFT JOIN Book ON StorageSection.Storage_Section_ID = Book.Storage_Section_ID\n" +
"GROUP BY\n" +
"    StorageSection.Section_Name;";
            ResultSet resultSet = statement.executeQuery(query);
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();
            while (resultSet.next()) {
             for (int i = 1; i <= columnCount; i++) {
                    Object columnValue = resultSet.getObject(i);
                    String columnName = metaData.getColumnName(i);
                    System.out.println(columnName + ": " + columnValue);
                }
             System.out.println("-----"); // Separate records with a line
            }    
                }
                else if (val == 4)
                {
                    String query = "SELECT\n" +
"    Book.Book_ID,\n" +
"    Book.Edition,\n" +
"    Book.Availibility,\n" +
"    Publisher.ISBN,\n" +
"    Author.Author_Name,\n" +
"    Catalog.Description,\n" +
"    Catalog.Condition,\n" +
"    Catalog.Availibility AS Catalog_Availability,\n" +
"    StorageSection.Section_Name AS Storage_Section_Name\n" +
"FROM\n" +
"    Book\n" +
"JOIN Publisher ON Book.ISBN = Publisher.ISBN\n" +
"JOIN Author ON Book.Author_Name = Author.Author_Name\n" +
"JOIN Catalog ON Book.Catalog_ID = Catalog.Catalog_ID\n" +
"JOIN StorageSection ON Book.Storage_Section_ID = StorageSection.Storage_Section_ID;";
                    ResultSet resultSet = statement.executeQuery(query);
                    ResultSetMetaData metaData = resultSet.getMetaData();
                    int columnCount = metaData.getColumnCount();
                    while (resultSet.next()) {
             for (int i = 1; i <= columnCount; i++) {
                    Object columnValue = resultSet.getObject(i);
                    String columnName = metaData.getColumnName(i);
                    System.out.println(columnName + ": " + columnValue);
                }
             System.out.println("-----"); // Separate records with a line
            }    
                }
                else if (val == 5)
                {
                    String query = "SELECT\n" +
"    SUM(LateFee.Amount) AS Total_Late_Fees_Collected\n" +
"FROM\n" +
"    LateFee;";
                    ResultSet resultSet = statement.executeQuery(query);
                    while (resultSet.next()) {
                        String name = resultSet.getString("Total_Late_Fees_Collected");
                        System.out.println(" Total Late Fees Collected:"  + name);
            }    
                }
                
            connection.close();     
            }           
        } catch (SQLException e) {
            e.printStackTrace();
        }   
    }   
}