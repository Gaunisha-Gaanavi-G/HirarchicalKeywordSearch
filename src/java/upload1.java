/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import dataset.AesEncryption;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASV perumal
 */
public class upload1 extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
         AesEncryption aes=new AesEncryption();
                    String url = "jdbc:mysql://localhost:3306/cooperative1";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps;
            Statement st = con.createStatement(); 
            Statement st1 = con.createStatement();
            String s1=request.getParameter("t1");
            String s2 = request.getParameter("t2");
            String s3=request.getParameter("t3");
            String s4 = request.getParameter("t4");
              String s5=request.getParameter("t5");
            String s6 = request.getParameter("t6");
       String a1 = request.getParameter("a1");
          String a3 = request.getParameter("a3");
            String a4 = request.getParameter("a4");
               String a5= request.getParameter("a5");
            String a6 = request.getParameter("a6");
            String a7 = request.getParameter("a7");
            String a8 = request.getParameter("a8");
              String a9 = request.getParameter("a9");
                 String a10 ="";
                 String a12="";
         String a11 = request.getParameter("a10");
          
         HttpSession so = request.getSession(true);
              String v3=null,v1=null,v2=null;
          if((s5!=null) )
            {
            if((a3!=null) )
            {
                 java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("update upload set b1='"+aes.toEncrypt(a4.getBytes())+"',b2='"+aes.toEncrypt(a5.getBytes())+"',b3='"+aes.toEncrypt(a6.getBytes())+"',b4='"+aes.toEncrypt(a7.getBytes())+"',b5='"+aes.toEncrypt(a8.getBytes())+"',b6='"+aes.toEncrypt(a9.getBytes())+"',fsize='"+a11+"' where fid='"+a1+"'"+"Formatted date is ==>" + f);
                  
             
                     int v=st.executeUpdate("update upload set b1='"+aes.toEncrypt(a4.getBytes())+"',b2='"+aes.toEncrypt(a5.getBytes())+"',b3='"+aes.toEncrypt(a6.getBytes())+"',b4='"+aes.toEncrypt(a7.getBytes())+"',b5='"+aes.toEncrypt(a8.getBytes())+"',b6='"+aes.toEncrypt(a9.getBytes())+"' where fid='"+a1+"'");      
         
              if(v==1){
                  RequestDispatcher rs5=request.getRequestDispatcher("vupload.jsp");
                  rs5.forward(request, response);
              }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Password didnot match");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("vupload.jsp");
                    requestdispatcher.forward(request, response);
                }
                
                      
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("vupload.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("vupload.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
      
            
        }catch(Exception e) {
        e.printStackTrace();
        }  finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
