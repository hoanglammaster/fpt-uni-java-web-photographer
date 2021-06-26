/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.GalleryDAO;
import dal.WebsiteDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import model.Gallery;
import model.Website;

/**
 *
 * @author hoang
 */
public class HeadingController implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        
        WebsiteDAO webDAO = new WebsiteDAO();
        Website webInfor = webDAO.getWebInformation();
        
        GalleryDAO galleryDAO = new GalleryDAO();
        ArrayList<Gallery> listGallery = galleryDAO.getListAllGallery();
        
        httpRequest.setAttribute("webName", webInfor.getWebsiteName());
        httpRequest.setAttribute("webLogoURL", webInfor.getWebsiteLogoURL());
        httpRequest.setAttribute("listGalleryHeader", listGallery);
        
        chain.doFilter(httpRequest, response);
    }

    @Override
    public void destroy() {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        System.out.println("Destroy called!---------------------------------------------------------------------------------------------");
    }

}
