<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
}
-->
        </style>
</head>
    <body bgcolor="#CCCCCC">
     <form action="download" method="post"><table width="921" border="0" align="center" bgcolor="#FFFFFF">

  <tr>
    <td height="204" background="images/banner1.jpg">&nbsp;</td>
  </tr>
    <tr>
    <td><table width="974" border="0" bgcolor="#999999">
      <tr>
        <td width="184"><div align="center" class="style1"><a href="user.jsp"><strong>Home</strong></a></div></td>
        <td width="147"><div align="center" class="style1"><a href="fupload.jsp"><strong>File Upload </strong></a></div></td>
        <td width="202"><div align="center" class="style1"><a href="vupload.jsp"><strong>Edit File</strong></a></div></td>
         <td width="264"><div align="center" class="style1"><a href="uploadlist.jsp"><strong> File List</strong></a></div></td>
	
		 <td width="155"><div align="center" class="style1"><a href="login.jsp"><strong>Logout</strong></a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="516"><table width="982" height="452"  border="0"> 
      <%
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
    <td height="240"><table width="938" border="0" align="center">
  <tr>
    <td width="932" align="center"><span class="style3">File List</span></td>
  </tr>
  <tr>
    <td><table width="928" border="0" align="center">
  <tr>
    <td width="922" height="114"><table width="848" border="0" align="center">
      <tr>
        <td width="973"><table width="845" height="33" border="0">
          <tr>
		    
            <td width="202"><strong>select </strong></td>
            <td width="207"><strong>File Name </strong></td>
            <td width="200"><strong>User Id </strong></td>
            <td width="208"><strong>File Size </strong></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="843" height="33" border="0">
          <% 
	try
	{
            String a11=null;
             	  
 System.out.println(a11);
		
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from upload  where userid='"+so.getAttribute("un") +"'");

    while(rs.next())
		{						
	 %><tr>
		
            <td width="203"><input name="b" type="radio" value="<%=rs.getString(1)%>"></td>
            <td width="203"><%=rs.getString(4)%></td>
            <td width="203"><%=rs.getString(2)%></td>
            <td width="206"><%=rs.getString(16)%></td>
            </tr>  <%
 
													
													} 
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="207"><table width="451" border="0" align="center">

      <tr>
        <td width="213">File Key </td>
        <td width="10">&nbsp;</td>
        <td width="215"><label>
          <input type="text" name="b1">
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><label>
          <input type="submit" name="t1" value="Download">&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" name="t2" value="Submit">
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table></td>
  </tr>
</table>
</td>
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
