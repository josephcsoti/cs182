import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the SalesRecordsApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunSalesRecordsApplication
{
    public static void main(String[] args) {
      
      Connection connection = null;
      try {
          //Register the driver
        Class.forName("org.postgresql.Driver"); 
          // Make the connection.
            // You will need to fill in your real username abd password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps182-db.lt.ucsc.edu/jcsoti",
                                                     "****",
                                                     "****");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the SalesRecordsApplication class
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */

            SalesRecordsApplication app = new SalesRecordsApplication(connection);

            // Min products
            int minProducts = 3;
            List<Integer> stores = app.getStoresThatSoldFewProducts(minProducts);
            System.out.println("\nStores sold < "+minProducts+" products: ");
            for(Integer i : stores)
              System.out.println(i);
            
            /*
            * Output of getStoresThatSoldFewProducts
            * when the parameter numDifferentProductsSold is 3.
            2
            */

            // Update manuf
            String oldManufacturer = "Google";
            String newManufacturer = "Alphabet";
            System.out.println("\nCHANGING: " + oldManufacturer + " to " + newManufacturer);
            int changed = app.updateManufacturer(oldManufacturer, newManufacturer);
            System.out.println("SUCCESS: " + changed + " manufacturers changed");

            /*
            * Output of updateManufacturer when oldManufacturer is ‘Google’
            * and newManufacturer is ‘Alphabet’
            3
            */

            // fixCustomerStatus
            int lowCustomerID = 1001;
            System.out.println("\nCHANGING: Status for customers >= " + lowCustomerID);
            int fixed = app.fixCustomerStatus(lowCustomerID);
            System.out.println("SUCCESS: " + fixed + " customers changed");

            /*
            * Output of updateManufacturer when lowCustomerID is '1001'
            1
            */

            // fixCustomerStatus test #2
            int lowCustomerID2 = 1004;
            System.out.println("\nCHANGING: Status for customers >= " + lowCustomerID2);
            int fixed2 = app.fixCustomerStatus(lowCustomerID2);
             System.out.println("SUCCESS: " + fixed2 + " customers changed");

            /*
            * Output of updateManufacturer when lowCustomerID is '1001'
            0
            */

            connection.close();
            /*******************
            * Your code ends here */
            
      }
      catch (SQLException | ClassNotFoundException e) {
        System.out.println("Error while connecting to database: " + e);
        e.printStackTrace();
      }
      finally {
        if (connection != null) {
          // Closing Connection
          try {
          connection.close();
        } catch (SQLException e) {
          System.out.println("Failed to close connection: " + e);
          e.printStackTrace();
        }
        }
      }
    }
}
