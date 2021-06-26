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
public class Website {
    private String websiteName;
    private int websiteHits;
    private String websiteDescription;
    private String websiteLogoURL;

    public Website() {
    }

    public Website(String websiteName, int websiteHits, String websiteDescription, String websiteLogoURL) {
        this.websiteName = websiteName;
        this.websiteHits = websiteHits;
        this.websiteDescription = websiteDescription;
        this.websiteLogoURL = websiteLogoURL;
    }

    public String getWebsiteName() {
        return websiteName;
    }

    public void setWebsiteName(String websiteName) {
        this.websiteName = websiteName;
    }

    public int getWebsiteHits() {
        return websiteHits;
    }

    public void setWebsiteHits(int websiteHits) {
        this.websiteHits = websiteHits;
    }

    public String getWebsiteDescription() {
        return websiteDescription;
    }

    public void setWebsiteDescription(String websiteDescription) {
        this.websiteDescription = websiteDescription;
    }

    public String getWebsiteLogoURL() {
        return websiteLogoURL;
    }

    public void setWebsiteLogoURL(String websiteLogoURL) {
        this.websiteLogoURL = websiteLogoURL;
    }
    
    
}
