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
public class aupload extends HttpServlet {

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
            Statement st = con.createStatement();    Statement st1 = con.createStatement();
            String s1=request.getParameter("t1");
            String s2 = request.getParameter("t2");
            String s3=request.getParameter("t3");
            String s4 = request.getParameter("t4");
            String a1= request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String a3 = request.getParameter("a3");
            String a4 = request.getParameter("a4");
               String a5= request.getParameter("a5");
            String a6 = request.getParameter("a6");
            String a7 = request.getParameter("a7");
            String a8 = request.getParameter("a8");
              String a9 = request.getParameter("a9");
                 String a10 ="";
         String a11 = request.getParameter("a10");
          
         HttpSession so = request.getSession(true);
              String v3=null,v1=null,v2=null;
                if((s1!=null) )
            {
            if((a1!=null)|| (a2!=null)|| (a3!=null) )
            {
                 java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
                    File file = new File(a2);
                FileInputStream fis = new FileInputStream(file);
                   ResultSet rs = st1.executeQuery("select * from login where userid='"+so.getAttribute("un")+"'");

    if(rs.next())
		{
      v1=rs.getString(1);  
	   v2=rs.getString(2); 
	    v3=rs.getString(3); 
        
       		   } 
                     
            PreparedStatement pstmt = con.prepareStatement("insert into upload values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1, a1);
                pstmt.setString(2, v1);
                pstmt.setBinaryStream(3, fis, file.length());
                pstmt.setString(4, file.getName());
                pstmt.setString(5, a10);
                pstmt.setString(6, a10);
                pstmt.setString(7, a10);
                pstmt.setString(8, a10);
                pstmt.setString(9, a10);
                pstmt.setString(10, a10);
                pstmt.setString(11, a3);
                pstmt.setString(12, a10);
                pstmt.setString(13, a10);
                pstmt.setString(14, a10);
                pstmt.setString(15, a10);
                  pstmt.setString(16, a10);
                 System.out.println("insert into assign( date,subject,file,sdate,filen) values ( ?,?,?,?,?)");
             int i=  pstmt.executeUpdate();
              if(i==1){
                  RequestDispatcher rs5=request.getRequestDispatcher("aupload.jsp");
                  rs5.forward(request, response);
              }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Password didnot match");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("aupload.jsp");
                    requestdispatcher.forward(request, response);
                }
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("aupload.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else
            if((s3!=null) )
            {
            if((a4!=null)|| (a5!=null)|| (a6!=null) || (a7!=null)|| (a8!=null) )
            {
                 java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
                  
                  
                     
             int v=st.executeUpdate("update upload set b1='"+aes.toEncrypt(a4.getBytes())+"',b2='"+aes.toEncrypt(a5.getBytes())+"',b3='"+aes.toEncrypt(a6.getBytes())+"',b4='"+aes.toEncrypt(a7.getBytes())+"',b5='"+aes.toEncrypt(a8.getBytes())+"',b6='"+aes.toEncrypt(a9.getBytes())+"',fsize='"+a11+"' where fid='"+a1+"'");      
         
              if(v==1){
                  RequestDispatcher rs5=request.getRequestDispatcher("aupload.jsp");
                  rs5.forward(request, response);
              }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Password didnot match");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("aupload.jsp");
                    requestdispatcher.forward(request, response);
                }
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("aupload.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("aupload.jsp");
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
