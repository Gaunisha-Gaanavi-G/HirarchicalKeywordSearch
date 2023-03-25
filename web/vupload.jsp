<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="dataset.AESDecryption"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="dataset.AESDecryption"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
<!--
.style1 {color: #993300}
.style2 {font-size: 24px}
.style3 {
	font-size: 18px;
	font-weight: bold;
	color: #990000;
}
.style4 {color: #FF0000}
-->
        </style>
</head>
    <body bgcolor="#CCCCCC">
     <form action="upload1" method="post">
	 <%
           	
   String ok=(String)request.getAttribute("ok");

   String a1=request.getParameter("a1");
 
    
    %>
          

	 <table width="980" border="0" align="center" bgcolor="#FFFFFF">
  
  <tr>
    <td height="204" background="images/banner1.jpg">&nbsp;</td>
  </tr>
    <tr>
    <td><table width="974" border="0" bgcolor="#999999">
      <tr>
        <td width="153"><div align="center" class="style1"><a href="user.jsp"><strong>Home</strong></a></div></td>
        <td width="122"><div align="center" class="style1"><a href="fupload.jsp"><strong>File Upload </strong></a></div></td>
        <td width="168"><div align="center" class="style1"><a href="vupload.jsp"><strong>Edit File</strong></a></div></td>
         <td width="116"><div align="center" class="style1"><a href="uploadlist.jsp"><strong> File List</strong></a></div></td>
	    
		 <td width="231"><div align="center" class="style1"><a href="login.jsp"><strong>Logout</strong></a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="516"><table width="982" height="498"  border="0"> <%
String pro2=null;String pro3=null;String pro4=null;String pro5=null;
  String pro1=null;	int flag = 0;
 HttpSession so = request.getSession(true);
 		try {
		
			String url1 = "jdbc:mysql://localhost:3306/cooperative1";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1 = DriverManager.getConnection(url1, "root", "root");
			Statement st1 = con1.createStatement();
			ResultSet rs1 = st1.executeQuery("SELECT * FROM register where userid='"+so.getAttribute("un") +"'");
  %> <%
          while (rs1.next()) {
				pro1=rs1.getString(1);
					pro2=rs1.getString(2);
							pro3=rs1.getString(4);
							
								pro4=rs1.getString(5);
							pro5=rs1.getString(6);
							} 
           %>
  <tr>
    <td width="972" height="108"><table width="971" border="0">
            <tr>
              <td width="221" height="36"><strong>User Id </strong></td>
              <td width="264"><%=pro1%></td>
              <td width="221"><strong>Contact no </strong></td>
              <td width="209"><%=pro3%></td>
            </tr>
            <tr>
              <td height="45"><strong>Name</strong></td>
              <td><%=pro1%></td>
              <td><strong>Email Id </strong></td>
              <td><%=pro4%></td>
            </tr>
        </table>;</td>
  </tr>
  <tr>
    <td height="240"><table width="928" border="0" align="center">
      <tr>
        <td width="922"><table width="590" border="0" align="center">
                <% int index=0;
	try
	{
            String a11="";
             	  
 System.out.println(a11);
		
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from upload ");

    			
	 %>
  <tr>
    <td width="151">File ID </td>
    <td width="7">&nbsp;</td>
    <td width="410"><label>
    <select name="a1" style="width:180px" class="style16">
                <%
          while (rs.next()) {
				a11=rs.getString(1);
           %>
                <option><%=a11%></option>
                <%} %>
              </select>
    </label></td>
  </tr>
    <%
 
											
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
  <tr>
    <td height="30">File Key </td>
    <td>&nbsp;</td>
    <td><label><input type="text" name="a3"/>
    </label></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="t1" value="View">&nbsp;&nbsp;<input type="submit" name="t3" value="EDIT">
      &nbsp;&nbsp;&nbsp;<input type="reset" name="t2" value="Cancel">
    </label></td>
  </tr>
</table></td>
      </tr>
      <tr>
        <td><%
            if(request.getParameter("t1")!=null){
                %>
		<table width="606" border="0" align="center">
<% 
	try
	{
            String a11=null;
             	  
 System.out.println(a11);
		
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from upload where fid='"+request.getParameter("a1")+"'");

    if(rs.next())
		{						
	 %>
  <tr>
    <td width="184">File Block1 </td>
    <td width="7">&nbsp;</td>
    <td width="401"><textarea name="a4" cols="50" rows="5"><%=rs.getString(5)%></textarea></td>
  </tr>
  <tr>
    <td>File Block2 </td>
    <td>&nbsp;</td>
    <td><textarea name="a5" cols="50" rows="5"><%=rs.getString(6)%></textarea></td>
  </tr>
  <tr>
    <td>File Block3 </td>
    <td>&nbsp;</td>
    <td><textarea name="a6" cols="50" rows="5"><%=rs.getString(7)%></textarea></td>
  </tr>
  <tr>
    <td>File Block 4 </td>
    <td>&nbsp;</td>
    <td><textarea name="a7" cols="50" rows="5"><%=rs.getString(8)%></textarea></td>
  </tr>
  <tr>
    <td>File Block 5 </td>
    <td>&nbsp;</td>
    <td><textarea name="a8" cols="50" rows="5"><%=rs.getString(9)%></textarea></td>
  </tr>
  <tr>
    <td>File Block 6 </td>
    <td>&nbsp;</td>
    <td><textarea name="a9" cols="50" rows="5"><%=rs.getString(10)%></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="t5" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="t6" value="Delete">
    </label></td>
  </tr>
         <%
 
													
													} 
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
</table>
		<%
            
}%>
		</td>
	
      </tr>
	  <tr><td>  <% if(request.getParameter("t3")!=null){
                %><table width="606" border="0" align="center">
	
<% 
	try
	{
	AESDecryption dec=new AESDecryption();
            String a11=null;
                String a3=request.getParameter("a3");
             	   
 System.out.println(a11);
		
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();	
             

                               
	       
		ResultSet rs = st.executeQuery("select * from upload where fid='"+request.getParameter("a1")+"'and fkey='"+request.getParameter("a3")+"' ");

    while(rs.next())
		{						
	 %>
  <tr>
    <td width="184">File Block1 </td>
    <td width="7">&nbsp;</td>
    <td width="401"><textarea name="a4" cols="50" rows="5"><%=dec.toDeycrypt(rs.getString(5))%></textarea></td>
  </tr>
  <tr>
    <td>File Block2 </td>
    <td>&nbsp;</td>
    <td><textarea name="a5" cols="50" rows="5"><%=dec.toDeycrypt(rs.getString(6))%></textarea></td>
  </tr>
  <tr>
    <td>File Block3 </td>
    <td>&nbsp;</td>
    <td><textarea name="a6" cols="50" rows="5"><%=dec.toDeycrypt(rs.getString(7))%></textarea></td>
  </tr>
  <tr>
    <td>File Block 4 </td>
    <td>&nbsp;</td>
    <td><textarea name="a7" cols="50" rows="5"><%=dec.toDeycrypt(rs.getString(8))%></textarea></td>
  </tr>
  <tr>
    <td>File Block 5 </td>
    <td>&nbsp;</td>
    <td><textarea name="a8" cols="50" rows="5"><%=dec.toDeycrypt(rs.getString(9))%></textarea></td>
  </tr>
  <tr>
    <td>File Block 6 </td>
    <td>&nbsp;</td>
    <td><textarea name="a9" cols="50" rows="5"><%=dec.toDeycrypt(rs.getString(10))%></textarea></td>
  </tr>

   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="t5" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="t6" value="Delete">
    </label></td>
  </tr>

         <%
    } 
                
													
												 
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
     <%}%>         
</table></td></tr>
    </table></td>
  </tr><%
        }
        catch(Exception e)
        {
        out.println(e);
        } %>
</table></td>
  </tr>
  <tr>
    <td bgcolor="#999999">&nbsp;</td>
  </tr>
</table>

	 </form>
    </body>
</html>
