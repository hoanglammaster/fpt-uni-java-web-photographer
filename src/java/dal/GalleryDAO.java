/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Gallery;

/**
 *
 * @author hoang
 */
public class GalleryDAO extends DBContext {

    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    
    public ArrayList<Gallery> getListAllGallery(){
        ArrayList<Gallery> listGallery = new ArrayList<>();
        String query = "SELECT * FROM Gallerys";
        try {
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                listGallery.add(new Gallery(resultSet.getInt("GalleryID"), resultSet.getString("GalleryName"), resultSet.getString("GalleryDescription")));
            }
        } catch (SQLException e) {
            Logger.getLogger(GalleryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return listGallery;
    }
    public void increaseGalleryViewByID(int galleryID){
        String query = "UPDATE Gallerys SET GalleryViews = GalleryViews + 1 WHERE GalleryID = ?";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, galleryID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(GalleryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public Gallery getGalleryWithDescriptionByID(int galleryID){
        String query = "SELECT GalleryID, GalleryName,GalleryDescription FROM Gallerys WHERE GalleryID = ?";
        Gallery gallery = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, galleryID);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                gallery = new Gallery(resultSet.getInt("GalleryID"), resultSet.getString("GalleryName"), resultSet.getString("GalleryDescription"));
            }
        } catch (SQLException e) {
            Logger.getLogger(GalleryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return gallery;
    }
    public Gallery getGalleryWithViewsByID(int galleryID){
        String query = "SELECT GalleryID, GalleryName,GalleryViews FROM Gallerys WHERE GalleryID = ?";
        Gallery gallery = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, galleryID);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                gallery = new Gallery(resultSet.getInt("GalleryID"), resultSet.getString("GalleryName"), resultSet.getInt("GalleryViews"));
            }
        } catch (SQLException e) {
            Logger.getLogger(GalleryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return gallery;
    }
}
