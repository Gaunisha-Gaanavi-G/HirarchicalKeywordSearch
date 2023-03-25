/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import dataset.AesEncryption;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Random;
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
public class upload extends HttpServlet {

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
             Statement st2 = con.createStatement();         Statement st3 = con.createStatement();
            String s1=request.getParameter("t1");
            String s2 =  request.getParameter("t2");
            String s3=request.getParameter("t3");
            String s4 = request.getParameter("t4");
            String a1= request.getParameter("a1");
            String a2 ="C:\\Users\\Ashrutha\\Desktop\\multistorage\\multistorage\\" + request.getParameter("a2");
            String a3 = request.getParameter("a3");
            String a4 = request.getParameter("a4");
               String a5= request.getParameter("a5");
            String a6 = request.getParameter("a6");
            String a7 = request.getParameter("a7");
            String a8 = request.getParameter("a8");
              String a9 = request.getParameter("a9");
                 String a10 ="";
         String a11 = request.getParameter("a10");
            String a12 = request.getParameter("a11");
         HttpSession so = request.getSession(true);
              String v3=null,v1=null,v2=null;
              int b1=0,b2=0,b3=0,b4=0,b5=0;
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
                	long filesize = file.length();
		long filesizeInKB = filesize / 1024;
	//	System.out.println("Size of File is: " 		+ filesizeInKB + " KB");
                
                b1=(int)filesizeInKB;
                System.out.println("Size of File is: " 
		+ b1);
                if(b1<=1){
                    b2=150;
                }else  if((b1<=2)){
                    b2=250;
                }else  if((b1<=3)){
                    b2=450;
                }else   if((b1<=4)){
                    b2=650;
                }else   if((b1<=5)){
                    b2=850;
                }else  if((b1<=6)){
                    b2=1050;
                }else   if((b1<=7)){
                    b2=1250;
                }else   if((b1<=8)){
                    b2=1250;
                }
                else   if((b1<=9)){
                    b2=1250;
                }
                else   if((b1<=10)){
                    b2=1250;
                }
                else   if((b1<=11)){
                    b2=1250;
                }
                
                 System.out.println("Upload Cost is: " 
		+ b2);
                
                   ResultSet rs = st1.executeQuery("select * from register where userid='"+so.getAttribute("un")+"'");

    if(rs.next())
		{
      v1=rs.getString(1);  
	   v2=rs.getString(2); 
	    v3=rs.getString(3); 
        
       		   } 
      ResultSet rs11 = st1.executeQuery("select * from upload where filename='"+file.getName()+"'");

