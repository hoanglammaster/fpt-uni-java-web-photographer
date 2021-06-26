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
import model.Website;

/**
 *
 * @author hoang
 */
public class WebsiteDAO extends DBContext {

    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public Website getWebInformation() {
        Website website = null;
        String query = "SELECT * FROM Websites";
        try {
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                website = new Website(resultSet.getString("WebsiteName"),resultSet.getInt("WebsiteHits"),resultSet.getString("WebsiteDescription"), resultSet.getString("WebsiteLogoURL"));
            }
        } catch (SQLException e) {
            Logger.getLogger(WebsiteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return website;
    }
    public void increaseWebHits(){
        String query = "UPDATE Websites SET WebsiteHits = WebsiteHits + 1";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(WebsiteDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
