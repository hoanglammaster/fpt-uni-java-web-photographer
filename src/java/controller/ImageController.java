/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ImageDAO;
import model.Image;

/**
 *
 * @author hoang
 */
public class ImageController {
    private ImageDAO imgDAO;
    public ImageController() {
        imgDAO = new ImageDAO();
    }
    
    public Image getTopImageByGalleryID(int galleryID){
        return imgDAO.getMostViewsImageByGalleryID(galleryID);
    }
}
