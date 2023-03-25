<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
.style3 {
	color: #990000;
	font-weight: bold;
	font-size: 18px;
}
-->
        </style>
</head>
    <body bgcolor="#CCCCCC">
     <form action="" method="post"><table width="921" border="0" align="center" bgcolor="#FFFFFF">

  <tr>
    <td height="204" background="images/banner1.jpg">&nbsp;</td>
  </tr>
    <tr>
    <td><table width="974" border="0" bgcolor="#999999">
      <tr>
        <td width="153"><div align="center" class="style1"><a href="user.jsp"><strong>Home</strong></a></div></td>
        <td width="122"><div align="center" class="style1"><a href="fupload.jsp"><strong>File Upload </strong></a></div></td>
        <td width="168"><div align="center" class="style1"><a href="vupload.jsp"><strong>Edit File</strong></a></div></td>
         <td width="196"><div align="center" class="style1"><a href="uploadlist.jsp"><strong> File List</strong></a></div></td>

		 <td width="112"><div align="center" class="style1"><a href="login.jsp"><strong>Logout</strong></a></div></td>
      </tr>
    </table></td>
  </tr>   
  <tr>
    <td align="center"><table width="982" height="498"  border="0"> <%
String pro2=null;String pro3=null;String pro4=null;String pro5=null;
  String pro1=null;
 		try {
			int flag = 0;
 HttpSession so = request.getSession(true);
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
    <td height="240"><p>&nbsp;</p>
      <p><span class="style3">Dear</span> <%=pro1%> <br> 
          <br>
          <br>
          <span class="style3">WELCOME TO THE USER LOGIN</span></p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
  </tr><%
        }
        catch(Exception e)
        {
        out.println(e);
        } %>
</table>
</td>
  </tr>
  <tr>
    <td bgcolor="#999999">&nbsp;</td>
  </tr> 
</table>

	 </form>
    </body>
</html>
