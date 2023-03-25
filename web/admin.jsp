<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
     <form action="" method="post"><table width="921" border="0" align="center" bgcolor="#FFFFFF">
 
  <tr>
    <td height="204" background="images/banner1.jpg">&nbsp;</td>
  </tr>
    <tr>
    <td><table width="940" border="0" bgcolor="#999999">
      <tr>
        <td width="149"><div align="center" class="style1"><a href="admin.jsp"><strong>Home</strong></a></div></td>
        <td width="393"><div align="center" class="style1"><a href="auploadlist.jsp"><strong> Login Block</strong></a></div></td>
	   
		 <td width="264"><div align="center" class="style1"><a href="login.jsp"><strong>Logout</strong></a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="516">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#999999">&nbsp;</td>
  </tr>
</table>

	 </form>
    </body>
</html>
