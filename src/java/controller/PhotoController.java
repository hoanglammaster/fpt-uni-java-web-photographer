/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.GalleryDAO;
import dal.ImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Gallery;
import model.Image;
import model.Website;

/**
 *
 * @author hoang
 */
@WebServlet(name = "PhotoController", urlPatterns = {"/photo"})
public class PhotoController extends HttpServlet {

    private ArrayList<Image> listImg;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PhotoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PhotoController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        int galleryID = Integer.parseInt(request.getParameter("galleryID"));
        int imgID = Integer.parseInt(request.getParameter("imgID"));
        
        GalleryDAO galleryDAO = new GalleryDAO();
        ImageDAO imgDAO = new ImageDAO();
        Image image = imgDAO.getImageByImageID(imgID);
        listImg = new ArrayList<>();
        listImg.add(image);
        ArrayList<Image> listImgSameGalleryID = imgDAO.getListImageByGalleryIDWithViews(galleryID);
        for(Image img : listImgSameGalleryID){
            System.out.println(img.getImgName()+" +_+ "+img.getImgViews());
        }
        if (listImgSameGalleryID != null) {
            for (Image img : listImgSameGalleryID) {
                if (img.getImgId() != image.getImgId()) {
                    listImg.add(img);
                }
            }
        }

        Gallery gallery = galleryDAO.getGalleryWithViewsByID(galleryID);
        String hits = String.format("%06d", gallery.getGalleryViews() + 1);
        System.out.println("Imageview before: "+image.getImgViews());
        
        //
        imgDAO.increaseImageViewsByID(image.getImgId());
        
        image.setImgViews(imgDAO.getImageViewsByID(image.getImgId()));
                System.out.println("Imageview after: "+image.getImgViews());

        request.setAttribute("galleryID", galleryID);
        request.setAttribute("pageId", galleryID);
        request.setAttribute("img", image);
        request.setAttribute("hitsChar", hits.toCharArray());
        request.getRequestDispatcher("photo.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String submitName = request.getParameter("btSubmit");
        int galleryID = Integer.parseInt(request.getParameter("galleryID"));
        int imgID = Integer.parseInt(request.getParameter("imgID"));
        
        GalleryDAO galleryDAO = new GalleryDAO();
        ImageDAO imgDAO = new ImageDAO();
        Image image;
        
        Gallery gallery = galleryDAO.getGalleryWithViewsByID(galleryID);
        String hits = String.format("%06d", gallery.getGalleryViews() + 1);
        
        if (submitName.equals("forward")) {
            int indexOfCurrentImg = -1;
            for (Image img : listImg) {
                if (img.getImgId() == imgID) {
                    indexOfCurrentImg = listImg.indexOf(img);
                }
            }
            indexOfCurrentImg += 1;
            if (indexOfCurrentImg == listImg.size()) {
                indexOfCurrentImg = 0;
            }
            image = listImg.get(indexOfCurrentImg);
        } else {
            int indexOfCurrentImg = -1;
            for (Image img : listImg) {
                if (img.getImgId() == imgID) {
                    indexOfCurrentImg = listImg.indexOf(img);
                }
            }
            indexOfCurrentImg -= 1;
            if (indexOfCurrentImg == -1) {
                indexOfCurrentImg = listImg.size()-1;
            }
            image = listImg.get(indexOfCurrentImg);
        }
        imgDAO.increaseImageViewsByID(image.getImgId());
        image.setImgViews(imgDAO.getImageViewsByID(image.getImgId()));
        request.setAttribute("galleryID", galleryID);
        request.setAttribute("pageId", galleryID);
        request.setAttribute("img", image);
        request.setAttribute("hitsChar", hits.toCharArray());
        request.getRequestDispatcher("photo.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
