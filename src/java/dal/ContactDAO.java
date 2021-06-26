/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Contact;

/**
 *
 * @author hoang
 */
public class ContactDAO extends DBContext{
    private PreparedStatement preparedStatement;
    private ResultSet resultSet; 
    
    
    public Contact getContactInformation(){
        Contact contact = null;
        String query = "SELECT * FROM Contacts";
        try {
            preparedStatement = connection.prepareStatement(query);
            resultSet  = preparedStatement.executeQuery();
            while(resultSet.next()){
                contact = new Contact(resultSet.getString("Address"), resultSet.getString("City"), resultSet.getString("Country"), resultSet.getString("Tel"), resultSet.getString("Email"), resultSet.getString("EmbedMap"));
            }
        } catch (SQLException e) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return contact;
    }
}
