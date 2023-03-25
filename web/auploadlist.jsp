<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>

<%@page import="dataset.AESDecryption"%>
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
-->
        </style>
</head>
    <body bgcolor="#CCCCCC">
     <form action="adownload" method="post"><table width="921" border="0" align="center" bgcolor="#FFFFFF">

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
    <td height="516" align="center"><table width="920" border="0">
  <tr>
    <td width="914" height="56" align="center"><strong>BLOCK CHAIN DETAILS </strong></td>
  </tr>
  <tr>
    <td><table width="916" border="0" align="center">
      <tr>
        <td width="910" height="45" ><table width="869" height="33" border="0">
          <tr>
		    
            <td width="141"><div align="center"><strong>Hashblock</strong></div></td>
            <td width="144"><div align="center"><strong>Transaction Id  </strong></div></td>
            <td width="146"><div align="center"><strong>Username</strong></div></td>
            <td width="129"><div align="center"><strong>Password</strong></div></td>
			  <td width="130"><div align="center"><strong>Date</strong></div></td>
            <td width="153"><div align="center"><strong>Status</strong></div></td>
			 
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="871" height="33" border="0">
          <% 
	try
	{
            String a11=null;
			AESDecryption asc=new AESDecryption();
             	   HttpSession so = request.getSession(true);
 System.out.println(a11);
		int flag=0;
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from loginblock");

    while(rs.next())
		{						
	 %><tr>
		
            <td width="140"><div align="center"><%=rs.getString(1)%></div></td>

            <td width="142"><div align="center"><%=rs.getString(2)%></div></td>
            <td width="146"><div align="center"><%=rs.getString(3)%></div></td>
            <td width="132"><div align="center"><%=rs.getString(4)%></div></td>
             <td width="129"><div align="center"><%=rs.getString(5)%></div></td>
            <td width="155"><div align="center"><%=rs.getString(6)%></div></td>
			
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
