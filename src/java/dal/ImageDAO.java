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
import model.Image;

/**
 *
 * @author hoang
 */
public class ImageDAO extends DBContext {

    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    //get list image from DB by GalleryID
    public ArrayList<Image> getListImageByGalleryID(int galleryID) {
        String query = "SELECT ImageID, ImageName, ImageAlt, ImageURL FROM Images WHERE GalleryID = ?";
        ArrayList<Image> listImg = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, galleryID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listImg.add(new Image(resultSet.getInt("ImageID"), resultSet.getString("ImageName"), resultSet.getString("ImageAlt"), resultSet.getString("ImageURL")));
            }
        } catch (SQLException e) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return listImg;
    }
    public ArrayList<Image> getListImageByGalleryIDWithViews(int galleryID) {
        String query = "SELECT ImageID, ImageName, ImageAlt, ImageURL, ImageViews FROM Images WHERE GalleryID = ?";
        ArrayList<Image> listImg = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, galleryID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listImg.add(new Image(resultSet.getInt("ImageID"), resultSet.getString("ImageName"), resultSet.getString("ImageAlt"), resultSet.getString("ImageURL"),resultSet.getInt("ImageViews")));
            }
        } catch (SQLException e) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return listImg;
    }

    public Image getMostViewsImg() {
        String query = "SELECT TOP(1) * FROM Images ORDER BY ImageViews DESC";
        Image img = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                img = new Image(resultSet.getInt("ImageID"), resultSet.getString("ImageName"), resultSet.getString("ImageAlt"), resultSet.getString("ImageURL"), resultSet.getString("ImageTitle"));
            }
        } catch (SQLException e) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return img;
    }

    public ArrayList<Image> getListTopImage(int top) {
        String query = "SELECT TOP(?) ImageID, ImageName, ImageAlt, ImageURL FROM Images ORDER BY ImageViews DESC";
        ArrayList<Image> listImg = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, top);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                listImg.add(new Image(resultSet.getInt("ImageID"), resultSet.getString("ImageName"), resultSet.getString("ImageAlt"), resultSet.getString("ImageURL")));
            }
        } catch (SQLException e) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return listImg;
    }

    public Image getMostViewsImageByGalleryID(int galleryID) {
        String query = "SELECT TOP 1 ImageID, ImageName, ImageAlt, ImageURL FROM Images WHERE GalleryID = ? ORDER BY ImageViews DESC";
        Image img = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, galleryID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                img = new Image(resultSet.getInt("ImageID"), resultSet.getString("ImageName"), resultSet.getString("ImageAlt"), resultSet.getString("ImageURL"));
            }
        } catch (SQLException e) {
            Logger.getLogger(ImageDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        System.out.println(img.getImgName());
        return img;
    }

    public void increaseImageViewsByID(int imgID) {
        String query = "UPDATE Images SET ImageViews = ImageViews + 1 WHERE ImageID = ?";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, imgID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(GalleryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public int getImageViewsByID(int imgID) {
        String query = "SELECT ImageViews FROM Images WHERE ImageID = ?";
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, imgID);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt("ImageViews");
            }
        } catch (SQLException e) {
            Logger.getLogger(GalleryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return -1;
    }
    public Image getImageByImageID(int imgID){
        String query = "SELECT * FROM Images WHERE ImageID = ?";
        Image image = null;
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, imgID);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                image = new Image(resultSet.getInt("ImageID"),resultSet.getString("ImageName"), resultSet.getString("ImageAlt"), resultSet.getString("ImageURL"), resultSet.getInt("ImageViews"));
            }
        } catch (SQLException e) {
            Logger.getLogger(GalleryDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return image;
    }
}
