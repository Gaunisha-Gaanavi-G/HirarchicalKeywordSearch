/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Perumal S
 */
public class register extends HttpServlet {

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
              Connection con=null;
      	      String url="jdbc:mysql://localhost:3306/cooperative1";
	      String driver="com.mysql.jdbc.Driver";
	      Class.forName(driver);
	       con=(Connection)DriverManager.getConnection(url, "root","root");
                 Statement smt=con.createStatement();
            String a1=request.getParameter("a1");
             String a2=request.getParameter("a2");
                         String a3=request.getParameter("a3");
                           String a4=request.getParameter("a4");
             String a5=request.getParameter("a5");
                         String a6=request.getParameter("a6");
                        String a7=request.getParameter("a7");
          
                       String a8="User";
                            	System.out.println("insert into register values('"+a1+"','"+a2+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8+"')");
                         
 String s1 = null;
		String s2 = null;
		String s3 = null;
                                         
 String s4 = null;
		String s5 = null;
		String s6 = null;                         
String s7 = null;    
		ArrayList al=new ArrayList();

                
             
		
  
             if(request.getParameter("s1")!=null){
                  if((a1.equals(""))||(a2.equals(""))||(a3.equals(""))||(a4.equals(""))||(a5.equals(""))&&(a6.equals(""))||(a7.equals("")))
              {
                   request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please press enter");
                      RequestDispatcher rs=request.getRequestDispatcher("register.jsp");
                     rs.forward(request, response); 
              }else{
                 ResultSet rst=smt.executeQuery("Select * from register where  userid='"+a1+"'");
                 if(rst.next()){
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "USerName ");
                   RequestDispatcher rs=request.getRequestDispatcher("register.jsp");
                    rs.forward(request, response);
                 }else{
                     if(a3.equalsIgnoreCase(a4)){
               	System.out.println("insert into register values('"+a1+"','"+a2+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8+"')");
	      int v=smt.executeUpdate("insert into register values('"+a1+"','"+a2+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+a8+"')");
                if(v==1){
                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Successfully stored");
                   RequestDispatcher rs=request.getRequestDispatcher("register.jsp");
                    rs.forward(request, response);
                }else{
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs=request.getRequestDispatcher("register.jsp");
                    rs.forward(request, response);
                }
                     }else{
                          request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Password didnt match");
                   RequestDispatcher rs=request.getRequestDispatcher("register.jsp");
                    rs.forward(request, response);
                     }
                 
                 }
                  }
             }else {
                          
                
                       request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter the value");
                   RequestDispatcher rs=request.getRequestDispatcher("register.jsp");
                    rs.forward(request, response);
                }
                 
        }catch(Exception e){
            e.printStackTrace();
        } finally {            
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
