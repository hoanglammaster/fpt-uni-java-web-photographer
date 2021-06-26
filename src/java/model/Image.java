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
public class Image {
    private int imgId;
    private String imgName;
    private String imgAlt;
    private String imgUrl;
    private int imgViews;
    private String imgTitle;
    public Image() {
    }
    
    public Image(int imgId, String imgName, String imgAlt, String imgUrl) {
        this.imgId = imgId;
        this.imgName = imgName;
        this.imgAlt = imgAlt;
        this.imgUrl = imgUrl;
    }
    
    public Image(int imgId, String imgName, String imgAlt, String imgUrl, String imgTitle) {
        this.imgId = imgId;
        this.imgName = imgName;
        this.imgAlt = imgAlt;
        this.imgUrl = imgUrl;
        this.imgTitle = imgTitle;
    }

    public Image(int imgId, String imgName, String imgAlt, String imgUrl,int imgViews) {
        this.imgId = imgId;
        this.imgName = imgName;
        this.imgAlt = imgAlt;
        this.imgUrl = imgUrl;
        this.imgViews = imgViews;
    }

    public int getImgId() {
        return imgId;
    }

    public String getImgName() {
        return imgName;
    }

    public String getImgAlt() {
        return imgAlt;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgId(int imgId) {
        this.imgId = imgId;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public void setImgAlt(String imgAlt) {
        this.imgAlt = imgAlt;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getImgViews() {
        return imgViews;
    }

    public void setImgViews(int imgViews) {
        this.imgViews = imgViews;
    }

    public String getImgTitle() {
        return imgTitle;
    }

    public void setImgTitle(String imgTitle) {
        this.imgTitle = imgTitle;
    }

    @Override
    public String toString() {
        return "Image{" + "imgId=" + imgId + ", imgName=" + imgName + ", imgAlt=" + imgAlt + ", imgUrl=" + imgUrl + ", imgViews=" + imgViews + ", imgTitle=" + imgTitle + '}';
    }
    
}
