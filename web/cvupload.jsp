<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page import="dataset.AesEncryption"%>
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
-->
        </style>
</head>
    <body bgcolor="#CCCCCC">
     <form action="upload4" method="post">
	 <%
           	

   String a1="";
 
   
   a1=request.getParameter("a1");
    String a13="",a2="",a3="",msg="";
         int a12=0;
          String ok=(String)request.getAttribute("ok1");
          if(ok!=null){
           
  msg=(String)request.getAttribute("msg");
          }
    
    %>
          

	 <table width="980" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td width="974" height="85"><h2 align="center" class="style1 style2">CO-OPERATIVE PROVABLE DATA POSSESSION FOR INTEGRITY VERIFICATION IN MULTI-CLOUD STORAGE</h2></td>
  </tr>
  <tr>
    <td height="204" background="images/banner1.jpg">&nbsp;</td>
  </tr>
    <tr>
    <td><table width="974" border="0" bgcolor="#999999">
      <tr>
        <td width="153"><div align="center" class="style1"><a href="cloud.jsp"><strong>Home</strong></a></div></td>
        <td width="168"><div align="center" class="style1"><a href="cvupload.jsp"><strong>Edit File</strong></a></div></td>
        <td width="158">&nbsp;</td>
	    <td width="158">&nbsp;</td>
		 <td width="231"><div align="center" class="style1"><a href="login.jsp"><strong>Login</strong></a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="516"><table width="928" border="0" align="center">
      <tr>
        <td width="922"><table width="590" border="0" align="center">
                <% int index=0;
	try
	{
            String a11="";
                 AESDecryption dec=new AESDecryption();
 AesEncryption enc=new AesEncryption();
             	   HttpSession so = request.getSession(true);
 System.out.println(a11);
		int flag=0;
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="t1" value="View">&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;
      <input type="reset" name="t2" value="Cancel">
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
            String a11=request.getParameter("a1");
             	   HttpSession so = request.getSession(true);
 System.out.println(a11);
		int flag=0;
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from upload where fid='"+a11+"'");

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
    <td>File ID </td>
    <td>&nbsp;</td>
    <td><label>
      <input type="text" name="a11" value="<%=a11%>">
    </label></td>
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
		<table width="407" border="0" align="center">
          <tr>
            <td width="401"><div align="center"></div></td>
          </tr>
          <tr>
            <td><div align="center"><strong><%=msg%></strong></div></td>
          </tr>
        </table></td>
	
      </tr>
	  
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#999999">&nbsp;</td>
  </tr>
</table>

	 </form>
    </body>
</html>
