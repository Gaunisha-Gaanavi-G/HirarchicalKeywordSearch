<%-- 
    Document   : login
    Created on : Nov 8, 2012, 9:41:59 AM
    Author     : Perumal S
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
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
.style4 {color: #990000}
-->
        </style>
</head>
    <body bgcolor="#CCCCCC">
     <form action="upload" method="post">
	 <%
         int a11=0;
         String a13="",a1="",a2="",a3="",msg="";
         int a12=0;
          String ok=(String)request.getAttribute("ok1");
          if(ok!=null){
              a1=(String)request.getAttribute("a");
        
 a2=(String)request.getAttribute("a1");
 a3=(String)request.getAttribute("a2");
  msg=(String)request.getAttribute("msg");
          }
          
         out.print(a1+a3+msg);  
          

%>
	 <table width="988" border="0" align="center" bgcolor="#FFFFFF">
 
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
	
		 <td width="231"><div align="center" class="style1"><a href="login.jsp"><strong>Login</strong></a></div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="516"><table width="982" height="498"  border="0"> <%
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
    <td height="240"><table width="928" border="0" align="center">
      <tr>
        <td width="922"><table width="444" border="0" align="center">          <% int index=0;
	try
	{
            

 System.out.println(a11);
		
		String url="jdbc:mysql://localhost:3306/cooperative1";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select max(fid) from upload ");

    			
	 %>   <%
          if (rs.next()) {
				
				a11=Integer.parseInt(rs.getString(1));
                                a12=a11+1;
                                      a13=a12+"";
           %>   <%}else{
                  a12=1000;  
                  a13=a12+"";
           }
           %>

  <tr>
    <td width="169"><span class="style3">File ID </span></td>
    <td width="9">&nbsp;</td>
    <td width="410"><label>
            <input type="text" name="a1" value="<%=a13%>">
    </label></td>
  </tr>
    <%
 
											
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
  <tr>
    <td height="36"><span class="style3">File Name </span></td>
    <td>&nbsp;</td>
    <td><label>
            <input type="file" name="a2" value="<%=a2%>">
    </label></td>
  </tr>
  <tr>
    <td><span class="style3">File Key </span></td>
    <td>&nbsp;</td>
    <td><label>
            <input type="text" name="a3" value="">
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
      <input type="submit" name="t1" value="Add">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="t2" value="Cancel">
    </label></td>
  </tr>
</table>
           
		   
		 </td>
      </tr>
      <tr>
        <td><%
            if(request.getParameter("t1")!=null){
                %>
		<table width="510" border="0" align="center">
<%     try{
                  String ab="C:\\Users\\Ashrutha\\Desktop\\multistorage\\multistorage\\"+request.getParameter("a2");
                 StringBuffer fileData = new StringBuffer(1000);
            ArrayList st=new ArrayList();
		File file = new File(ab);
		long filesize = file.length();
		long filesizeInKB = filesize / 1024;
		System.out.println("Size of File is: " 
		+ filesizeInKB + " KB");
          int aa=(int)filesize/6;
                   System.out.println(file.getName());
                String v,v1[];
                BufferedReader reader = new BufferedReader(new FileReader(ab));
        char[] buf = new char[ aa];
           String readData = null;
        int numRead=0;
        while((numRead=reader.read(buf)) != -1){
  
            readData = String.valueOf(buf, 0, numRead);
            fileData.append(readData);
            buf = new char[aa];
                  
            st.add(readData);
        }
      %>  <tr>
    <td height="34"><span class="style4"><strong>File Size</strong></span></td>
    <td>&nbsp;</td>
    <td><input name="a11" type="text" value="<%=request.getParameter("a1")%>"/></td>
  </tr>
  <tr>
    <td width="164" height="107"><span class="style3">File Block1 </span></td>
    <td width="10">&nbsp;</td>
    <td width="322"><span class="style4">
      <textarea name="a4" cols="50" rows="5"><%=st.get(0)%></textarea>
    </span></td>
  </tr>
  <tr>
    <td><span class="style4"><strong>File Block2 </strong></span></td>
 <td>&nbsp;</td>    <td><span class="style4">
      <textarea name="a5" cols="50" rows="5"><%=st.get(1)%></textarea>
    </span></td>
  </tr>
  <tr>
    <td><span class="style4"><strong>File Block3 </strong></span></td>
    <td>&nbsp;</td>
    <td><span class="style4">
      <textarea name="a6" cols="50" rows="5"><%=st.get(2)%></textarea>
    </span></td>
  </tr>
  <tr>
    <td height="93"><span class="style4"><strong>File Block 4 </strong></span></td>
     <td>&nbsp;</td>
    <td><span class="style4">
      <textarea name="a7" cols="50" rows="5"><%=st.get(3)%></textarea>
    </span></td>
  </tr>
  <tr>
    <td height="96"><span class="style4"><strong>File Block 5 </strong></span></td>
  <td>&nbsp;</td>
    <td><span class="style4">
      <textarea name="a8" cols="50" rows="5"><%=st.get(4)%></textarea>
    </span></td>
  </tr>
  <tr>
    <td height="97"><span class="style4"><strong>File Block 6 </strong></span></td>
     <td>&nbsp;</td>
    <td><span class="style4">
      <textarea name="a9" cols="50" rows="5"><%=st.get(5)%></textarea>
    </span></td>
  </tr>
  <tr>
    <td height="34"><span class="style4"><strong>File Size</strong></span></td>
    <td>&nbsp;</td>
    <td><input name="a10" type="text" value="<%=filesizeInKB%>"/></td>
  </tr>
    <tr>
   <td height="43">&nbsp;</td>
    <td>&nbsp;</td>
    <td><span class="style4">
      <label>
      <input type="submit" name="t3" value="Save">
      &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="t5" value="Save">
      &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" name="t4" value="Delete">
      </label>
    </span></td>
  </tr>

            <%
                     String a4=request.getParameter("a4");
String a5=request.getParameter("a5");
String a6=request.getParameter("a6");
         String a7=request.getParameter("a7");
String a8=request.getParameter("a8");
String a9=request.getParameter("a9");
            System.out.println(a1);
            System.out.println(a2);
            System.out.println(a3);
            System.out.println(a4);
            System.out.println(a5);
            System.out.println(a6);
            System.out.println(a7);
            System.out.println(a8);
                System.out.println(a9);
            
		}catch (Exception e){//Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}%>
</table>
		
		  <p>
		    <%
            
}%>
	<table width="499" border="0" align="center">
	<tr>
    <td><div align="center" class="style3"><%=msg%></div></td>
  </tr>
  <tr>
    <td width="493"><div align="center" class="style3"><%=a1%></div></td>
  </tr>
  <tr>
    <td><div align="center" class="style3"><%=a2%></div></td>
  </tr>
  <tr>
    <td><div align="center" class="style3"><%=a3%></div></td>
  </tr>
</table>

		 </td>
      </tr>
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
