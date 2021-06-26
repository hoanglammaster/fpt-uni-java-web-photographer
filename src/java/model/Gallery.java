/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author hoang
 */
public class Gallery {
    private int galleryID;
    private String galleryName;
    private  int galleryViews;
    private String galleryDescription;
    private String mostViewsImg;

    public Gallery() {
    }
    
    public Gallery(int galleryID, String galleryName) {
        this.galleryID = galleryID;
        this.galleryName = galleryName;
    }

    public Gallery(int galleryID, String galleryName, int galleryViews) {
        this.galleryID = galleryID;
        this.galleryName = galleryName;
        this.galleryViews = galleryViews;
    }
    public Gallery(int galleryID, String galleryName, String galleryDescription) {
        this.galleryID = galleryID;
        this.galleryName = galleryName;
        this.galleryDescription = galleryDescription;
    }
    

    public int getGalleryID() {
        return galleryID;
    }

    public void setGalleryID(int GalleryID) {
        this.galleryID = GalleryID;
    }

    public String getGalleryName() {
        return galleryName;
    }

    public void setGalleryName(String GalleryName) {
        this.galleryName = GalleryName;
    }

    public int getGalleryViews() {
        return galleryViews;
    }

    public void setGalleryViews(int galleryViews) {
        this.galleryViews = galleryViews;
    }

    public String getGalleryDescription() {
        return galleryDescription;
    }

    public void setGalleryDescription(String galleryDescription) {
        this.galleryDescription = galleryDescription;
    }

    public String getMostViewsImg() {
        return mostViewsImg;
    }

    public void setMostViewsImg(String mostViewsImg) {
        this.mostViewsImg = mostViewsImg;
    }
    
}