    if(rs11.next())
		{
     request.setAttribute("ok", "1");
                       request.setAttribute("a1", "File Size :"+b2);
                    request.setAttribute("a2", "Cost of Upload File :"+b2);
                          request.setAttribute("msg", "Uploaded file already exist");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("fupload.jsp");
                    requestdispatcher.forward(request, response);
        
       		   } else{
        
        int v13=st.executeUpdate("insert into cloud3 values('"+a1+"','"+file.getName()+"','','','cloud3','','')");
                        int v12=st.executeUpdate("insert into cloud2 values('"+a1+"','"+file.getName()+"','','','cloud2','','')");
                    int v11=st.executeUpdate("insert into cloud1 values('"+a1+"','"+file.getName()+"','','','cloud1','','')");
            PreparedStatement pstmt = con.prepareStatement("insert into upload values ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
                    pstmt.setString(17, b2+"");
                      pstmt.setString(18, a10);
                 //System.out.println("insert into assign( date,subject,file,sdate,filen) values ( ?,?,?,?,?)");
             int i=  pstmt.executeUpdate();
              if(i==1){
                  System.out.println(a1);
                        System.out.println("File Size   :"+b2);
                           System.out.println("Cost  :"+b2);
                    request.setAttribute("ok1", "1");
                     request.setAttribute("a", a1);
                     request.setAttribute("a1", "File Size :"+b1);
                    request.setAttribute("a2", "Cost of Upload File :"+b2);
                  
                          request.setAttribute("msg", "Normal Uploaded Successfully");
                  RequestDispatcher rs5=request.getRequestDispatcher("fupload.jsp");
                  rs5.forward(request, response);
              }else{

                    request.setAttribute("ok", "1");
                       request.setAttribute("a1", "File Size :"+b2);
                    request.setAttribute("a2", "Cost of Upload File :"+b2);
                          request.setAttribute("msg", "Uploaded Failed");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("fupload.jsp");
                    requestdispatcher.forward(request, response);
                }
    }
                        
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("fupload.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else
            if((s3!=null) )
            {
            if((a4!=null)|| (a5!=null)|| (a6!=null) || (a7!=null)|| (a8!=null) )
            {
                    ResultSet rs11 = st1.executeQuery("select * from upload where b1='"+aes.toEncrypt(a4.getBytes())+"' and b2='"+aes.toEncrypt(a5.getBytes())+"'and b3='"+aes.toEncrypt(a6.getBytes())+"' and b4='"+aes.toEncrypt(a7.getBytes())+"'and b5='"+aes.toEncrypt(a8.getBytes())+"'and b6='"+aes.toEncrypt(a9.getBytes())+"' ");

    if(rs11.next())
		{
                    int v11=st.executeUpdate("delete from cloud1  where fid='"+a12+"'");  
                                int v12=st.executeUpdate("delete from  cloud2  where fid='"+a12+"'");    
                      int v13=st.executeUpdate("delete from cloud3  where fid='"+a12+"'");    
             int v=st.executeUpdate("delete from upload where fid='"+a12+"'");      
         
                    request.setAttribute("ok1", "1");
                     request.setAttribute("a", a1);
                     request.setAttribute("a1", "File Size :" +b1);
                    request.setAttribute("a2", "Cost of Upload :"+b2);
                          request.setAttribute("msg", "Already Uploaded Successfully");
                  RequestDispatcher rs5=request.getRequestDispatcher("fupload.jsp");
                  rs5.forward(request, response);
                }else{
        FileWriter fstream = new FileWriter("C:\\Users\\Ashrutha\\Desktop\\multistorage\\multistorage\\code\\multistorage\\web\\server1\\"+a1+".txt");
        BufferedWriter out1 = new BufferedWriter(fstream);
        out1.write(aes.toEncrypt(a4.getBytes()));
                                out1.write(aes.toEncrypt(a5.getBytes()));
                                
                                
        FileWriter fstream1 = new FileWriter("C:\\Users\\Ashrutha\\Desktop\\multistorage\\multistorage\\code\\multistorage\\web\\server2\\"+a1+".txt");
        BufferedWriter out2 = new BufferedWriter(fstream1);
        out2.write(aes.toEncrypt(a6.getBytes()));
                                out2.write(aes.toEncrypt(a7.getBytes()));
        FileWriter fstream2 = new FileWriter("C:\\Users\\Ashrutha\\Desktop\\multistorage\\multistorage\\code\\multistorage\\web\\server3\\"+a1+".txt");
        BufferedWriter out3 = new BufferedWriter(fstream2);
        out3.write(aes.toEncrypt(a8.getBytes()));
                                out3.write(aes.toEncrypt(a9.getBytes()));
         java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
                  System.out.println(a11);
                  b1=Integer.parseInt(a11);
                   int aa=(int)b1/6;
                if(b1<=1){
                    b2=50;
                }else  if((b1<=2)){
                    b2=200;
                }else  if((b1<=3)){
                    b2=250;
                }else   if((b1<=4)){
                    b2=300;
                }else   if((b1<=5)){
                    b2=350;
                }else  if((b1<=6)){
                    b2=400;
                }else   if((b1<=7)){
                    b2=450;
                }else   if((b1<=8)){
                    b2=500;
                }
                else   if((b1<=9)){
                    b2=550;
                }
                else   if((b1<=10)){
                    b2=750;
                }
                else   if((b1<=11)){
                    b2=850;
                }
                               int v11=st.executeUpdate("update cloud1 set b1='"+aes.toEncrypt(a4.getBytes())+"',b2='"+aes.toEncrypt(a5.getBytes())+"',size='"+aa+"',cost='"+b2+"' where fid='"+a12+"'");  
                                int v12=st.executeUpdate("update cloud2 set b3='"+aes.toEncrypt(a6.getBytes())+"',b4='"+aes.toEncrypt(a7.getBytes())+"',size='"+aa+"',cost='"+b2+"' where fid='"+a12+"'");    
                      int v13=st.executeUpdate("update cloud3 set b5='"+aes.toEncrypt(a8.getBytes())+"',b6='"+aes.toEncrypt(a9.getBytes())+"' ,size='"+aa+"',cost='"+b2+"' where fid='"+a12+"'");    
             int v=st.executeUpdate("update upload set b1='"+aes.toEncrypt(a4.getBytes())+"',b2='"+aes.toEncrypt(a5.getBytes())+"',b3='"+aes.toEncrypt(a6.getBytes())+"',b4='"+aes.toEncrypt(a7.getBytes())+"',b5='"+aes.toEncrypt(a8.getBytes())+"',b6='"+aes.toEncrypt(a9.getBytes())+"',fsize='"+a11+"',fcost1='"+b2+"' where fid='"+a12+"'");      
         
              if(v==1){
                  System.out.println(a1);
                        System.out.println("File Size"+b1);
                           System.out.println("Cost"+b2);
                    request.setAttribute("ok1", "1");
                     request.setAttribute("a", a1);
                     request.setAttribute("a1", "File Size :" +b1);
                    request.setAttribute("a2", "Cost of Upload :"+b2);
                          request.setAttribute("msg", "Cloud Uploaded Successfully");
                  RequestDispatcher rs5=request.getRequestDispatcher("fupload.jsp");
                  rs5.forward(request, response);
             
              }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Password didnot match");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("fupload.jsp");
                    requestdispatcher.forward(request, response);
                }
    }
                
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("fupload.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("fupload.jsp");
			requestdispatcher.forward(request, response);
            }
            
            
            
            
            
            
        }catch(Exception e) {
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
