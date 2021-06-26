/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.GalleryDAO;
import dal.WebsiteDAO;
import java.util.ArrayList;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import model.Gallery;
import model.Website;

@WebListener
public class MySessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        //increase views of web more 1;
        WebsiteDAO webDAO = new WebsiteDAO();
        
        webDAO.increaseWebHits();
        
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("-- HttpSessionListener#sessionDestroyed invoked --");
    }
}
