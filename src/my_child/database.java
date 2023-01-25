/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package my_child;
import java.sql.*;
import javax.swing.*;

/**
 *
 * @author Denny
 */
public class database {

    Connection con=null;
    public Connection java_database()
    {
        try{
    Class.forName("com.mysql.jdbc.Driver");
     Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/My_child","root","");
       JOptionPane.showMessageDialog(null, "connected susccessfully");
      return con;
        
        }
        
        catch(ClassNotFoundException | SQLException e)
        {
         JOptionPane.showMessageDialog(null, e);
         return null;
        }
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
}
