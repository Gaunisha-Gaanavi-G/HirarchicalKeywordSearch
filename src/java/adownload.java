/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import dataset.AESDecryption;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JEditorPane;

/**
 *
 * @author ASV perumal
 */
public class adownload extends HttpServlet {

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

            String url1;

            HttpSession so = request.getSession(true);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cooperative1", "root", "root");
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            Statement st3 = con.createStatement();
            Statement st4 = con.createStatement();
            Statement st5 = con.createStatement();
            Statement st6 = con.createStatement();
            int size;
            long mob = 0;
            String b = request.getParameter("b");
            String b1 = request.getParameter("b1");
            if (request.getParameter("t1") != null) {
                String v = null;
                java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10
FileWriter fstream = new FileWriter("d:\\out.txt");
        BufferedWriter out1 = new BufferedWriter(fstream);
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);

                System.out.println("select * from upload where fid='" + b + "' ");
                ResultSet rs = st1.executeQuery("select * from upload where fid='" + b + "'");
                if (rs != null) {
                    if (rs.next()) {
                        if(rs.getString(11).equalsIgnoreCase(b1)){
                        System.out.println("insert into download values ('" + so.getAttribute("un") + "','" + rs.getString(1) + "','" + rs.getString(4) + "','" + f + "','Yes')");
                        int i = st6.executeUpdate("insert into download values ('" + so.getAttribute("un") + "','" + rs.getString(1) + "','" + rs.getString(4) + "','" + f + "','Yes')");

                        if (i == 1) {
                            AESDecryption dec = new AESDecryption();


                          
                                out1.write(dec.toDeycrypt(rs.getString(5)));
                                out1.write(dec.toDeycrypt(rs.getString(6)));
                                out1.write(dec.toDeycrypt(rs.getString(7)));
                                out1.write(dec.toDeycrypt(rs.getString(8)));
                                out1.write(dec.toDeycrypt(rs.getString(9)));
                                out1.write(dec.toDeycrypt(rs.getString(10)));
                                //Close the output stream
                                out1.close();

                                RequestDispatcher rs2 = request.getRequestDispatcher("auploadlist.jsp");
                                rs2.forward(request, response);
                          
                        }


                        }else{
                             System.out.println("insert into download values ('" + so.getAttribute("un") + "','" + rs.getString(1) + "','" + rs.getString(4) + "','" + f + "','Yes')");
                        int i = st6.executeUpdate("insert into download values ('" + so.getAttribute("un") + "','" + rs.getString(1) + "','" + rs.getString(4) + "','" + f + "','No')");

                        if (i == 1) {
                            ResultSet rs3 = st3.executeQuery("select mobile from register  where userid=(select userid from upload where fid='" + b + "' ) ");

                            if (rs3.next()) {

                                mob = Long.parseLong(rs3.getString(1));
                            }

                            url1 = "http://ubaid.tk/sms/sms.aspx?uid=9791334452&pwd=bharathprabhu&msg=Requestfrom" + so.getAttribute("un") + "filekeyfor" + b + "&phone=" + mob + "&provider=way2sms";
                            JEditorPane editorPane = new JEditorPane(url1);
                            editorPane.setEditable(false);
                            if (url1 != null) {
                                request.setAttribute("ok", "1");
                                request.setAttribute("msg", "Request for access is sent successfully");
                                RequestDispatcher rs2 = request.getRequestDispatcher("auploadlist.jsp");
                                rs2.forward(request, response);
                            } else {
                                request.setAttribute("ok", "1");
                                request.setAttribute("msg", "Failed to send");
                                RequestDispatcher rs2 = request.getRequestDispatcher("auploadlist.jsp");
                                rs2.forward(request, response);
                            }
                        }
                        }
                    } else {
                       
                    }

                }

            } else {
                RequestDispatcher rs2 = request.getRequestDispatcher("auploadlist.jsp");
                rs2.forward(request, response);
            }








        } catch (Exception e) {
            e.printStackTrace();
        }finally {            
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
